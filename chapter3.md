---
title: Sorting and Grouping
description: >-
  Now that you've learned how to select the rows and columns you're most
  interested in, you'll take your analyses to the next level by learning how to
  sort and group tables by variables of interest. In particular, you'll see how
  to combine GROUP BY with aggregate functions like SUM and AVG to summarize
  your data within groups — a very powerful paradigm!

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:ac6d71b0e4
## ORDER BY in the courtroom

In SQL, the `ORDER BY` keyword is used to sort the result set in ascending or descending order. By default `ORDER BY` will sort in ascending order. If you want to sort the results in descending order, you use the `DESC` keyword. 

For example, 

```
SELECT title 
FROM films 
ORDER BY release_year;
```

will give you the titles of films sorted by release year, from newest to oldest. 

What way does `ORDER BY` sort results by default?

*** =instructions
- Alphabetically 
- Descending
- Ascending
- In order of creation date

*** =hint
By default, `ORDER BY` behaves as if it was using the `ASC` keyword.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = 'Correct!'
alphabetically = 'Incorrect. Although results may be in alphabetical order, how would we order numbers alphabetically?'
descending = 'Incorrect. Results are not ordered descending by default.'
creation = 'Incorrect. Results are not ordered by creation date by default.'

Ex().test_mc(3, [alphabetically, descending, success_msg, creation])
```

--- type:BulletExercise lang:sql xp:100 key:a7b2964ba6
## Sorting single columns (ASC)

Now that you understand how `ORDER BY` works, give the exercises a go!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM ___
___ ___ ___;
```

*** =type1: NormalExercise
*** =key1: e3a06cce15

*** =instructions1
Get the names of people, sorted by name.
*** =solution1
```{sql}
SELECT name
FROM people
ORDER BY name;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

*** =type2: NormalExercise

*** =key2: 14a2792baa

*** =instructions2
Get the names of people, sorted by birthdate.
*** =solution2
```{sql}
SELECT name
FROM people
ORDER BY birthdate;
```
*** =sct2
```{sql}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 6cfeca71b1

*** =instructions3
Get the birth date and name for every person, in order of when they were born.
*** =solution3
```{sql}
SELECT birthdate, name
FROM people
ORDER BY birthdate;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='birthdate', match='any')
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: e2702b5933

*** =instructions4
Get the title and release year of films released in 2000 or 2015, in the order they were released.
*** =solution4
```{sql}
SELECT title, release_year
FROM films
WHERE release_year in (2000, 2015)
ORDER BY release_year;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```

*** =type5: NormalExercise
*** =key5: 5c84507976

*** =instructions5
Get all details for all films except those released in 2015 and order them so we can see the results.
*** =solution5
```{sql}
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY release_year;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:BulletExercise lang:sql xp:100 key:a7b2964ba7
## Sorting single columns (DESC)

Try out using `ORDER BY` to sort single columns in descending order! 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM ___
___ ___ imdb_score ___;
```

*** =type1: NormalExercise
*** =key1: 1ed651456d

*** =instructions1
Get the IMDB score and film id for every film, from highest to lowest.

*** =solution1
```{sql}
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
```

*** =sct1
```{python}
Ex().check_result()
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 3629dd5dcd

*** =instructions2
Get the titles of films in reverse order.

*** =solution2
```{sql}
SELECT title
FROM films
ORDER BY title DESC;
```

*** =sct2
```{python}
Ex().check_result()
Ex().has_equal_ast()
```

--- type:BulletExercise lang:sql xp:100 key:b2a52993bc
## Sorting multiple columns

`ORDER BY` can also be used to sort on multiple columns! `ORDER BY` will sort by the first column specified, then sort by the next and so on. 

For example,

```
SELECT birthdate, name
FROM people 
ORDER BY birthdate, name;
```

will sort the birth dates first (oldest to newest), and then sort the names in alphabetical order. 

Try out using `ORDER BY` to sort multiple columns! Remember, to specify multiple columns, just separate the column names with a comma.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT birthdate, name
FROM ___
___ ___ ___, ___;
```

*** =type1: NormalExercise
*** =key1: 9ec6e8ae72

*** =instructions1
Get people, in order of when they were born, and alphabetical order.
*** =solution1
```{sql}
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='birthdate', match='any')
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 3460b2f14b

*** =instructions2
Get people, in order of when they were born, and alphabetical order.
*** =solution2
```{sql}
SELECT release_year, duration, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, duration;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='duration', match='any')
Ex().test_column(name='title', match='any')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: c03517c2b9

*** =instructions3

*** =solution3
```{sql}
SELECT certification, release_year, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY certification, release_year;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='certification', match='any')
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='title', match='any')
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: f0ade213ff

*** =instructions4
Get people whose names start with A, B or C, (redundantly) ordered.
*** =solution4
```{sql}
SELECT name, birthdate
FROM people
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%'
ORDER BY birthdate;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().test_column(name='birthdate', match='any')
Ex().has_equal_ast()
```

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:81987a99cf
## Introduction to GROUP BY

In SQL, `GROUP BY` allows you to group a result set by one or more columns. `GROUP BY` is used with aggregate functions like `COUNT()` or `MAX`. For example, 

```
SELECT title, COUNT(title) 
FROM films 
GROUP BY release_year;
``` 

will give you the number of films released in each year.

What is `GROUP BY` used for?

*** =instructions
- Sorting results by column
- Sorting results by creation order
- Sorting results in alphabetical order
- Sorting results from aggregate functions

*** =hint
You use `GROUP BY` when you want to compute results from many records.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = 'Correct! `GROUP BY` is speficially for sorting the results of aggregate functions.'
one = 'Incorrect. While `GROUP BY` does sort by column, we could just use `ORDER BY` for this.
two = 'Incorrect.'
three = 'Incorrect. While `GROUP BY` can sort in alphabetical order, we could just use `ORDER BY` for this.

Ex().test_mc(4, [msg2, msg2, msg2, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:98e30a6131
## GROUP BY on multiple columns
Now that you understand what `GROUP BY` is and how to use it, give the exercises a go!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT release_year, ___(___)
FROM ___
___ ___ release_year;
```

*** =type1: NormalExercise
*** =key1: 0b29eb4ff3

*** =instructions1
Get the count of films made in each year.
*** =solution1
```{sql}
SELECT release_year, COUNT(title)
FROM films
GROUP BY release_year;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
# should also check count col here, without alias
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: ebee043890

*** =instructions2
Get the count of films group by release year then order by release year.
*** =solution2
```{sql}
SELECT release_year, COUNT(title) as films_released
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='films_released', match='exact')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: b4341b8451

*** =instructions3
Get the count of films released in each year, ordered by count, lowest to highest.
*** =solution3
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='films_released', match='exact')
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: 66d0c5198a

*** =instructions4
Get the count of films released in each year, ordered by count, highest to lowest.
*** =solution4
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released DESC;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='films_released', match='exact')
Ex().has_equal_ast()
```

*** =type5: NormalExercise
*** =key5: 53ad6da98c

*** =instructions5
Get the lowest box office earnings per year, ordered by year, 
*** =solution5
```{sql}
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
# should also check min col here, without alias
Ex().has_equal_ast()
```

*** =type6: NormalExercise
*** =key6: cff5924de5

*** =instructions6
Get the total amount made in each language.
*** =solution6
```{sql}
SELECT language, SUM(gross)
FROM films
GROUP BY language;
```
*** =sct6
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='language', match='any')
# should also check sum col here, without alias
Ex().has_equal_ast()
```

*** =type7: NormalExercise
*** =key7: 83944ff64f

*** =instructions7
Get the total amount spent by each country.
*** =solution7
```{sql}
SELECT country, SUM(gross)
FROM films
GROUP BY country;
```
*** =sct7
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='country', match='any')
# should also check sum col here, without alias
Ex().has_equal_ast()
```

--- type:BulletExercise lang:sql xp:100 key:38a7c62434
## Combining with aggregate functions

Try out your skills by combining `GROUP BY` and `ORDER BY` with some aggregate functions!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT release_year, country, ___(___)
FROM ___
___ ___ release_year, country
___ ___ release_year, country;
```

*** =type1: NormalExercise
*** =key1: eac5f722a5

*** =instructions1
Get the highest amount of money spent making a film for each year, for each country.
*** =solution1
```{sql}
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='country', match='any')
# should also check max col here, without alias
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 48461bd4d3

*** =instructions2
Get the lowest box office amount made by each country in each year.
*** =solution2
```{sql}
SELECT release_year, country, MIN(gross)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='country', match='any')
# should also check min col here, without alias
Ex().has_equal_ast()
```


--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:4d55b1adf8
## HAVING a great time

In SQL, `WHERE` cannot be used with aggregate functions. To deal with this, you can instead use the `HAVING` keyword. 

For example, 

```
SELECT release_year 
FROM films 
GROUP BY release_year 
HAVING COUNT(title) > 10;
```

will show only those years in which more than 10 films were released.

Why do we need the `HAVING` keyword?

*** =instructions
- To order by creation date
- To sort using textual values
- To sort using numeric values
- `WHERE` cannot be used with aggregate functions

*** =hint
What kind of functions can `WHERE` not be used with? 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = 'Correct!'
msg2 = 'Incorrect.'

Ex().test_mc(4, [msg2, msg2, msg2, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:f7dcb9e122
## All together now

Practice using `ORDER BY`, `GROUP BY` and `HAVING` together.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT release_year, ___(___(budget)) AS avg_budget, ROUND(AVG(___)) AS avg_box_office
FROM ___
___ release_year > 1990
GROUP BY ___
___ (budget) > 20000000
___ ___ release_year ___;
```
*** =type1: NormalExercise
*** =key1: a141cd669f

*** =instructions1
Get the rounded average budget and average box office earnings for movies since 1990, but only if the average budget was greater than $60m in that year.
*** =solution1
```{sql}
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 20000000
ORDER BY release_year DESC;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='avg_budget', match='exact')
Ex().test_column(name='avg_box_office', match='exact')
Ex().has_equal_ast()
```

*** =key2: 1ed0ce7d61

*** =type2: NormalExercise
*** =instructions2
Get the name, average budget, average box office take of countries who have made more than 10 films. Order by name, and get the top five.
*** =solution2
```{sql}
SELECT country, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
GROUP BY country
HAVING COUNT(title) > 10
ORDER BY country
LIMIT 5;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='avg_budget', match='any')
Ex().test_column(name='avg_box_office', match='any')
Ex().has_equal_ast()
```
