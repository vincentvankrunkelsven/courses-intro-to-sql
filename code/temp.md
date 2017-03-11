# Selecting and summarizing columns
###### Selecting Columns: SELECT, SELECT DISTINCT
- SELECT (single)
- SELECT (multiple)
- SELECT DISTINCT


###### Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- COUNT
- COUNT DISTINCT
- COUNT(column_name) vs COUNT(\*)
- SUM (single)
- AVG (single)
- MIN (single)
- MAX (single)

###### Basic Arithmetic: +, -, \*, /, %
- AS
- ADDITION
- SUBTRACTION
- MULTIPLICATION
- DIVISION
- MODULO

###### Rounding Functions: ROUND, FLOOR, CEILING
- ROUND AVG
- FLOOR AVG
- CEILING AVG

###### SELECT Statements
Get every actor name.
```sql
SELECT name
FROM actors;
```

Get every actor name and date of birth for that actor.
```sql
SELECT name, date_of_birth
FROM actors;
```

Get every actor name and date of death for that actor.
```sql
SELECT name, date_of_death
FROM actors;
```

Get everything.
```sql
SELECT *
FROM actors;
```

###### DISTINCT Statements
Get unique dates of birth.
```sql
SELECT DISTINCT date_of_birth
FROM actors;
```

[//]: # (not unique)
Get names and dates of birth of every actor with a unique date of birth.
```sql
SELECT DISTINCT name, date_of_birth
FROM actors;
```

###### COUNT Function
Count number of actors.
```sql
SELECT COUNT(name)
FROM actors;
```

Count number of birthdays.
```sql
SELECT COUNT(date_of_birth)
FROM actors;
```

Count number of unique directors.
```sql
SELECT COUNT(DISTINCT date_of_birth)
FROM films;
```

Count number of rows in table.
```sql
SELECT COUNT(*)
FROM actors;
```

Get number of actors who are dead.
```sql
SELECT COUNT(date_of_death)
FROM actors;
```

Get number of actors who are still alive.
```sql
SELECT COUNT(*) - COUNT(date_of_death)
FROM actors;
```


###### SUM, MIN, MAX, AVG Function
Get shortest runtime of all films.
```sql
SELECT MIN(run_time_mins)
FROM films;
```

Get longest runtime of all films.
```sql
SELECT MAX(run_time_mins)
FROM films;
```

Get name and runtime for the longest film.
```sql
SELECT title, run_time_mins  FROM films WHERE run_time_mins = (select max(run_time_mins) from films);
```

Get total budget for all films.
```sql
SELECT SUM(budget)
FROM films;
```

Get average runtime of all films (v1).
```sql
SELECT SUM(run_time_mins)/COUNT(run_time_mins)
FROM films;
```

Get average runtime of all films (v2).
```sql
SELECT AVG(run_time_mins)
FROM films;
```

Get average runtime in hours.
```sql
SELECT AVG(run_time_mins) / 60
FROM films;
```

[//]: # (you may have noticed we have ?column?.. use aliases)
Get average runtime in hours.
```sql
SELECT AVG(run_time_mins) / 60 as average_run_time
FROM films;
```

###### ROUND, FLOOR, CEILING
Round the average run time.
```sql
SELECT ROUND(AVG(run_time_mins) / 60) as rounded_average_run_time
FROM films;
```

Floor the average run time.
```sql
SELECT ROUND(AVG(run_time_mins) / 60) as rounded_average_run_time
FROM films;
```

Ceiling the average run time.
```sql
SELECT ROUND(AVG(run_time_mins) / 60) as rounded_average_run_time
FROM films;
```

Number of years between earliest movie and latest movie.
```sql
SELECT max(release_year) - min(release_year) as difference
FROM films;
```

Number of years between earliest movie and latest movie, absolute val.
```sql
SELECT ABS(max(release_year) - min(release_year)) AS difference
FROM films;
```

###### Filtering
Filter for a birthday.
```sql
SELECT name, date_of_birth FROM actors WHERE date_of_birth = '1969-02-11';
FROM films;
```

Get movies released since 2000.
```sql
SELECT title, release_year from films where release_year >= 2000;
FROM films;
```

Get films released before 2000.
```sql
SELECT title, release_year from films where release_year < 2000;
FROM films;
```

[//]: # (we can do BETWEEN at a later point)
Get films released between 1990 and 2000.
```sql
SELECT title, release_year from films where release_year >= 1990 and release_year <= 2000;
FROM films;
```

[//]: # (we can do select * films, and see the movie 50 first dates is 2004, let's get every year except 2004)
Get films for every year but 2004.
```sql
SELECT title, release_year from films where release_year <> 2004;
FROM films;
```

Get average runtime for films released in 1992.
```sql
SELECT AVG(run_time_mins) from films where release_year = 1992;
FROM films;
```

Get average runtime for films released in 2012.
```sql
SELECT AVG(run_time_mins) from films where release_year = 2012;
FROM films;
```

[//]: # (not sure how this should be indented yo, also this might be too complicated and better left to the subqueries section)
Get the difference between average runtimes in 2012 and 1992.
```sql
SELECT
  (SELECT AVG(run_time_mins) from films where release_year = 2012) -
  (SELECT AVG(run_time_mins) from films where release_year = 1992)
AS difference;
```

Get the number of films released between 2000 and 2015.
```sql
SELECT COUNT(release_year)
FROM films
WHERE release_year BETWEEN 2000 AND 2015;
```

Get the names of actors who are still alive.
```sql
SELECT name
FROM actors WHERE date_of_death IS NULL;
```

Get the number of films made between 2000 and 2015 with budgets over $100 million.
```sql
SELECT title, budget_millions
FROM films
WHERE release_year
BETWEEN 2000 AND 2015
AND budget_millions > 100;
```

Get films filmed in 2000 or 2015.
```sql
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015);
```

Get films filmed in 2000 or 2015, in order of release.
```sql
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015)
ORDER BY release_year;
```

###### LIKE, wildcards and stuff.
[//]: # (be nice to do this with dobs instead)
Get actors whose names begin with 'B'.
```sql
SELECT name
FROM actors
WHERE name LIKE 'B%';
```

Get actors whose names begin with 'Br'.
```sql
SELECT name
FROM actors
WHERE name LIKE 'B%';
```

Get actors whose names have 'r' as the second letter.
```sql
SELECT name
FROM actors
WHERE name LIKE '_r%';
```

[//]: # (not sure why this doesn't work)
Get actors whose names start with letters between 'a' and 'f'.
```sql
SELECT name
FROM actors
WHERE name LIKE '[A-F]%';
```

[//]: # (surely there's a better way to do this)
Get actors whose names start with A, B or C.
```sql
SELECT name
FROM actors
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%';
```
'Get actors whose names don't start with A.
```sql
SELECT name
FROM actors
WHERE name NOT LIKE 'A%';
```

###### Subqueries
Get the difference between average runtimes in 2012 and 1992.
```sql
SELECT
  (SELECT AVG(run_time_mins) from films where release_year = 2012) -
  (SELECT AVG(run_time_mins) from films where release_year = 1992)
AS difference;
```

[//]: # (not sure where we can do two table subqueries)
[//]: # (remember, double quotes are for col names not values - single quotes for values)

###### ORDER BY
Get actors, sort by name (ASC is implicit).
```sql
SELECT name
FROM actors ORDER BY name;
```

Get actors, sort by name (descending).
```sql
SELECT name
FROM actors ORDER BY name;
```

```sql
SELECT name
FROM actors ORDER BY name;
```

[//]: # (maybe clarify that it's not a range by using more vals?)
Get films filmed in 2000 or 2015, alphabetically in order of release.
```sql
SELECT title, release_year
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, title;
```

###### GROUP BY
[//]: # (group by single col)
Get count of films made in each year.
```sql
SELECT COUNT(release_year), release_year
FROM films
GROUP BY release_year
```

[//]: # (group by multiple cols)

Get count of films made in each year, ordered by year.
```sql
SELECT COUNT(release_year), release_year
FROM films
GROUP BY release_year
ORDER BY COUNT(release_year);
```

[//]: # (not sure if syntax is right here)
Get count of films made in each year, ordered by count.
```sql
SELECT COUNT(release_year), release_year
FROM films
GROUP BY release_year
ORDER BY COUNT(release_year);
```

[//]: # (compare and contrast with order by)
Get films, group by release year.
```sql
SELECT COUNT(title), release_year
FROM films
GROUP BY release_year;
```

Get count of films, group by release year.
```sql
SELECT COUNT(title), release_year
FROM films
GROUP BY release_year;
```

Get count of films, group by release year then order by release year.
```sql
SELECT COUNT(title), release_year
FROM films
GROUP BY release_year
ORDER BY release_year;
```

Get highest box office earnings per year.
```sql
SELECT release_year, max(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year;
```

[//]: # (we don't have enough data for 2016, 2017 for this)
Get lowest and highest box office earnings per year.
```sql
SELECT release_year, min(box_office_millions), max(box_office_millions)
FROM films
GROUP BY release_year
ORDER BY release_year DESC;
```

[//]: # (so basically, do first part of code, then get max of that)
Which year had the most films?
```sql
SELECT COUNT(title), release_year
FROM films
GROUP BY release_year
ORDER BY release_year;
-- how do I get max of all this?
```
###### HAVING (nb: dis is confusing)
[//]: # (does this do what I think it does?)
```sql
SELECT release_year, AVG(budget_millions) as avg_budget, AVG(box_office_millions) as avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING run_time_mins > 60;
```


###### Ideas for NYC Citibike data.
[//]: # ("tripduration","starttime","stoptime","start station id","start station name","start station latitude","start station longitude","end station id","end station name","end station latitude","end station longitude","bikeid","usertype","birth year","gender")

Are we not keeping in the birth year and gender? They would be cool.

- how many trips were made?
- how many stations are there?
- how many weather events are there? (not just rows)
- how many different bikes are there? (unique bike ids)
- how long was the longest trip?
- how long was the shortest trip?
- how long is the average trip (seconds)
- how long is the average trip (minutes)?
- using LIMIT to limit number of rows shown
- how much time total was spent on trips? (seconds)
- how much time total was spent on trips? (hours)
- how much time total was spent on trips? (days)
- who's more likely to use bikes, males or females?
- average time spent by males?
- average time spent by females?
- how many days did it rain? (both just 'rain' and also 'rain-fog' or 'rain-fog')
- how many days did it not rain?
- how many days did it snow?
- how many days was it cloudy? (note, we have 0 cloud cover but also null cloud cover)
- how many days was cloud > 5?
- how many days did it rain more than 0.5 inches?
- what was the average temperature for the year?
- what was the average temperature for the year?
- what was the average temperature in January? (again, requires date stuff)
- are there any days on which no trips were made?
- how many trips were made on Christmas day / New Year's Day? (may require date types tho)
- who's more likely to use bikes on Christmas Day, males or females?
- who spends more time on bikes, males or females?
- what's the average age of males using bikes?
- what's the average age of females using bikes?
- how many stops are there?
- which stop is the busiest?
- which stop is the busiest on Christmas Day?
- which stop is most popular with males?
- which stop is most popular with females?
- do people take less trips when it's raining?
- do people take more trips when it's raining?
- do people spend less time on bikes when it's raining?
- average time spent on bikes in rain?
- do people spend more time on bikes when it's sunny?
- dates of snowstorm: how many people used bikes these days?
- which date had the most trips?
- which date had the least trips?
- how many riders during the week?
- how many riders during the weekend?
- percentages riding during week?
- percentages riding during weekend?
- how many trips between X and Y?
- which station has the most connections other stations? (nodes)
- which station has the least connections other stations? (nodes)
- which station is started at most often?
- which station is stopped at most often?
- which route is the longest (as per duration) between start and stop stations?
- which route is the shortest (as per duration) between start and stop stations?
- average duration by starting station?
- average duration by stopping station?
