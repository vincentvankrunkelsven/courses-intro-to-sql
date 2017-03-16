# Sorting and Grouping
###### Sorting: ORDER BY
-
 (single)
- ORDER BY (multiple)
- ORDER BY DESC (single)
- ORDER BY DESC (multiple)

Get people, sort by name.
```sql
SELECT name
FROM people ORDER BY name;
```

Get people, birthdate order by birthdate.
```sql
SELECT name, birthdate
FROM people
ORDER BY birthdate;
```

Get people, sort by birthdate, then name.
```sql
SELECT name, birthdate
FROM people
ORDER BY birthdate, name;
```

Get films filmed in 2000 or 2015, in order of release, and alphabetically.
```sql
SELECT title, release_year
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, title;
```

Get films filmed between 2000 and 2015, in order of release, and alphabetically.
```sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 2000 AND 2015
ORDER BY release_year, title;
```

Get films released in 2000 or 2015, in order of release.
```sql
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015)
ORDER BY release_year;
```

Get all films except those released in 2015, order them so we can see results.
```sql
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY release_year;
```

Get people whose names start with A, B or C, (redundantly) ordered.
```sql
SELECT name
FROM people
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%'
ORDER BY name;
```

###### Grouping: GROUP BY, HAVING
- GROUP BY (single)
- GROUP BY (multiple)
- GROUP BY then ORDER BY
- GROUP BY with COUNT
- GROUP BY with SUM
- GROUP BY with AVG
- GROUP BY with MIN
- GROUP BY with MAX
- HAVING

Get count of films made in each year.
```sql
SELECT COUNT(release_year), release_year
FROM films
GROUP BY release_year;
```

A PROPER GROUP BY ON MULTIPLE COLUMNS SHOULD GO HERE:
```sql
SELECT title, release_year gross
FROM films
GROUP BY title, release_year, gross;
```

Get count of films, group by release year then order by release year.
```sql
SELECT release_year, COUNT(title) as films_released
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get count of films released in each year, ordered by count, lowest to highest.
```sql
SELECT release_year, COUNT(title) as films_released
FROM films
GROUP BY release_year
ORDER BY count;
```

Get count of films released in each year, ordered by count highest to lowest.
```sql
SELECT release_year, COUNT(title) as films_released
FROM films
GROUP BY release_year
ORDER BY films_released DESC;
```

Get lowest box office earnings per year.
```sql
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get highest box office earnings per year.
```sql
SELECT release_year, MAX(gross)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get the total amount made in each language.
```sql
SELECT language, SUM(gross)
FROM films
GROUP BY language;
```

Get the total amount spent by each country.
```sql
SELECT country, SUM(gross)
FROM films
GROUP BY country;
```

Get the highest box office take per country.
```sql
SELECT country, MAX(gross)
FROM films
GROUP BY country;
```

Get the bottom ten lowest box office take per country.
```sql
SELECT country, MAX(gross)
FROM films
GROUP BY country
ORDER BY max DESC;
```

Get the average amount made by each country.
```sql
SELECT country, AVG(gross)
FROM films
GROUP BY country;
```

Get the total amount made by the bottom ten countries.
```sql
SELECT country, SUM(gross)
FROM films
GROUP BY country
ORDER BY sum
LIMIT 10;
```

Get the total amount spent by the bottom ten countries.
```sql
SELECT country, SUM(budget)
FROM films
GROUP BY country
ORDER BY sum
LIMIT 10;
```

Get rouhnded average box office earnings per year.
```sql
SELECT release_year, ROUND(AVG(gross))
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get lowest and highest box office earnings per year. **Note: with this one, NULL release year still has some entries for min and max.**
```sql
SELECT release_year, MIN(gross), MAX(gross)
FROM films
GROUP BY release_year
ORDER BY release_year DESC;
```

Get the rounded average budget and average box office earnings for movies since 1990, but only if the average budget was greater than $60m in that year (Double check this).
```sql
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) as avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 20000000
ORDER BY release_year DESC;
```

Get the name, average budget, average box office take of countries who have made more than 10 films. Order by name, and get the top five.
```sql
SELECT country, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) as avg_box_office
FROM films
GROUP BY country
HAVING COUNT(title) > 10
ORDER BY country
LIMIT 5;
```
