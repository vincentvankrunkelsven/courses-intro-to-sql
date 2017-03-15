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

Get all details about every person.
```sql
SELECT *
FROM people;
```

Get every person name and their date of birth where possible.
```sql
SELECT name, birthdate
FROM people;
```

Get every person name and their date of death where possible.
```sql
SELECT name, deathdate
FROM people;
```

Get all the unique film languages.
```sql
SELECT DISTINCT language
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

Count number of films.
```sql
SELECT COUNT(title)
FROM films;
```

Count number of unique languages.
```sql
SELECT COUNT(DISTINCT language)
FROM films;
```

Count number of people.
```sql
SELECT COUNT(*)
FROM people;
```

Count number of dead people.
```sql
SELECT COUNT(deathdate)
FROM people;
```

Get total budget for all films.
```sql
SELECT SUM(budget)
FROM films;
```

Get average duration of all films (v2).
```sql
SELECT AVG(duration)
FROM films;
```

Get worst box office of all films.
```sql
SELECT MIN(gross)
FROM films;
```

Get best box office of all films.
```sql
SELECT MAX(gross)
FROM films;
```

#### Aliasing and Basic Arithmetic: AS, +, -, \*, /, %
- AS
- +
- -
- *
- /
- %

Get total number of unique dates.
```sql
SELECT COUNT(DISTINCT birthdate) + COUNT(DISTINCT deathdate)
AS total_unique_dates
FROM people;
```

Get the profit / loss for each movie where possible.
```sql
SELECT title, gross - budget
AS profit_or_loss
FROM films;
```

Get average duration in hours.
```sql
SELECT AVG(duration) / 60
AS run_time_hours  
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

Get the rounded average duration of all films.
```sql
SELECT ROUND(AVG(duration))
AS rounded_avg_run_time
FROM films;
```

Get the floored average duration of all films.
```sql
SELECT FLOOR(AVG(duration))
AS floored_avg_run_time
FROM films;
```

Get the ceilinged(?) average duration of all films.
```sql
SELECT CEILING(AVG(duration))
FROM films;
```
