# Sorting and Grouping
###### Sorting: ORDER BY
- (single)
- ORDER BY (multiple)
- ORDER BY DESC (single)
- ORDER BY DESC (multiple)

Get people, sort by name.
```sql
SELECT name
FROM people ORDER BY name;
```

Get people, in order of when they were born
```sql
SELECT birthdate, name
FROM people
ORDER BY birthdate;
```

Get people, sort by birthdate, then name.
```sql
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

Get films released in 2000 or 2015, in the order they were released.
```sql
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015)
ORDER BY release_year;
```

Get films from in 2000 or 2015, sorted in the order they were released, and how long they were.
```sql
SELECT release_year, duration, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, duration;
```

Get films between 2000 and 2015, sorted by certification and the year they were released.
```sql
SELECT certification, release_year, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY certification, release_year;
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
SELECT release_year, COUNT(release_year)
FROM films
GROUP BY release_year;
```

Get the most spent making a film for each year, for each country.
```sql
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
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
ORDER BY release_year;
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

Get details for the film with the lowest box office earnings per year.
```sql
SELECT release_year, title, gross
FROM films
WHERE release_year IN (
  SELECT release_year
  FROM films
  WHERE gross IN (
    SELECT MIN(gross)
    FROM films
    GROUP BY release_year
  )
);
```

Get details for the film with the highest box office earnings per year.
```sql
SELECT release_year, title, gross
FROM films
WHERE release_year IN (
  SELECT release_year
  FROM films
  WHERE gross IN (
    SELECT MAX(gross)
    FROM films
    GROUP BY release_year
  )
);
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

**Note for the following two, we will need to filter for non NULL, which might be more complex than it seems.**
Get the highest box office take per country.
```sql
SELECT country, MAX(gross)
FROM films
GROUP BY country;
```

Get the bottom ten lowest box office take per country.
```sql
SELECT country, MIN(gross)
FROM films
GROUP BY country
ORDER BY min DESC;
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

Get rounded average box office earnings per year.
```sql
SELECT release_year, ROUND(AVG(gross))
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get lowest and highest box office earnings per year.
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

###### Some Extra Exercises
Count of movies not rated.
```sql
SELECT COUNT(*)
FROM films
WHERE certification = 'Not Rated' OR certification IS NULL;
```

Count of movies not in English.
```sql
SELECT COUNT(*)
FROM films
WHERE language <> 'English';

```

Number of movies in black and white.
```sql
SELECT COUNT(*)
FROM films
WHERE color = 'Black and White';
```

Highest grossing per certification.
```sql
SELECT certification, MAX(gross)
FROM films
GROUP BY certification
ORDER BY max DESC;
```

Count of films in each certification bracket.
```sql
SELECT certification, COUNT(title)
FROM films
GROUP BY certification
ORDER BY count DESC;
```

Country with most R-Rated films.
```sql
SELECT country, COUNT(certification)
FROM films
WHERE certification = 'R'
GROUP BY country
ORDER BY count DESC;
```

Longest duration per year.
```sql
SELECT release_year, MAX(duration) AS max_duration
FROM films
GROUP BY release_year
ORDER BY max_duration DESC;
```

Count of films made per country.
```sql
SELECT country, COUNT(title)
FROM films
GROUP BY country
ORDER BY count DESC;
```

Count of user reviews vs critic reviews.
```sql
SELECT COUNT(num_user) AS count_users, COUNT(num_critic) AS count_critics
FROM reviews;
```

Count of actors.
```sql
SELECT COUNT(*)
FROM roles
WHERE role = 'actor';
```

Count of directors.
```sql
SELECT COUNT(*)
FROM roles
WHERE role = 'director';
```
