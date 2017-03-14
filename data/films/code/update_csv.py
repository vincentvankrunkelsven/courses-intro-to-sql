import csv
import scraping

def update_people(input_csv='../people.csv', output_csv='../people.csv'):
    f_in = open(input_csv, 'r')
    reader = csv.reader(f_in)
    header = reader.__next__()
    header += ['birthdate', 'deathdate']

    f_out = open(output_csv, 'w')
    writer = csv.writer(f_out)
    writer.writerow(header)

    for row in reader:
        name = row[1]
        print(name)
        birthdate, deathdate = scraping.get_life_events(name)
        new_row = row + [birthdate, deathdate]
        print(new_row)
        writer.writerow(new_row)

def test_person(name):
    print(scraping.get_life_events(name))

if __name__== '__main__':
    update_people()
