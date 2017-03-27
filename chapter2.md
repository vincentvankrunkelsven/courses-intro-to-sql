---
title: Filtering Rows
description: >-
  This chapter builds on the first by teaching you not only how to select and
  summarize columns of interest, but to filter tables for records satisfying
  some criteria of interest. You'll learn how to use basic comparison operators,
  combine multiple criteria, match patterns in text, and much more.

--- type:TabExercise lang:sql xp:100 skills:1 key:b90db25f33
## Simple Filtering of Text
In SQL, the `WHERE` keyword allows you to filter records based on conditions. For example, `SELECT title FROM films WHERE release_year > 2000;` will give you the names of all the films released since the year 2000. You can filter using `WHERE` with both text and numeric values!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM films
___ language = ___;
```

*** =type1: NormalExercise
*** =key1: b645308dcd

*** =instructions1
Get all French language films.
*** =solution1
```{sql}
SELECT *
FROM films
WHERE language = 'French';
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 051f6fb8ec

*** =instructions2
Get the name of the person born on November 11th, 1974.
*** =solution2
```{sql}
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().test_column(name='birthdate', match='any')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 7b872a3af0

*** =instructions3
Get the number of Hindi movies.
*** =solution3
```{sql}
SELECT COUNT(*)
FROM films
WHERE language = 'Hindi';
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: 2c87504f11

*** =instructions4
Get all movies with an R certification.
*** =solution4
```{sql}
SELECT *
FROM films
WHERE certification = 'R';
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:b90db25f34
## Simple Filtering of Numeric values
Try using the `WHERE` clause to filter numeric values! 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM films
___ release_year = ___;
```

*** =type1: NormalExercise
*** =key1: 8a4615ada8

*** =instructions1
Get all films released in 2016.
*** =solution1
```{sql}
SELECT *
FROM films
WHERE release_year = 2016;
```
*** =sct1
```{python}{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: f1ea8c68b9

*** =instructions2
Get all films released in 2016.
*** =solution2
```{sql}
SELECT *
FROM films
WHERE release_year = 2016;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 5e6e1c74c6

*** =instructions3
Get the number of films released before 2000.
*** =solution3
```{sql}
SELECT COUNT(*)
FROM films
WHERE release_year < 2000;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: d66f3d41b7

*** =instructions4
Get the title and release year of films released since 2000.
*** =solution4
```{sql}
SELECT title, release_year
FROM films
WHERE release_year > 2000;
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

--- type:TabExercise lang:sql xp:100 skills:1 key:5bda32d7c8
## WHERE AND
You can build up your `WHERE`query using the `AND` keyword. For example, `SELECT title FROM films WHERE release_year > 1994 AND release_year < 2000;`, which will give you all the films released between 1994 and 2000. Similarly, `SELECT title FROM films WHERE release_year = 1994 OR release_year = 2000;` will give you the names of all the films released in _either_ 1994 or 2000.


*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT title, release_year
FROM films
___ ___ < 2000
___ language = ___;
```

*** =type1: NormalExercise
*** =key1: 7ccf93b215

*** =instructions1
Get title and release year for all Spanish films released before 2000.
*** =solution1
```{sql}
SELECT title, release_year
FROM films
WHERE release_year < 2000
AND language = 'Spanish';
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: e703c95e46

*** =instructions2
Get the all Spanish films released since 2000.
*** =solution2
```{sql}
SELECT *
FROM films
WHERE release_year > 2000
AND language = 'Spanish';
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 7f2ba5c82f

*** =instructions3
Get average duration for films released in France in 1992.
*** =solution3
```{sql}
SELECT AVG(duration)
FROM films
WHERE release_year = 1992
AND country = 'France';
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:ecc1838fc7
## WHERE AND, OR
You can also build up your `WHERE`query using the and `OR` keyword. For example, `SELECT title FROM films WHERE release_year = 1994 OR release_year = 2000;` will give you the names of all the films released in _either_ 1994 or 2000.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT title, release_year
FROM films
___ release_year = 1990 ___ release_year = 2000
___ language = 'French' ___ language = 'Spanish';
```

*** =type1: NormalExercise
*** =key1: 969ed73542

*** =instructions1
Get the title and release year of films released in 1990 or 2000 in English or Spanish.
*** =solution1
```{sql}
SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 2000
AND language = 'French' OR language = 'Spanish';
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: aee831c1d8

*** =instructions2
Get films released since 2000 that are in French or Spanish, and made more than $20m.
*** =solution2
```{sql}
SELECT *
FROM films
WHERE release_year > 2000
AND language = 'French' OR language = 'Spanish'
AND gross > 20000000;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: 510b387baa

*** =instructions3
Get films released in the 90s.
*** =solution3
```{sql}
SELECT title, release_year
FROM films
WHERE release_year >= 1990 AND release_year <= 2000;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type4: NormalExercise
*** =key4: aa938f1976

*** =instructions4
Get average duration for films released in the UK or which were released in 2012.
*** =solution4
```{sql}
SELECT AVG(duration)
FROM films
AS average_duration
WHERE release_year = 2012
OR COUNTRY = 'UK';
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='average_duration', match='exact')
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:9c11f67712
## BETWEEN (A Rock and A Hard Place)
In SQL, the `BETWEEN` keyword allows you filter values within a specified range. For example, `SELECT title FROM films WHERE release_year BETWEEN 1994 AND 2000;` will give you the names of all the films released between 1994 and 2000. 

**Remember**: the `BETWEEN` operator is _inclusive_; the beginning and end values are included in the results. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT title, release_year
FROM films
___ release_year ___ 1990 ___ 2000;
```

*** =type1: NormalExercise

*** =key1: 9252da136b

*** =instructions1
Get films released in the 90s.
*** =solution1
```{sql}
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: e189875af9

*** =instructions2
Get the number of films released in the 90s.
*** =solution2
```{sql}
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: d21a4bec02

*** =instructions3
Get the number of films made between 2000 and 2015 with budgets over $100 million.
*** =solution3
```{sql}
SELECT title, budget
FROM films
WHERE release_year
BETWEEN 2000 AND 2015
AND budget > 100000000;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='budget', match='any')
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:4fc7e638f8
## WHERE IN The World
In SQL, The `IN` operator allows you to specify multiple values in a `WHERE clause`. Basically, `IN` makes it easier and quicker to specify multiple `OR` conditions. 

The syntax is as follows:

```SELECT column_name FROM table_name WHERE column_name IN (val1, val2, ..)```


*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT title, release_year
FROM films
___ release_year ___ (1990, 2000)
AND duration > 120;
```

*** =type1: NormalExercise
*** =key1: dc7674d358

*** =instructions1
Get films released in  in 1990 or released in 2000 that were longer than two hours.
*** =solution1
```{sql}
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
AND duration > 120;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```


--- type:TabExercise lang:sql xp:100 skills:1 key:84411d78aa
## BETWEEN and AND
Practice using `BETWEEN` with multiple `AND` operators!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___(___)
FROM films
___ release_year ___ 2000 ___ 2015
___ duration > 120;
```

*** =type1: NormalExercise
*** =key1: 1d71b2f706

*** =instructions1
Get the number of films released between 2000 and 2015 that were longer than two hours.
*** =solution1
```{sql}
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 2000 AND 2015
AND duration > 120;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:84411d78ab
## NULL and IS NULL
In SQL, `NULL` represents an unknown value. Often, you will want to filter out so we only get results which are not `NULL`. To do this, you can use the `IS NOT NULL` operator. For example, `SELECT name FROM people WHERE birthdate IS NOT NULL;` will give you the names of all the people whose birthdate we know.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM people
___ deathdate ___ ___ ;
```

*** =type1: NormalExercise
*** =key1: 3c646ada87

*** =instructions1
Get the names of people who are still alive.
*** =solution1
```{sql}
SELECT name
FROM people
WHERE deathdate IS NULL;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 skills:1 key:84411d78ac
## LIKE and NOT LIKE
In `SQL` the `LIKE` operator can be used in a `WHERE` clause to search for a specific pattern in a column.

There are two _wildcards_ you can use with `LIKE`: `%` and `_`. 

The `%` wildcard will match zero, one, or many characters in text. For example, if you filtered with `Data%` you could match `Data`, `DataC` `DataCamp`, `DataMind` and so on.

The `_` wildcard will match a single character. For example, if you filtered with `DataC_amp` you could match `DataCamp` and `DataComp`, and so on.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT name
FROM people
___ name ___ ___
```

*** =type1: NormalExercise
*** =key1: 9e3c3ef68f

*** =instructions1
Get people whose names begin with 'B'.
*** =solution1
```{sql}
SELECT name
FROM people
WHERE name LIKE 'B%';
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
*** =key2: 606b667e1c

*** =instructions2
Get people whose names have 'r' as the second letter.
*** =solution2
```{sql}
SELECT name
FROM people
WHERE name LIKE '_r%';
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 2e4f49a528

*** =instructions3
Get people whose names don't start with A.
*** =solution3
```{sql}
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```
