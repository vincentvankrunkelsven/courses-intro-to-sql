from bs4 import BeautifulSoup, SoupStrainer
from wikiapi import WikiApi
from datetime import datetime, timedelta
from imdbpie import Imdb
import requests
import csv
import re

wiki = None
imdb = None

def setup():
    """
    Sets up global wiki object for Wikipedia lookups.
    """
    global wiki, imdb
    wiki = WikiApi()
    imdb = Imdb(anonymize=True)

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
    res = ''
    if results:
        res = results[0]
    else:
        return None

    # force film result if ambiguous
    for r in results:
        if 'film' in r or '(film)' in r:
            res = r
            # get the first one as displayed by wikipedia
            # more relevant in case of same movie title in multiple years
            break

    # print("wiki results --> {}".format(results))
    # print("url ---> {}".format(res))
    return base_url + res if res else None

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

    if res is None:
        # just to count when no results as opposed to just no info for result
        # return 'N/A'
        return ''
    else:
        if kind == 'person':
            html = get_html(res)
            # won't account for old wiki format of 'infobox vcard'
            # and consequently for pages where 'bday' is not specified in a tag
            # these tend to occur together
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
                        print('budget string --> {}'.format(budget_string))
                        if budget_string:
                            number = fix_millions(budget_string)
                            return number

                elif info == 'box office':
                    inner_table = table.find('th', text='Box office')
                    if inner_table:
                        bo_string = inner_table.find_next_sibling('td').get_text()
                        print('bo string --> {}'.format(bo_string))
                        if bo_string:
                            number = fix_millions(bo_string)
                            return number

                elif info == 'running time':
                    inner_tables = table.find_all('th')
                    run_string = ''
                    for i in inner_tables:
                        if 'Running time' in i.text:
                            run_string = i.parent.text
                            break

                    print('run string --> {}'.format(run_string))

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

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def fix_millions(number_chunk):
    million = 1000000
    temp = [s.strip() for s in number_chunk.split()]

    # fix currency stuff, advance one at a time for currencies with multiple currency denoters
    # we are not converting to USD --> unnecessary
    number_string = temp[0][1:]
    while not is_number(number_string[0]):
        number_string = number_string[1:]

    if '[' in number_string:
        number_string = number_string[:number_string.index('[')]

    # commas in number (we don't replace straight off cause we need to know when num has commas)
    # e.g. $1000 million vs $1,000 vs $1 billion, $1 million vs $1.0 million
    if ',' in number_string:
        number_string = number_string.replace(',', '')
        if is_number(number_string):
                num = float(number_string)
                print('num --> {}'.format(num))
                return str('{0:.2f}'.format(num / million))

    # catch everything else
    if not is_number(number_string):
        return ''

    print("chunk --> {}".format(number_chunk))
    print("string --> {}".format(number_string))
    billions_flag = False

    if len(temp) != 1:
        units = temp[1]
        if 'billlion' in units:
            billions_flag = True
            num = float(number_string)
            return str('{0:.2f}'.format(num * 1000))

    splitters = ['-', '-', '–']
    # print("input ---> {}".format(number_string))

    for s in splitters:
        if s in number_string:
            number_string = number_string[:number_string.index(s)]

    return number_string

def update_actors(input_file='../actors.csv', output_file='../actors.csv'):
    """
    Updates actor information after initial CSV file has been created.
    """
    header, rows = get_rows(input_file, with_header=True)
    f = open(output_file, 'w')
    writer = csv.writer(f)

    header = header + ['date_of_birth'] + ['date_of_death']
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

def update_films(input_file='../films.csv', output_file='../films.csv'):
    """
    Updates film information after initial CSV file has been created.
    """
    header, rows = get_rows(input_file, with_header=True)
    f = open(output_file, 'w')
    writer = csv.writer(f)

    header = header + ['running_time_minutes'] + ['budget_millions'] + ['box_office_millions'] + ['genres']
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
        genres = get_genres(title)
        new_row = [id_] + [title] + [release_year] + [distributor] + [director] + [running_time] + [budget] + [box_office] + [genres]

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
        '%Y-%m-%d',  # 1994-01-22
        '%Y/%m/%d',  # 1994/01/22
        '%m-%d-%Y',  # 01-22-1994
        '%m-%d-%y',  # 01-22-94
        '%m/%d/%Y',  # 01/22/1994
        '%m/%d/%y',  # 01/22/94
        '%b %d, %Y', # January 22, 1994
        '%b %d %Y',  # January 22 1994
    ]

    output_pattern = '%Y-%m-%d' # ISO 8601 format

    for pattern in input_patterns:
        try:
            datetime_obj = datetime.strptime(date, pattern)
            res = datetime_obj.isoformat(' ').split()[0]

        except ValueError as e:
            pass

    return res

# TODO: genres --> genre
def get_genres(title):
    global imdb

    res = imdb.search_for_title(title)

    if res:
        imdb_id = res[0]['imdb_id']
        film = imdb.get_title_by_id(imdb_id)
        genres = film.genres
        if genres:
            return genres
            # return genres[0]

    return ''

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

def get_life_dates(name):


def temp():
    f = open('../films.csv')
    reader = csv.reader(f)

    for row in reader:
        title = row[1]
        get_genres(title)

if __name__ == "__main__":
    # can only run this after the initial CSVs have been populated
    setup()
    # get_genre('the dark knight')
    update_actors()
    # update_films(output_file='../testfilms.csv')
    update_films()
    # test_film('The Woman In Red')
    # test_actor('Chevy Chase')
    # test_actor('Elon Musk')
