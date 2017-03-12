# Sorting and Grouping
###### Sorting: ORDER BY
- ORDER BY (single)
- ORDER BY (multiple)
- ORDER BY DESC (single)
- ORDER BY DESC (multiple)

Get actors, sort by name.
```sql
SELECT name
FROM actors ORDER BY name;
```

Get actors, sort by name.
```sql
SELECT name
FROM actors
ORDER BY date_of_birth;
```

Get actors, sort by date_of_birth, then name.
```sql
SELECT name, date_of_birth
FROM actors
ORDER BY date_of_birth, name;
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
SELECT title, release_year box_office_millions
FROM films
GROUP BY title, release_year, box_office_millions;
```

Get count of films, group by release year then order by release year.
```sql
SELECT COUNT(title), release_year
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get count of films made in each year, ordered by count.
```sql
SELECT COUNT(release_year), release_year
FROM films
GROUP BY release_year
ORDER BY count;
```

Get lowest box office earnings per year.
```sql
SELECT release_year, MIN(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get highest box office earnings per year.
```sql
SELECT release_year, MAX(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get average box office earnings per year.
```sql
SELECT release_year, AVG(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get lowest and highest box office earnings per year. **Note: 2016, 2017 data is incomplete.**
```sql
SELECT release_year, MIN(box_office_millions), MAX(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year DESC;
```

Get the average budget and average box office earnings for movies since 1990, but only if the average budget was greater than $60m in that year (Double check this).
```sql
SELECT release_year, AVG(budget_millions) AS avg_budget, AVG(box_office_millions) as avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget_millions) > 60;
```
