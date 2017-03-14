# Filtering Rows
###### Filtering: WHERE, =, <>, <, <=, >, >=, AND, OR
- WHERE =
- WHERE <>
- WHERE <=
- WHERE >=
- WHERE = x OR = y  
- WHERE > x AND < y

Get all films released in 2015.
```sql
SELECT *
FROM films
WHERE release_year = 2015;
```

Get all people born 1969-02-11.
```sql
SELECT name, birthdate
FROM people
WHERE birthdate = '1969-02-11';
```

Get all films except those released in 2015, order them so we can see results.
```sql
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY release_year;
```

Get films released since 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year > 2000;
FROM films;
```

Get films released before 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year < 2000;
```

Get films released in 1990 or released in 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 2000;
```

Get films released between 1990 and 2000.
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

Get films released between 1990 and 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```

Get films released in 1990 or released in 2000.
```sql
SELECT title, release_year
FROM films
WHERE release_year IN(1990, 2000);
```

Get the number of films released between 2000 and 2015.
```sql
SELECT COUNT(release_year)
FROM films
WHERE release_year BETWEEN 2000 AND 2015;
```

Get films released in 2000 or 2015, in order of release.
```sql
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015)
ORDER BY release_year;
```

Get average duration for films released in 1992.
```sql
SELECT AVG(duration)
FROM films
WHERE release_year = 1992;
```

Get average duration for films released in 2012.
```sql
SELECT AVG(duration)
FROM films
WHERE release_year = 2012;
```

Get the names of people who are still alive.
```sql
SELECT name
FROM people WHERE deathdate IS NULL;
```

Get the number of films made between 2000 and 2015 with budgets over $100 million.
```sql
SELECT title, budget
FROM films
WHERE release_year
BETWEEN 2000 AND 2015
AND budget > 100;
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

Get people whose names start with A, B or C, (redundantly) ordered.
```sql
SELECT name
FROM people
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%'
ORDER BY name;
```
'Get people whose names don't start with A.
```sql
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
```

###### Subqueries
- Subqueries in one table
- Subqueries in two tables
