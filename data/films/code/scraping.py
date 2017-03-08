from bs4 import BeautifulSoup, SoupStrainer
from wikiapi import WikiApi
from datetime import datetime, timedelta
import requests
import csv
import re

wiki = None

def setup():
    """
    Sets up global wikip object for Wikipedia lookups.
    """
    global wiki
    wiki = WikiApi()

def wiki_search(term):
    """
    Searches for term on Wikipedia, returns URL of first result, else None.

    params:
        term (str): the term you want to search for.
    returns:
        str: URL for the term's Wikipedia page if it exists.
    """
    global wiki
    base_url = 'https://en.wikipedia.org/wiki/'
    results = wiki.find(term)
    return base_url + results[0] if results else ''

def get_html(url):
    resp = requests.get(url)
    return resp.content

def get_rows(csv_file, with_header=False):
    """
    Generator to get all rows in a CSV file, without header.

    params:
        csv_file (str): path to CSV file.
        with_header (bool): flag for if we want header or not
    returns:
        rows of the CSV file, with or without header
    """
    f = open(csv_file, 'r')
    reader = csv.reader(f)
    header = reader.__next__()

    rows = [r for r in reader]

    return header, rows if with_header else rows

def split(delimiters, string):
    """
    Allows us to split based on multiple delimiters.

    params:
        delimiters (list): a list of string delimiters
        string: the string to split
    returns:
        list: list of strings as per split criteria
    """
    regexPattern = '|'.join(map(re.escape, delimiters))
    return re.split(regexPattern, string)

def test():
    setup()
    print(get_wiki_info('elon musk', 'person', 'bday'))

def get_wiki_info(title, kind, info):
    """
    params:
        name (str): the name of the person
        kind (str): person or film
        info (str): info you want, e.g. 'birthday', 'dday deathdate'
    returns:
        str: the information from the bio box, if possible, else empty string
    """
    res = wiki_search(title)

    if res:
        if kind == 'person':
            html = get_html(res)
            strainer = SoupStrainer('table', attrs={'class':'infobox biography vcard'})
            table = BeautifulSoup(html, 'html.parser', parse_only=strainer)

            if table:
                span = table.find('span', attrs={'class': info})
                if span:
                    bday = span.renderContents()
                    # TODO: unicode is the worst, might have to change this
                    # TODO: consider : u'aあä'.encode('ascii', 'ignore') --> 'a'
                    return bday.decode('utf-8') if type(bday) == bytes else bday

        elif kind == 'film':
            html = get_html(res)
            strainer = SoupStrainer('table', attrs={'class':'infobox vevent'})
            table = BeautifulSoup(html, 'html.parser', parse_only=strainer)

            if table:
                if info == 'budget':
                    inner_table = table.find('th', text='Budget')
                    if inner_table:
                        budget_string = inner_table.find_next_sibling('td').get_text()
                        if budget_string:
                            temp = budget_string.split()

                            if len(temp) == 1:
                                # TODO: fix for weirdly formatted budgets
                                return ''
                            else:
                                number = fix_millions(temp[0][1:])
                                units = temp[1]
                                return str(float(number) * 1000) if 'billion' in units else number

                elif info == 'box office':
                    inner_table = table.find('th', text='Box office')
                    if inner_table:
                        bo_string = inner_table.find_next_sibling('td').get_text()
                        if bo_string:
                            temp = bo_string.split()

                            if len(temp) == 1:
                                    # TODO: fix for weirdly formatted budgets
                                    return ''
                            else:
                                number = fix_millions(temp[0][1:])
                                units = temp[1]
                                return str(number * 1000) if 'billion' in units else number

                elif info == 'running time':
                    inner_tables = table.find_all('th')
                    run_string = ''
                    for i in inner_tables:
                        if 'Running time' in i.text:
                            run_string = i.parent.text
                            break

                    if run_string:
                        temp = run_string.split()
                        illegals = [',', '-', '-', '–']
                        number = temp[2]
                        for i in illegals:
                            if i in number:
                                return ''

                        # units = temp[1]
                        # TODO: fix if not always minutes
                        return number
    return ''

def fix_millions(number_string):
    illegals = [',', '-', '-', '–']

    for i in illegals:
        if i in number_string:
            return ''

    number = float(number_string)
    return number

def update_actors(input_file='actors.csv', output_file='horse.csv'):
    """
    Updates actor information after initial CSV file has been created.
    """
    header, rows = get_rows(input_file, with_header=True)
    f = open(output_file, 'w')
    writer = csv.writer(f)

    header = header + ['dob'] + ['dod']
    writer.writerow(header)

    for row in rows:
        id_ = row[0]
        name = row[1]
        print("fetching info for --> {}".format(name))
        dob = format_date(get_wiki_info(name, 'person', 'bday'))
        dod = format_date(get_wiki_info(name, 'person', 'dday deathdate'))
        new_row = [id_]  + [name] + [dob] + [dod]
        writer.writerow(new_row)

    print("Finished writing to file.")

def update_films(input_file='films.csv', output_file='films.csv'):
    """
    Updates film information after initial CSV file has been created.
    """
    header, rows = get_rows(input_file, with_header=True)
    f = open(output_file, 'w')
    writer = csv.writer(f)

    header = header + ['running_time_minutes'] + ['budget_millions'] + ['box_office_millions']
    writer.writerow(header)

    for row in rows:
        id_ = row[0]
        title = row[1]
        release_year = row[2]
        distributor = row[3]
        director = row[4]
        running_time = get_wiki_info(title, 'film', 'running time')
        budget = get_wiki_info(title, 'film', 'budget')
        box_office = get_wiki_info(title, 'film', 'box office')

        new_row = [id_] + [title] + [release_year] + [distributor] + [director] + [running_time] + [budget] + [box_office]
        print(new_row)
        writer.writerow(new_row)

def format_date(date):
    """
    Ensures dates are in proper format, and also Python datetime module can't
    handle dates before 1900, so this is a helper function to avoid
    embarrassing time-related chaos.

    params:
        date (str): a date represented as as string, in some format.
    returns:
        str: the ISO 8601 formatted date
    """
    res = ''

    input_patterns = [
        '%Y-%m-%d', # 1994-01-22
        '%Y/%m/%d', # 1994/01/22
        '%m-%d-%Y', # 01-22-1994
        '%m-%d-%y', # 01-22-94
        '%m/%d/%Y', # 01/22/1994
        '%m/%d/%y'  # 01/22/94
    ]

    output_pattern = '%Y-%m-%d' # ISO 8601 format

    for pattern in input_patterns:
        try:
            datetime_obj = datetime.strptime(date, pattern)
            res = datetime_obj.isoformat(" ").split()[0]

        except ValueError as e:
            pass

    return res

def test_actor(name):
    """
    Test fetching info for a specific actor.

    params:
        name (str): name of the given actor.
    """
    print(format_date(get_wiki_info(name, 'person', 'bday')))
    print(format_date(get_wiki_info(name, 'person', 'dday deathdate')))

def test_film(title):
    """
    Test fetching info for a specific actor.

    params:
        name (str): name of the given actor.
    """
    setup()
    print(get_wiki_info(title, 'film', 'running time'))
    print(get_wiki_info(title, 'film', 'budget'))
    print(get_wiki_info(title, 'film', 'box office'))

if __name__ == "__main__":
    # can only run this after the initial CSVs have been populated
    setup()
    # update_actors()
    # update_films()
