# Filtering Rows
###### Filtering: WHERE, =, <>, <, <=, >, >=, AND, OR
- WHERE =
- WHERE <>
- WHERE <=
- WHERE >=
- WHERE = x OR = y  
- WHERE > x AND < y

Get all films released in 2016.
```sql
SELECT *
FROM films
WHERE release_year = 2016;
```

Get all French language films.
```sql
SELECT *
FROM films
WHERE language = 'French';
```

Get the duration of the longest movie made in the USA.


Get the name of the person born on November 11th, 1974.
```sql
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';
```

Get the number of films released before 2000.
```sql
SELECT COUNT(*)
FROM films
WHERE release_year < 2000;
```

Get the title and release year of films released since 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year > 2000;
FROM films;
```

Get all Spanish films released before 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year < 2000
AND language = 'Spanish';
```

Get the all Spanish films released since 2000.
```sql
SELECT *
FROM films
WHERE release_year > 2000
AND language = 'Spanish';
```

Get the number of Hindi movies.
```sql
SELECT COUNT(*)
FROM films
WHERE language = 'Hindi';
```

Get the number of movies with an R certification.
```sql
SELECT *
FROM films
WHERE certification = 'R';
```

Get films released in 1990 or released in 2000 in English or Spanish.
```sql
SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 2000
AND language = 'French' OR language = 'Spanish';
```

Get films released since 2000 that are in French or Spanish, and made more than $20m.
```sql
SELECT *
FROM films
WHERE release_year > 2000
AND language = 'French' OR language = 'Spanish'
AND gross > 20000000;
```

Get films released in the 90s.
```sql
SELECT title, release_year
FROM films
WHERE release_year >= 1990 AND release_year <= 2000;
FROM films;
```

###### Advanced Filtering: BETWEEN, IN, IS NULL, IS NOT NULL, LIKE, NOT LIKE
- BETWEEN x AND y
- WHERE n IN (x, y, z)
- WHERE x IS NULL
- WHERE x IS NOT NULL
- LIKE
- NOT LIKE

Get films released in the 90s.
```sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```

Get the number of films released in the 90s.
```sql
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```

Get films released in  in 1990 or released in 2000 that were longer than two hours.
```sql
SELECT title, release_year
FROM films
WHERE release_year IN(1990, 2000)
AND duration > 120;
```

Get the number of films released between 2000 and 2015 that were longer than two hours.
```sql
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 2000 AND 2015
AND duration > 120;
```

Get average duration for films released in France in 1992.
```sql
SELECT AVG(duration)
FROM films
WHERE release_year = 1992
AND country = 'France';
```

Get average duration for films released in the UK in 2012.
```sql
SELECT AVG(duration)
FROM films
AS average_duration
WHERE release_year = 2012
AND COUNTRY = 'UK';
```

Get the names of people who are still alive.
```sql
SELECT name
FROM people
WHERE deathdate IS NULL;
```

Get the number of films made between 2000 and 2015 with budgets over $100 million.
```sql
SELECT title, budget
FROM films
WHERE release_year
BETWEEN 2000 AND 2015
AND budget > 100000000;
```

Get people whose names begin with 'B'.
```sql
SELECT name
FROM people
WHERE name LIKE 'B%';
```

Get people whose names begin with 'Br'.
```sql
SELECT name
FROM people
WHERE name LIKE 'B%';
```

Get people whose names have 'r' as the second letter.
```sql
SELECT name
FROM people
WHERE name LIKE '_r%';
```

Get people whose names don't start with A.
```sql
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
```

###### Subqueries
- Subqueries in one table
Get the title, duration and release year of the shortest film(s).
```sql
SELECT title, duration, release_year
FROM films
WHERE duration = (
  SELECT MIN(duration) FROM films
);
```

Get the title, duration and release year of the longest film(s).
```sql
SELECT title, duration, release_year
FROM films
WHERE duration = (
  SELECT MAX(duration)
  FROM films
);
```

Get the title, release_year and box office take for the highest grossing film.
```sql
SELECT title, release_year, gross
FROM films
WHERE gross = (
  SELECT MAX(gross)
  FROM films
);
```

Get the title, release_year and box office take for the lowest grossing film.
```sql
SELECT title, release_year, gross
FROM films
WHERE gross = (
  SELECT MIN(gross)
  FROM films
);
```

- Subqueries in two tables
