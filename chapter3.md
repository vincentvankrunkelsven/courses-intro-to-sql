---
title: Sorting and Grouping
description: >-
  Now that you've learned how to select the rows and columns you're most
  interested in, you'll take your analyses to the next level by learning how to
  sort and group tables by variables of interest. In particular, you'll see how
  to combine GROUP BY with aggregate functions like SUM and AVG to summarize
  your data within groups — a very powerful paradigm!

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:ac6d71b0e4
## ORDER BY

In SQL, the `ORDER BY` keyword is used to sort the result set in ascending or descending order according the values of one or more columns. By default `ORDER BY` will sort in ascending order. If you want to sort the results in descending order, you use the `DESC` keyword. For example,

```
SELECT title
FROM films
ORDER BY release_year;
```

will give you the titles of films sorted by release year, from newest to oldest.

Which way does `ORDER BY` sort results by default?

*** =instructions
- Alphabetically
- Descending
- Ascending
- In order of creation date

*** =hint
By default, `ORDER BY` behaves as if it was using the `ASC` keyword.

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

Now that you understand how `ORDER BY` works, give these exercises a go!

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
Get the names of people, sorted alphabetically.
*** =solution1
```{sql}
SELECT name
FROM people
ORDER BY name;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])

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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])
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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: e2702b5933

*** =instructions4
Get the title and release year of films released in 2000 or 2015, in the order they were released.
*** =solution4
```{sql}
SELECT title, release_year
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year;
```
*** =sct4
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

in_op = where_clause.check_field('arr', 1).has_equal_ast('Is your `IN` operation correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    in_op,
    from_clause,
    where_clause,
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: 5c84507976

*** =instructions5
Get all details for all films except those released in 2015 and order them by year.
*** =solution5
```{sql}
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY release_year;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    star,
    from_clause,
    order_by_clause,
    where_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:a7b2964ba7
## Sorting single columns (DESC)

Now use `ORDER BY` to sort single columns in descending order!

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
Get the IMDB score and film ID for every film, sorted from highest to lowest score.

*** =solution1
```{sql}
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
```

*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])
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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:b2a52993bc
## Sorting multiple columns

`ORDER BY` can also be used to sort on multiple columns! It will sort by the first column specified, then sort by the next, then the next, and so on. For example,

```
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

will sort on birth dates first (oldest to newest) and then sort on names in alphabetical order.

Try using `ORDER BY` to sort multiple columns! Remember, to specify multiple columns, separate the column names with a comma.

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
Get people, in order of when they were born and alphabetically by name.
*** =solution1
```{sql}
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 3460b2f14b

*** =instructions2
Get release years, durations, and titles of films released in 2000 or 2015, ordered by their release year and duration.
*** =solution2
```{sql}
SELECT release_year, duration, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, duration;
```
*** =sct2
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause corect?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

in_op = where_clause.check_field('arr', 1).has_equal_ast('Are you using `IN` correctly?')

Ex().test_correct(check_result(), [
    in_op,
    where_clause,
    order_by_clause,
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: c03517c2b9

*** =instructions3
Get certifications, release years, and titles of films released in 2000 or 2015, ordered by certification (alphabetically) and release year.

*** =solution3
```{sql}
SELECT certification, release_year, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY certification, release_year;
```
*** =sct3
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause corect?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

in_op = where_clause.check_field('arr', 1).has_equal_ast('Are you using `IN` correctly?')

Ex().test_correct(check_result(), [
    in_op,
    where_clause,
    order_by_clause,
    from_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: f0ade213ff

*** =instructions4
Get the names and birthdates of people whose names start with A, B, or C, ordered by date of birth.
*** =solution4
```{sql}
SELECT name, birthdate
FROM people
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%'
ORDER BY birthdate;
```
*** =sct4
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause')

# we can check individual LIKEs here, but it's messier
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    order_by_clause,
    test_error()
])
```

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:81987a99cf
## Introduction to GROUP BY

In SQL, `GROUP BY` allows you to group a result set by one or more columns. `GROUP BY` is commonly used with aggregate functions like `COUNT()` or `MAX()`. For example,

```
SELECT release_year, COUNT(title)
FROM films
GROUP BY release_year;
```

will give you the number of films released in each year.

What is `GROUP BY` used for?

*** =instructions
- Performing operations by column
- Performing operations all at once
- Performing operations in a particular order
- Performing operations by group

*** =hint
You use `GROUP BY` when you want to compute results from many records.

*** =sct
```{python}
one = 'Incorrect. While `GROUP BY` does sort by column, we could just use `ORDER BY` for this.'
two = 'Incorrect.'
three = 'Incorrect. While `GROUP BY` does sort results, it\'s not designed to control order of operations.'
success_msg = 'Correct! `GROUP BY` is for performing operations within groups.'

Ex().test_mc(4, [one, two, three, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:98e30a6131
## GROUP BY on multiple columns

Now that you understand what `GROUP BY` is and how to use it, let's try some exercises!
In general, the correct output for each of these tasks will contain a field for the grouped values and a field for some kind of calculated value, with one value for each group.
PostgreSQL will return an error if you try to `SELECT` a field that is not in your `GROUP BY` clause without using it to calculate some kind of value about the entire group.
You'll see in the next section that these kinds of calculations, done by *aggregate functions*, make `GROUP BY` incredibly powerful.

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
Ex().test_ncols()
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Is your `COUNT` call correct?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    order_by_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: ebee043890

*** =instructions2
Get the count of films grouped by release year, then order by release year. Alias the count as `films_released`.
*** =solution2
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct2
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

alias = test_column('films_released', match='exact')

count_call = alias.check_field('expr').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    order_by_clause,
    group_by_clause,
    from_clause,
    alias,
    test_error()
])

```

*** =type3: NormalExercise
*** =key3: b4341b8451

*** =instructions3
Get the count of films released in each year, ordered by count from lowest to highest. Alias the count as `films_released`.
*** =solution3
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released;
```
*** =sct3
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

alias = test_column('films_released', match='exact')

count_call = sel.check_node('AliasExpr').check_node('Call').has_equal_ast('Are you calling `COUNT` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    count_call,
    alias,
    test_error()
])

```

*** =type4: NormalExercise
*** =key4: 66d0c5198a

*** =instructions4
Get the count of films released in each year, ordered by count from highest to lowest.
*** =solution4
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released DESC;
```
*** =sct4
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

alias = test_column('films_released', match='exact')

count_call = sel.check_node('AliasExpr').check_node('Call').has_equal_ast('Are you calling `COUNT` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    count_call,
    alias,
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: 53ad6da98c

*** =instructions5
Get the lowest box office earnings per year, ordered by year.
*** =solution5
```{sql}
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct5
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

min_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    min_call,
    test_error()
])
```

*** =type6: NormalExercise
*** =key6: cff5924de5

*** =instructions6
Get the total amount films in each language brought in at the box office.
*** =solution6
```{sql}
SELECT language, SUM(gross)
FROM films
GROUP BY language;
```
*** =sct6
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

sum_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

Ex().test_correct(check_result(), [
    group_by_clause,
    from_clause,
    sum_call,
    test_error()
])
```

*** =type7: NormalExercise
*** =key7: 83944ff64f

*** =instructions7
Get the total amount spent seeing movies in each country.
*** =solution7
```{sql}
SELECT country, SUM(gross)
FROM films
GROUP BY country;
```
*** =sct7
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

sum_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

Ex().test_correct(check_result(), [
    group_by_clause,
    from_clause,
    sum_call,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:38a7c62434
## Combining with aggregate functions

Try out your skills by combining `GROUP BY` and `ORDER BY` with some more aggregate functions! Make sure to always put the `ORDER BY` clause at the end of your query. You can't sort values that you haven't calculated yet!

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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause1 = sel.check_field('group_by_clause', 0).has_equal_ast('Is the first column of your `GROUP BY` clause correct?')

group_by_clause2 = sel.check_field('group_by_clause').has_equal_ast('Is the second column of your `GROUP BY` clause correct?')

max_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MAX` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause1,
    group_by_clause2,
    from_clause,
    max_call,
    test_error()
])
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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause1 = sel.check_field('group_by_clause', 0).has_equal_ast('Is the first column of your `GROUP BY` clause correct?')

group_by_clause2 = sel.check_field('group_by_clause').has_equal_ast('Is the second column of your `GROUP BY` clause correct?')

min_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause1,
    group_by_clause2,
    from_clause,
    min_call,
    test_error()
])
```


--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:4d55b1adf8
## HAVING a great time

In SQL, aggregate functions can't be used in `WHERE` clauses. This means that if you want to filter based on the result of an aggregate function, you need another way! That's where `HAVING` comes in. For example,

```
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
```

will show only those years in which more than 10 films were released. Why do we need the `HAVING` keyword?

*** =instructions
- To order by creation date
- To sort using text values
- To sort using numeric values
- Aggregate functions can't be used in `WHERE` clauses

*** =hint
What kind of functions can `WHERE` not be used with?

*** =sct
```{python}
success_msg = 'Correct! `HAVING` is needed because `WHERE` cannot deal with aggregate functions.'
creation = 'Incorrect. `HAVING` does not have anything to do with creation date.'
text = 'Incorrect. `WHERE` can sort with text values, so why would we need `HAVING`?'
numeric = 'Incorrect. `WHERE` can sort with numeric values, so why would we need `HAVING`?'

Ex().test_mc(4, [creation, text, numeric, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:f7dcb9e122
## All together now

Time to practice using `ORDER BY`, `GROUP BY` and `HAVING` together!

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
___ (budget) > 60000000
___ ___ release_year ___;
```
*** =type1: NormalExercise
*** =key1: a141cd669f

*** =instructions1
Get the rounded average budget and average box office earnings for films since 1990, but only if the average budget was greater than $60M in that year.
*** =solution1
```{sql}
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY release_year DESC;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')
having = sel.check_field('having_clause').has_equal_ast('Is your `HAVING` clause correct?')
order_by = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')
avg_in_having = having.check_node('Call').has_equal_ast('Are you correctly calling `AVG` on `budget` in your `HAVING` clause?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    having,
    from_clause,
    where_clause,
    group_by,
    order_by,
    alias1,
    alias2,
    test_error()
])


```

*** =key2: 1ed0ce7d61

*** =type2: NormalExercise
*** =instructions2
Get the name, average budget, and average box office take of countries that have made more than 10 films. Order the result by name.
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
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')
having = sel.check_field('having_clause').has_equal_ast('Is your `HAVING` clause correct?')
order_by = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')
avg_in_having = having.check_node('Call').has_equal_ast('Are you correctly calling `AVG` on `budget` in your `HAVING` clause?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    having,
    from_clause,
    where_clause,
    group_by,
    order_by,
    alias1,
    alias2,
    test_error()
])

```
