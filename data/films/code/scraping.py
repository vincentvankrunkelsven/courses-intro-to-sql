from bs4 import BeautifulSoup, SoupStrainer
from datetime import datetime, timedelta
from imdbpie import Imdb
import requests
import pandas as pd

IMDB_BASE = 'http://www.imdb.com/name/'

imdb = None

def setup():
    global imdb
    imdb = Imdb(anonymize=True)

def imdb_person_search(name):
    global imdb
    res = imdb.search_for_person(name)

    if res:
        imdb_id = res[0]['imdb_id']
        return imdb_id
    return ''

def get_html(url):
    resp = requests.get(url)
    return resp.content

def get_imdb_birthdate(url):
    html = get_html(url)
    strainer = SoupStrainer('div', attrs={'id': 'name-born-info'})
    soup = BeautifulSoup(html, 'html.parser', parse_only=strainer)

    # we check for empty string cause we always have bs4 object
    if soup.get_text():
        birthdate = soup.find('time', attrs={'itemprop': 'birthDate'})
        if birthdate:
            return birthdate['datetime']
    return ''

def get_imdb_deathdate(url):
    html = get_html(url)
    strainer = SoupStrainer('div', attrs={'id': 'name-death-info'})
    soup = BeautifulSoup(html, 'html.parser', parse_only=strainer)

    # we check for empty string cause we always have bs4 object
    if soup.get_text():
        deathdate = soup.find('time', attrs={'itemprop': 'deathDate'})
        if deathdate:
            return deathdate['datetime']
    return ''

def format_date(date):
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

def get_life_events(name):
    res = imdb_person_search(name)

    if res:
        imdb_id = res
        print(imdb_id)
        if imdb_id:
            url = IMDB_BASE + imdb_id
            birth_date = format_date(get_imdb_birthdate(url))
            death_date = format_date(get_imdb_deathdate(url))
            return birth_date, death_date
    return '',''

setup()
