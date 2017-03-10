# Selecting and summarizing columns
##### Selecting Columns: SELECT, SELECT DISTINCT
- SELECT (single)
- SELECT (multiple)
- SELECT DISTINCT

Get every actor name.
```sql
SELECT name
FROM actors;
```

Get all details.
```sql
SELECT *
FROM actors;
```

Get every actor name and their date of birth where possible.
```sql
SELECT name, date_of_birth
FROM actors;
```

Get every actor name and their date of death where possible.
```sql
SELECT name, date_of_death
FROM actors;
```

Get the names of unique distributors.
```sql
SELECT DISTINCT distributor
FROM films;
```

##### Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- COUNT
- COUNT DISTINCT
- COUNT(column_name) vs COUNT(\*)
- SUM (single)
- AVG (single)
- MIN (single)
- MAX (single)

Count number of directors.
```sql
SELECT COUNT(directors)
FROM films;
```

Count number of unique directors.
```sql
SELECT COUNT(DISTINCT directors)
FROM films;
```

Count number of rows in table / number of actors.
```sql
SELECT COUNT(*)
FROM actors;
```

Count number of dead actors.
```sql
SELECT COUNT(date_of_death)
FROM actors;
```

Get total budget for all films.
```sql
SELECT SUM(budget_millions)
FROM films;
```

Get average runtime of all films (v2).
```sql
SELECT AVG(run_time_mins)
FROM films;
```

Get worst box office of all films.
```sql
SELECT MIN(box_office_millions)
FROM films;
```

Get best box office of all films.
```sql
SELECT MAX(box_office_millions)
FROM films;
```

##### Basic Arithmetic: +, -, \*, /, %
- AS
- ADDITION
- SUBTRACTION
- MULTIPLICATION
- DIVISION
- MODULO

Get best box office of all films.
```sql
SELECT title, MAX(box_office_millions)
AS highest_grossing
FROM films;
```

Get best box office of all films.
```sql
SELECT title, MIN(box_office_millions)
AS biggest_flop
FROM films;
```

Get total number of unique dates.
```sql
SELECT COUNT(DISTINCT date_of_birth) + COUNT(DISTINCT date_of_death)
AS total_unique_dates
FROM actors;
```

Get the profit / loss for each movie where possible.
```sql
SELECT title, box_office_millions - budget_millions
AS profit_or_loss
FROM films;
```

Get the percentage of dead actors.
```sql
SELECT COUNT(date_of_birth) * 100 / COUNT(*)
AS percentage_dead
FROM actors;
```

Check if there's an even number of unique distributors. (0 = yes, 1 = no)
```sql
SELECT COUNT(DISTINCT distributor) % 2
AS result
FROM films;
```

##### Rounding Functions: ROUND, FLOOR, CEILING
- ROUND AVG
- FLOOR AVG
- CEILING AVG

Get the rounded average runtime of all films.
```sql
SELECT ROUND(AVG(run_time_mins))
FROM films;
```

Get the floored average runtime of all films.
```sql
SELECT FLOOR(AVG(run_time_mins))
FROM films;
```

Get the ceilinged average runtime of all films.
```sql
SELECT CEILING(AVG(run_time_mins))
FROM films;
```
