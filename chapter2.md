---
title: Filtering Rows
description: >-
  This chapter builds on the first by teaching you not only how to select and
  summarize columns of interest, but to filter tables for records satisfying
  some criteria of interest. You'll learn how to use basic comparison operators,
  combine multiple criteria, match patterns in text, and much more.
  
--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:bfc80ff2e5
## Filtering results

In SQL, the `WHERE` keyword allows you to filter both text and numeric records based on certain conditions. For example, 

```
SELECT title 
FROM films 
WHERE release_year > 2000;
```

gives you the titles of all films released since the year 2000. 

What types of data can be filtered using `WHERE`?
*** =instructions
- Numeric data
- Textual data
- Numeric and textual data
- None of the above

*** =hint
It's not none of the above! 

```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = "Correct! `WHERE` can be used to filter on both numeric and textual data."
msg2 = "Incorrect. `WHERE` can be used with more than just numeric data!"
msg3 = "Incorrect. `WHERE` can be used with more than just textual data!"
msg4 = "Incorrect, it's not one of the above!"

Ex().test_mc(3,[msg2, msg3, success_msg, msg4])
```

--- type:BulletExercise lang:sql xp:100 key:b90db25f33
## Simple filtering of text

As we have seen, the `WHERE` clause allows you to filter your results. The following code is an example of filtering on textual data, which gets the titles of all films which were rated `'R'`:

```
SELECT title 
FROM films 
WHERE certification = 'R';
```

Now it's your turn to practice using `WHERE`!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM ___
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
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Check your `WHERE` clause!')

star = sel.check_node('Star').has_equal_ast('Are you selecting the right columns?')

Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    star,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 051f6fb8ec

*** =instructions2
Get the name and birth date of the person born on November 11th, 1974.
*** =solution2
```{sql}
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
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
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list', 0).has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call, 
    from_clause, 
    where_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: 2c87504f11

*** =instructions4
Get all details for all films with an R certification.
*** =solution4
```{sql}
SELECT *
FROM films
WHERE certification = 'R';
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    star, 
    from_clause, 
    where_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:b90db25f34
## Simple filtering of numeric values

Remember, the `WHERE` clause can be used to filter numeric records, such as years. 

For example, the following code selects all films with a budget over ten thousand dollars:

```
SELECT * 
FROM films
WHERE budget > 10000;
```

Now it's your turn to use the `WHERE` clause to filter numeric values! 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM ___
___ release_year = ___;
```

*** =type1: NormalExercise
*** =key1: 8a4615ada8

*** =instructions1
Get all details for all films released in 2016.

*** =solution1
```{sql}
SELECT *
FROM films
WHERE release_year = 2016;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    star, 
    from_clause, 
    where_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: f1ea8c68b9

*** =instructions2
Get details for all films released in 2016.
*** =solution2
```{sql}
SELECT *
FROM films
WHERE release_year = 2016;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    star, 
    from_clause, 
    where_clause,
    test_error()
])
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
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list', 0).has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call, 
    from_clause, 
    where_clause,
    test_error()
])
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
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call, 
    from_clause, 
    where_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:5bda32d7c8
## WHERE AND

You can build up your `WHERE`queries using the `AND` keyword. 

For example, 

```
SELECT title 
FROM films 
WHERE release_year > 1994 
AND release_year < 2000;
```

will give you the titles of films released between 1994 and 2000. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT title, release_year
FROM ___
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
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

left = sel.check_field('where_clause').check_node('BinaryExpr').check_field('left').has_equal_ast('Is the first part of your `WHERE` clause correct?')

right = sel.check_field('where_clause').check_node('BinaryExpr').check_field('right').has_equal_ast('Is the second part of your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    left, 
    right,
    test_correct()
])
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
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

left = sel.check_field('where_clause').check_node('BinaryExpr').check_field('left').has_equal_ast('Is the first part of your `WHERE` clause correct?')

right = sel.check_field('where_clause').check_node('BinaryExpr').check_field('right').has_equal_ast('Is the second part of your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    left, 
    right,
    test_correct()
])
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
sel = check_node('SelectStmt')

avg_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

left = sel.check_node('BinaryExpr').check_field('left').has_equal_ast('Is the first part of your `WHERE` clause correct?')

right = sel.check_node('BinaryExpr').check_field('right').has_equal_ast('Is the second part of your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    avg_call, 
    left, 
    right,
    from_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:ecc1838fc7
## WHERE AND, OR

You can also build up your `WHERE`query using the `OR` keyword. 

For example, 

```
SELECT title 
FROM films 
WHERE release_year = 1994 
OR release_year = 2000;
```

will give you the names of all the films released in _either_ 1994 or 2000.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM ___
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
sel = check_node('SelectStmt')
left = sel.check_node('BinaryExpr').check_field('left')
right = sel.check_node('BinaryExpr').check_field('right')

or_one = left.check_field('left').has_equal_ast('Did you check for 1990?')


or_three = left.check_field('right').check_field('right').has_equal_ast('Did you check for French films?')

or_four = right.has_equal_ast('Did you check for Spanish films?')





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
AS average_duration
FROM films
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


--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:a1827199e2
## BETWEEN

In SQL, the `BETWEEN` keyword allows you filter values within a specified range. For example, 

```
SELECT title 
FROM films 
WHERE release_year 
BETWEEN 1994 AND 2000;
``` 

gives you the names of all the films released between 1994 and 2000. 

**Remember**: the `BETWEEN` operator is _inclusive_; the beginning and end values are included in the results. 

What does the `BETWEEN` keyword do?

*** =instructions
- Filter numeric values
- Filter textual values
- Filter values in a specified list
- Filter values in a specified range

*** =hint
Think about looking for values **between** a beginning and end point. 

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

--- type:BulletExercise lang:sql xp:100 key:9c11f67712
## BETWEEN (a rock and a hard place)

Similar to the `WHERE` clause, the `BETWEEN` clause can be used with multiple `AND` operators, so you can build up your queries and make them even more powerful! 

For example, suppose we have a table called `kids`. We can get the names of all kids under the age of 12, whose ages are multiples of 2, as follows:

```
SELECT name 
FROM kids
WHERE age BETWEEN 2 AND 12
```

Take a go at using `BETWEEN` with `AND`!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM ___
___ release_year ___ 1990 ___ 2000;
```

*** =type1: NormalExercise

*** =key1: 9252da136b

*** =instructions1
Get the title and release year of all films released in the 90s.
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
Get the title and budget of all films made between 2000 and 2015 with budgets over $100 million.
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

--- type:BulletExercise lang:sql xp:100 key:84411d78aa
## BETWEEN (again)

Give the exercises a go to master `BETWEEN`.

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

*** =type2: NormalExercise
*** =key2: 1d71b2f707

*** =instructions2
Get the number of films released between 1994 and 2004 that were rated R.
*** =solution2
```{sql}
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 1994 AND 2004
AND certification = 'R';
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 1d71b2f708

*** =instructions3
Get the number of films released between 1950 and 2000 that were in French, and released in the USA.
*** =solution3
```{sql}
SELECT COUNT(*)
FROM films
WHERE release_year BETWEEN 1950 AND 2000
AND language = 'FRENCH' 
AND country = 'USA';
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```


--- type:BulletExercise lang:sql xp:100 key:4fc7e638f8
## WHERE IN the world

In SQL, The `IN` operator allows you to specify multiple values in a `WHERE clause`. Basically, `IN` makes it easier and quicker to specify multiple `OR` conditions! Neat, right? 

For example, suppose we have a table called `kids`. We can get the names of all kids under the age of 12, whose ages are multiples of 2, as follows:

```
SELECT name 
FROM kids
WHERE age IN (2, 4, 6, 8, 10)
```

Try using the `IN` operator yourself! 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM ___
___ release_year ___ (1990, 2000)
AND ___ > 120;
```

*** =type1: NormalExercise
*** =key1: dc7674d358

*** =instructions1
Get the title and release year of all films released in 1990 or released in 2000 that were longer than two hours.
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

*** =type2: NormalExercise
*** =key2: e51a20375f

*** =instructions2
Get the title and language of all films which were in English, Spanish or French. 
*** =solution2
```{sql}
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```

*** =type3: NormalExercise
*** =key3: 58f0ec541c

*** =instructions3
Get the title and certification of all films with an NC-17 or R certification.
*** =solution3
```{sql}
SELECT title, certification
FROM films
WHERE certification IN ('NC-17', 'R');
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().has_equal_ast()
```

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:5cf67b42b3
## Introduction to NULL and IS NULL
In SQL, `NULL` represents an unknown value. Often, you will want to filter out so we only get results which are not `NULL`. To do this, you can use the `IS NOT NULL` operator. 

For example, 

```
SELECT name 
FROM people 
WHERE birthdate IS NOT NULL;
``` 

will give you the names of all the people whose birthdate has an entry in the `people` table.

What does `NULL` represent?

*** =instructions
- Corrupt values
- Unknown values
- Empty values
- Invalid values

*** =hint
Remember, `NULL` represents values which we can not determine. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = 'Correct! `NULL` is used to represent unknown values.'
corrupt = 'Incorrect. We can not be sure that a `NULL` value is actually corrupt.'
empty = 'Incorrect. We can not be sure that a `NULL` value is actually an empty value.'
invalid = 'Incorrect!'

Ex().test_mc(2, [corrupt, success_msg, empty, invalid])
```

--- type:BulletExercise lang:sql xp:100 key:84411d78ab
## NULL and IS NULL

Now that you know what `NULL` is, and what it's used for, give the exercises a go!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM ___
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

*** =type2: NormalExercise
*** =key2: 3c646ada88

*** =instructions2
Get the number of films which don't have a language associated with them.
*** =solution2
```{sql}
SELECT count(title)
FROM films
WHERE language IS NULL;
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
*** =key3: 3c646ada89

*** =instructions3
Get the title of every film which doesn't have a budget associated with it.
*** =solution3
```{sql}
SELECT title
FROM films
WHERE budget IS NULL;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().has_equal_ast()
```

--- type:BulletExercise lang:sql xp:100 key:84411d78ac
## LIKE and NOT LIKE

In `SQL` the `LIKE` operator can be used in a `WHERE` clause to search for a specific pattern in a column.

There are two _wildcards_ you can use with `LIKE`: `%` and `_`. 

The `%` wildcard will match zero, one, or many characters in text. For example, if you filtered with `Data%` you could match `Data`, `DataC` `DataCamp`, `DataMind` and so on.

The `_` wildcard will match a single character. For example, if you filtered with `DataC_mp` you would match `DataCamp` and `DataComp`, and so on.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT name
FROM ___
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
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    test_error()
])
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
