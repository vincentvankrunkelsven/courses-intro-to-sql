---
title: Selecting and summarizing columns
description: >-
  This chapter provides a brief introduction to working with relational
  databases. You'll learn about their structure, how to talk about them using
  database lingo, and how to begin an analysis by using simple SQL commands to
  select and summarize columns from database tables.

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:a1f556e63f
## Beginning your SQL journey

Structured Query Language, better known as SQL, is a language for interacting with data stored in *relational databases*. A relational database is simply a collection of tables satisfying some special conditions.

One of these conditions is that each table, consisting of rows and columns, contains information on a collection of entities, such as people, computers, or transactions. Each row, or *record*, contains information about a single entity. Each column, or *field*, contains a single *attribute* of all entities in the table.

In a table called `people`, each record represents which of the following?

*** =instructions
- A single attribute about people
- A collection of entities
- A single person

*** =hint

*** =sct
```{python}
msg1 = 'Incorrect, that's a column!'
msg2 = 'Sorry, that's a table!'
success_msg = 'Correct! In a database table, each record contains information on exactly one entity.'

Ex().test_mc(4, [msg1, msg2, success_msg])
```

--- type:TabExercise lang:sql xp:100 key:c0bb58f7f9
## Single column SELECTs

While SQL can be used to create and modify databases, the focus of this course will be *querying* databases. This is an essential skill for a data scientist, as the data we need to perform our analyses often live in databases.

In SQL, you can select data from a table using a `SELECT` statement. For example, to select a column called `name` from a table called `people`, you'd use the following query:

```sql
SELECT name
FROM people;
```

SQL keywords, such as `SELECT` and `FROM` above, are not case-sensitive, which means you could write the same query as:

```sql
select name
from people;
```

That said, it's good practice to capitalize SQL keywords to help distinguish them from other parts of your query, like column and table names. Note the semicolon at the end of the `SELECT` statement—this tells SQL it's the end of your query.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM films;
```

*** =type1: NormalExercise

*** =key1: a41cc766d5

*** =instructions1
Get the title of every film.
*** =solution1
```{sql}
SELECT title
FROM films;
```
*** =sct1
```{python}
Ex().test_column(name='title', match='any')
Ex().check_result()
```

*** =type2: NormalExercise

*** =key2: 4a74270ecd

*** =instructions2
Get all details for every film.
*** =solution2
```{sql}
SELECT *
FROM films;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise


*** =key3: 323bd5ddf5

*** =instructions3
Get the names of everyone involved in working on the films.
*** =solution3
```{sql}
SELECT name
FROM people;
```
*** =sct3
```{python}
Ex().test_column(name='name', match='any')
Ex().check_result()

```

--- type:TabExercise lang:sql xp:100 key:09f21bae4c
## Multiple Column SELECTs

To `SELECT` from multiple columns, you can separate the columns with a comma.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM films;
```

*** =type1: NormalExercise

*** =key1: d561b4df97

*** =instructions1
Get the title and release year of every film.
*** =solution1
```{sql}
SELECT title, release_year
FROM films;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
```

*** =type2: NormalExercise


*** =key2: 917d7dc533

*** =instructions2
Get the title, release year and country for every film.
*** =solution2
```{sql}
SELECT title, release_year, country
FROM films;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='title', match='any')
Ex().test_column(name='release_year', match='any')
Ex().test_column(name='country', match='any')
```

*** =type3: NormalExercise

*** =key3: eeba078a00

*** =instructions3
Get every person's name and their date of birth where possible.
*** =solution3
```{sql}
SELECT name, birthdate
FROM people;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().test_column(name='birthdate', match='any')
```

*** =type4: NormalExercise

*** =key4: dac27d9aad

*** =instructions4
Get every person name and their date of death where possible.
*** =solution4
```{sql}
SELECT name, deathdate
FROM people;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='name', match='any')
Ex().test_column(name='deathdate', match='any')
```

--- type:TabExercise lang:sql xp:100 key:de52236965
## SELECT DISTINCT

If you want to `SELECT` _unique_ values, you can use the `DISTINCT` keyword.    

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___ ___
FROM films;
```

*** =type1: NormalExercise

*** =key1: e6b81711f1

*** =instructions1
Get all the different countries.
*** =solution1
```{sql}
SELECT DISTINCT country
FROM films;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_column(name='country', match='any')
# select = Ex().check_node('select', 0)
# select.test_student_typed('distinct')
```

*** =type2: NormalExercise

*** =key2: 2cb9a4bf6a

*** =instructions2
Get all the different film languages.
*** =solution2
```{sql}
SELECT DISTINCT language
FROM films;
```
*** =sct2
```{python}
Ex().test_column(name='language', match='any')
Ex().check_result()
# select = Ex().check_node('select', 0)
# select.test_student_typed('distinct')
```

*** =type3: NormalExercise

*** =key3: 26835d3029

*** =instructions3
Get the different types of film roles.
*** =solution3
```{sql}
SELECT DISTINCT role
FROM roles;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='role', match='any')
```

*** =type4: NormalExercise

*** =key4: d81908d52c

*** =instructions4
Get all the different certification categories.
*** =solution4
```{sql}
SELECT DISTINCT certification
FROM films;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='certification', match='any')
```

*** =type5: NormalExercise

*** =key5: d19187a6a4

*** =instructions5
Get all the different IMDB scores - has any scored over 9.5?
*** =solution5
```{sql}
SELECT DISTINCT imdb_score
FROM reviews;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='imdb_score', match='any')
```


--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:97f97f5766
## Every Little Counts

The `COUNT` statement gives you the number of records in a column (a.k.a the number of records an attribute has).

For example, `SELECT COUNT(DISTINCT name) FROM people` gives you the number of unique names in the `people` table. If you do `SELECT COUNT(*) FROM people` you will get the number of records in the entire `people` table.

What is the `COUNT` function used for?
*** =instructions
- Counting the number of columns
- Counting the number of records in a row
- Counting the number of records in a column
- Counting the number of tables in a database

*** =hint

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sct
```{python}
success_msg = 'Correct! There are many advantages to using SQL over imperative programming languages like Python or R.'
msg2 = 'Incorrect. Perhaps more than one of these statements is true?'

Ex().test_mc(3,[msg2, msg2, success_msg, msg2])
```
--- type:TabExercise lang:sql xp:100 key:7643365e67
## Learning to COUNT

Practice your new COUNTing skills!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT COUNT(___)
FROM people;
```

*** =type1: NormalExercise

*** =key1: 4688067e3e

*** =instructions1
Count the number of rows in the people table.
*** =solution1
```{sql}
SELECT COUNT(*)
FROM people;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise

*** =key2: 497ffa962e

*** =instructions2
Count the number of birthdate entries in the people table.
*** =solution2
```{sql}
SELECT COUNT(birthdate)
FROM people;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: 50c903a00a

*** =instructions3
Count the number of unique birthdate entries in the people table.
*** =solution3
```{sql}
SELECT COUNT(DISTINCT birthdate)
FROM people;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type4: NormalExercise

*** =key4: 511052cbbe

*** =instructions4
Count the number of unique languages.
*** =solution4
```{sql}
SELECT COUNT(DISTINCT language)
FROM films;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type5: NormalExercise

*** =key5: 9e1147efe5

*** =instructions5
Count the number of unique countries.
*** =solution5
```{sql}
SELECT COUNT(DISTINCT country)
FROM films;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 key:ba95f5cc97
## Different COUNTs

Try out the exercises to see the difference between `COUNT(column)`, `COUNT(DISTINCT column)` and `COUNT(*)`.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___
FROM films;
```

*** =type1: NormalExercise

*** =key1: 063e5e780f

*** =instructions1
Count the total number of rows in the films table.
*** =solution1
```{sql}
SELECT COUNT(*)
FROM films;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise

*** =key2: 5716af696b

*** =instructions2
Count the total number of birthdates in the people table.
*** =solution2
```{sql}
SELECT COUNT(birthdate)
FROM people;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: 841a8d69fa

*** =instructions3
Count the total number of distinct birthdates in the people table.
*** =solution3
```{sql}
SELECT COUNT(DISTINCT birthdate)
FROM people;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 key:5260bda57a
## SUM, AVG, MIN, MAX

Often you will want to perform some calculation on the data in a database. SQL provides a few functions to help you out with this. For example, `SELECT AVG(budget) FROM films;` would give you a result set where the only row contains the average value from the `budget` column of the `films` table. In the same fashion, the `MAX()` function would return the highest budget. The `SUM()` function returns the result of adding up the numeric values in a column. Can you guess what the `MIN()` function does?

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___(___)
FROM films;
```

*** =type1: NormalExercise

*** =key1: 80fd462ae1

*** =instructions1
Get the total duration of all films.
*** =solution1
```{sql}
SELECT SUM(duration)
FROM films;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type2: NormalExercise

*** =key2: 7993b51268

*** =instructions2
Get the average duration of all films.
*** =solution2
```{sql}
SELECT AVG(duration)
FROM films;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: a03aeabbc6

*** =instructions3
Get the duration of the shortest film.
*** =solution3
```{sql}
SELECT MIN(duration)
FROM films;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type4: NormalExercise

*** =key4: fabbc619c6

*** =instructions4
Get the amount made by the highest grossing film.
*** =solution4
```{sql}
SELECT MAX(gross)
FROM films;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

*** =type5: NormalExercise

*** =key5: e14c21bc81

*** =instructions5
Get the amount made by the lowest grossing film.
*** =solution5
```{sql}
SELECT MIN(gross)
FROM films;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 key:6db52132a0
## It's AS simple AS Aliasing

In SQL, the `AS` keyword allows us to specify an _alias_ (temporary name) for a column in the result set. For example, `SELECT COUNT(title) AS title_count FROM films;` will give you a result set with a single column named `title_count`. Aliases are helpful for making results more readable.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___ - ___
AS profit_or_loss
FROM films;
```

*** =type1: NormalExercise

*** =key1: ec33c2353b

*** =instructions1
Get the profit (or loss) for each movie, where possible.
*** =solution1
```{sql}
SELECT title, gross - budget
AS profit_or_loss
FROM films;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='profit_or_loss', match='exact')
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 1351c6f6bb

*** =instructions2
Get the duration in hours for each film.
*** =solution2
```{sql}
SELECT title, duration / 60.0
AS duration_hours
FROM films;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='duration_hours', match='exact')
Ex().has_equal_ast()
```


*** =type3: NormalExercise

*** =key3: 497f8d2a8a

*** =key3: 6e1e07d9f8

*** =instructions3
Get the average film duration in hours.
*** =solution3
```{sql}
SELECT AVG(duration) / 60.0
AS duration_hours  
FROM films;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='duration_hours', match='exact')
Ex().has_equal_ast()
```

--- type:TabExercise lang:sql xp:100 key:8612897f35
## Even More Aliasing

Try practicsing your aliasing skills in these exercises!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT COUNT(___) * 100 / COUNT(___)
AS percentage_dead
FROM people;
```

*** =type1: NormalExercise

*** =key1: e14dc7c1a2

*** =key1: d8393df397

*** =instructions1
Get the percentage of people who have died.
*** =solution1
```{sql}
SELECT COUNT(deathdate) * 100 / COUNT(*)
AS percentage_dead
FROM people;
```
*** =sct1
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='percentage_dead', match='exact')
Ex().has_equal_ast()
```

*** =type2: NormalExercise
*** =key2: 5a50009c41

*** =instructions2
Check if there's an even number of unique languages. (0 = yes, 1 = no)
*** =solution2
```{sql}
SELECT COUNT(DISTINCT language) % 2
AS result
FROM films;
```
*** =sct2
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='result', match='exact')
Ex().has_equal_ast()
```

*** =type3: NormalExercise

*** =key3: c2bbd9a806

*** =instructions3
Get the of years between the oldest film and newest film.
*** =solution3
```{sql}
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```
*** =sct3
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='difference', match='exact')
Ex().has_equal_ast()
```

*** =type4: NormalExercise

*** =key4: f272486b68

*** =instructions4
Get the number of decades this dataset covers.
*** =solution4
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10
AS number_of_decades
FROM films;
```
*** =sct4
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='number_of_decades', match='exact')
Ex().has_equal_ast()
```

*** =type5: NormalExercise

*** =key5: 52d3616e78

*** =instructions5
Get the duration in hours for each film.
*** =solution5
```{sql}
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```
*** =sct5
```{python}
Ex().check_result()
Ex().test_ncols()
Ex().test_nrows()
Ex().test_column(name='duration_hours', match='exact')
Ex().has_equal_ast()
```
