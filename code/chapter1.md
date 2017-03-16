# Selecting and summarizing columns
#### Selecting Columns: SELECT, SELECT DISTINCT
- SELECT (single)
- SELECT (multiple)
- SELECT DISTINCT

Get every person's name.
```sql
SELECT name
FROM people;
```

Get every person's name and their date of birth where possible.
```sql
SELECT name, birthdate
FROM people;
```

Get every person name and their date of death where possible.
```sql
SELECT name, deathdate
FROM people;
```

Get everyone's name, date of birth, and date of death (where possible).
```sql
SELECT name, birthdate, deathdate
FROM people;
```

Get all the films.
```sql
SELECT *
FROM films;
```

Get all the different film languages.
```sql
SELECT DISTINCT language
FROM films;
```

Get the different types of film roles.
```sql
SELECT DISTINCT role
FROM roles;
```

Get all the different IMDB scores.
```sql
SELECT DISTINCT imdb_score
FROM reviews;
```

Get all the different certification categories.
```sql
SELECT DISTINCT certification
FROM films;
```

Get all the different countries.
```sql
SELECT DISTINCT country
FROM films;
```

#### Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- COUNT
- COUNT DISTINCT
- COUNT(column_name) vs COUNT(\*)
- SUM (single)
- AVG (single)
- MIN (single)
- MAX (single)

Count the number of films.
```sql
SELECT COUNT(title)
FROM films;
```

Count the number of unique languages.
```sql
SELECT COUNT(DISTINCT language)
FROM films;
```

Count the number of unique countries.
```sql
SELECT COUNT(DISTINCT country)
FROM films;
```

Count the total number of people.
```sql
SELECT COUNT(*)
FROM people;
```

Count the number of dead people.
```sql
SELECT COUNT(deathdate)
FROM people;
```

Count the number of years the dataset covers.
```sql
SELECT COUNT(DISTINCT release_year)
FROM films
```

Get the total amount spend on films.
```sql
SELECT SUM(budget)
FROM films;
```

Get the average duration of all films (v2).
```sql
SELECT AVG(duration)
FROM films;
```

Get worst box office performance out of all films.
```sql
SELECT MIN(gross)
FROM films;
```

Get best box office performance of all films.
```sql
SELECT MAX(gross)
FROM films;
```

#### Aliasing and Basic Arithmetic: AS, +, -, \*, /, %
- AS
- Addition
- Subtraction
- Multiplication
- Division
- Modulo

Get total number of unique dates.
```sql
SELECT COUNT(DISTINCT birthdate) + COUNT(DISTINCT deathdate)
AS total_unique_dates
FROM people;
```

Get the profit (or loss) for each movie, where possible.
```sql
SELECT title, gross - budget
AS profit
FROM films;
```

Get the average film duration in hours.
```sql
SELECT AVG(duration) / 60
AS duration_hours  
FROM films;
```

Get the percentage of dead people.
```sql
SELECT COUNT(deathdate) * 100 / COUNT(*)
AS percentage_dead
FROM people;
```

Check if there's an even number of unique languages. (0 = yes, 1 = no)
```sql
SELECT COUNT(DISTINCT language) % 2
AS result
FROM films;
```

Get the number of decades this dataset covers.
```sql
SELECT COUNT(DISTINCT release_year) / 10
FROM films;
```

Number of years between oldest film and newest film.
```sql
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```

#### Rounding Functions: ROUND, FLOOR, CEILING
- ROUND AVG
- FLOOR AVG
- CEILING AVG

Get the average duration of all films, rounded to the nearest minute.
```sql
SELECT ROUND(AVG(duration))
AS rounded_avg_run_time
FROM films;
```

Get the average duration of all films, rounded down to nearest minute.
```sql
SELECT FLOOR(AVG(duration))
AS floored_avg_run_time
FROM films;
```

Get the average duration of all films, rounded up to the nearest minute.
```sql
SELECT CEILING(AVG(duration))
FROM films;
```
