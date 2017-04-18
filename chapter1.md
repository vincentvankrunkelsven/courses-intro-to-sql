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
Think about what one entity in the `people` table represents.

*** =sct
```{python}
msg1 = "Incorrect, a single attribute about people would be a column!"
msg2 = "Sorry, that would be a table!"
success_msg = "Correct! In a database table, each record contains information on exactly one entity."

Ex().test_mc(3, [msg1, msg2, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:c0bb58f7f9
## SELECTing single columns

While SQL can be used to create and modify databases, the focus of this course will be *querying* databases. A *query* is a request for data or information from a database table or combination of tables. 

Querying is an essential skill for a data scientist, as the data we need to perform our analyses often live in databases.

In SQL, you can select data from a table using a `SELECT` statement. For example, the following selects the `name` column from the `people` table:

```sql
SELECT name
FROM people;
```

In this query, `SELECT` and `FROM` are called keywords. In SQL, keywords are not case-sensitive, which means you could write the same query as:

```sql
select name
from people;
```

That said, it's good practice to make SQL keywords uppercase to distinguish them from other parts of your query, like column and table names. Also note the semicolon at the end of the `SELECT` statement — this tells SQL where the end of your query is.

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
Get the `title` of every film in the `films` table.
*** =solution1
```{sql}
SELECT title
FROM films;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

title = sel.check_node('Identifier').has_equal_ast('Are you sure you selected `title` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    title, 
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 4a74270ecd
*** =instructions2
Modify your query to return the `release_year` for every film.

*** =solution2
```{sql}
SELECT release_year
FROM films;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

release_year = sel.check_node('Identifier').has_equal_ast('Are you sure you selected `release_year` properly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    release_year, 
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: 323bd5ddf5
*** =instructions3
Get the `name` of all `people` involved in the films.

*** =solution3
```{sql}
SELECT name
FROM people;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

name = sel.check_node('Identifier').has_equal_ast('Are you sure you selected `release_year` properly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    name, 
    from_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:09f21bae4c
## SELECTing multiple columns

To `SELECT` multiple columns from a table, you separate the columns with commas. For example, this query selects two columns, `name` and `birthdate`, from the `people` table:

```sql
SELECT name, birthdate
FROM people;
```

Sometimes, you may want to select all columns from a table. In this case, there's a handy shortcut so you don't have to type every column name:

```sql
SELECT *
FROM people;
```

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___
FROM ___;
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
sel = check_node('SelectStmt')

title = sel.check_node('Identifier', 0).has_equal_ast('Have you selected the `title` column correcty?')

release_year = sel.check_node('Identifier', 1).has_equal_ast('Have you selected the `release_year` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    title,
    release_year,
    test_error()
])
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
sel = check_node('SelectStmt')

title = sel.check_node('Identifier', 0).has_equal_ast('Have you selected the `title` column correcty?')

release_year = sel.check_node('Identifier', 1).has_equal_ast('Have you selected the `release_year` column correctly?')

country = sel.check_node('Identifier', 2).has_equal_ast('Have you selected the `country` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    title,
    release_year,
    country,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: eeba078a00
*** =instructions3
Get every person's name and date of birth.

*** =solution3
```{sql}
SELECT name, birthdate
FROM people;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

name = sel.check_node('Identifier', 0).has_equal_ast('Have you selected the `name` column correctly?')

birthdate = sel.check_node('Identifier', 1).has_equal_ast('Have you selected the `birthdate` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    name,
    birthdate, 
    from_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: dac27d9aad
*** =instructions4
Return all columns from the `people` table.
*** =solution4
```{sql}
SELECT *
FROM people;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Have you used `*` in your `SELECT` statement?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    star,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:de52236965
## SELECT DISTINCT

If you want to `SELECT` all unique values from a column, you can use the `DISTINCT` keyword. 

This might be useful if, for example, you're interested in knowing which languages are represented in the `films` table:

```sql
SELECT DISTINCT language
FROM films;
```

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___ ___
FROM ___;
```

*** =type1: NormalExercise
*** =key1: e6b81711f1
*** =instructions1
Get all unique countries represented in the `films` table.

*** =solution1
```{sql}
SELECT DISTINCT country
FROM films;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

language = sel.check_node('Identifier', 0).has_equal_ast('Did you select the `language` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    distinct, 
    language,
    from_clause, 
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 2cb9a4bf6a
*** =instructions2
Get all the different film certifications.
*** =solution2
```{sql}
SELECT DISTINCT certification
FROM films;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

certification = sel.check_node('Identifier', 0).has_equal_ast('Did you select the `certification` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    distinct, 
    certification,
    from_clause, 
    test_error()
])
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
sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

role = sel.check_node('Identifier', 0).has_equal_ast('Did you select the `role` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    distinct, 
    role,
    from_clause, 
    test_error()
])
```

--- type:MultipleChoiceExercise lang:sql xp:50 key:97f97f5766
## Learning to COUNT

The `COUNT` statement returns the number of records in one or more columns.

The following simply gives the number of records in the `people` table:

```sql
SELECT COUNT(*)
FROM people;
```

How many records are contained in the `reviews` table?

*** =instructions
- 9,468
- 8,397
- 4,968
- 9,837
- 9,864

*** =hint
Run a query to count the number of records in the `reviews` table!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
-- You can test out queries here! 
```

*** =sct
```{python}
success_msg = 'Correct!'
msg2 = "Use the syntax provided in the example. Be sure to swap out `people` for `reviews`!"

Ex().test_mc(3,[msg2, msg2, success_msg, msg2, msg2])
```
--- type:BulletExercise lang:sql xp:100 key:7643365e67
## Practice with COUNT

If you want to count the number of non-missing values in a particular column, you can call `COUNT` on just that column:

```sql
SELECT COUNT(birthdate)
FROM roles;
```

It's also common to combine `COUNT` with `DISTINCT` to count the number of distinct values in a column. For example, this query counts the number of distinct roles contained in the `roles` table:

```sql
SELECT COUNT(DISTINCT role) 
FROM roles;
```

Let's get some practice with `COUNT`!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT COUNT(___)
FROM ___;
```

*** =type1: NormalExercise
*** =key1: 4688067e3e
*** =instructions1
Count the number of rows in the `people` table.
*** =solution1
```{sql}
SELECT COUNT(*)
FROM people;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list', 0).has_equal_ast('Are you calling the `COUNT` function correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause, 
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 497ffa962e
*** =instructions2
Count the number of non-missing birth dates in the `people` table.
*** =solution2
```{sql}
SELECT COUNT(birthdate)
FROM people;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count = sel.check_field('target_list', 0).has_equal_ast('Are you calling the `COUNT` function correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    count,
    test_error()
])
```

*** =type3: NormalExercise

*** =key3: 50c903a00a

*** =instructions3
Count the number of unique birth dates in the `people` table.
*** =solution3
```{sql}
SELECT COUNT(DISTINCT birthdate)
FROM people;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

count = sel.check_field('target_list', 0).has_equal_ast('Are you calling the `COUNT` function correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    count,
    test_error()
])
```

*** =type4: NormalExercise

*** =key4: 511052cbbe

*** =instructions4
Count the number of unique languages in the `films` table.
*** =solution4
```{sql}
SELECT COUNT(DISTINCT language)
FROM films;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

count = sel.check_field('target_list', 0).has_equal_ast('Are you calling the `COUNT` function correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    count,
    test_error()
])
```

*** =type5: NormalExercise

*** =key5: 9e1147efe5

*** =instructions5
Count the number of unique countries in the `films` table.
*** =solution5
```{sql}
SELECT COUNT(DISTINCT country)
FROM films;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

count = sel.check_field('target_list', 0).has_equal_ast('Are you calling the `COUNT` function correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    count, 
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:5260bda57a
## SUM, AVG, MIN, MAX

Often you will want to perform some calculation on the data in a database. SQL provides a few functions to help you out with this. 

For example, 

```
SELECT AVG(budget) 
FROM films;
``` 

gives you a result set where the only row contains the average value from the `budget` column of the `films` table. In the same fashion, the `MAX()` function would return the highest budget. 

The `SUM()` function returns the result of adding up the numeric values in a column. Can you guess what the `MIN()` function does?

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
sel = check_node('SelectStmt').has_equal_ast('Is your `SELECT` statement correct?')

sum_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `SUM` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    sum_call, 
    sel,
    test_error()
])
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
sel = check_node('SelectStmt').has_equal_ast('Is your `SELECT` statement correct?')

avg_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    avg_call, 
    sel,
    test_error()
])
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
sel = check_node('SelectStmt').has_equal_ast('Is your `SELECT` statement correct?')

min_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    min_call, 
    sel,
    test_error()
])
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
sel = check_node('SelectStmt').has_equal_ast('Is your `SELECT` statement correct?')

max_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `MAX` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    max_call, 
    sel,
    test_error()
])
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
sel = check_node('SelectStmt').has_equal_ast('Is your `SELECT` statement correct?')

min_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause, 
    min_call, 
    sel,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:6db52132a0
## It's AS simple AS aliasing

In SQL, the `AS` keyword allows you to specify an _alias_ (temporary name) for a column in the result set. For example, 

```
SELECT COUNT(title) AS title_count 
FROM films;
```

gives you a result set with a single column named `title_count`. Aliases are helpful for making results more readable!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT ___, ___ - ___ AS profit_or_loss
FROM films;
```

*** =type1: NormalExercise

*** =key1: ec33c2353b

*** =instructions1
Get the title and profit or loss for each movie, where possible. Let's define the profit or loss as being the amount the movie made, less the amount the movie cost to make. Alias the profit or loss as `profit_or_loss`. 
*** =solution1
```{sql}
SELECT title, gross - budget AS profit_or_loss
FROM films;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

alias = test_column('profit_or_loss', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the profit or loss correctly?')

Ex().test_correct(check_result(), [
    alias_eqn, 
    alias,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 1351c6f6bb

*** =instructions2
Get the title and duration in hours for each film. Alias the duration in hours as `duration_hours`.

*** =solution2
```{sql}
SELECT title, duration / 60
AS duration_hours
FROM films;
```
*** =sct2
```{python}
sel = check_node('SelectStmt').has_equal_ast('Check your `SELECT` statement! Did you divide `duration` by `60`?')

alias = test_column('duration_hours', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the duration in hours correctly?')

Ex().test_correct(check_result(), [
    alias_eqn, 
    alias,
    sel,
    test_error()
])
```


*** =type3: NormalExercise
*** =key3: 497f8d2a8a
*** =instructions3
Get the average film duration in hours for each movie. Alias the duration in hours as `avg_duration_hours`.

*** =solution3
```{sql}
SELECT AVG(duration) / 60
AS avg_duration_hours  
FROM films;
```
*** =sct3
```{python}
sel = check_node('SelectStmt').has_equal_ast('Check your `SELECT` statement! Did you use `AVG`?')

alias = test_column('avg_duration_hours', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the average duration in hours correctly?')

avg_call = sel.check_node('AliasExpr').check_field('left').has_equal_ast('Are you calling `AVG` correctly?')

Ex().test_correct(check_result(), [
    avg_call,
    alias_eqn, 
    alias,
    sel,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:8612897f35
## Even more aliasing

Nice work! Practice your newfound aliasing skills before moving on to the next chapter. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT (COUNT(___) * 100 / COUNT(___))
AS percentage_dead
FROM people;
```

*** =type1: NormalExercise
*** =key1: e14dc7c1a2

*** =instructions1
Get the percentage of people who have died. Alias the result as `percentage_dead`.
*** =solution1
```{sql}
SELECT COUNT(deathdate) * 100 / COUNT(*)
AS percentage_dead
FROM people;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

alias = test_column('percentage_dead', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the percentage of dead people correctly?')

count_call1 = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('left').has_equal_ast('Is your first `COUNT` call equation correct?')

count_call2 = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('right').has_equal_ast('Is your second `COUNT` call equation correct?')

count_call = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('left').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call1,
    count_call2,
    alias_eqn,
    alias, 
    from_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 5a50009c41

*** =instructions2
Check if there's an even number of unique languages. (0 = yes, 1 = no). Alias the result as `result`.
*** =solution2
```{sql}
SELECT COUNT(DISTINCT language) % 2
AS result
FROM films;
```
*** =sct2
```{python}
# note to future Colin: using test_student_typed here because sqlwhateviewer doesn't support modulo yet
sel = test_student_typed('SELECT')
distinct = test_student_typed('distinct|DISTINCT', msg='Did you use `DISTINCT`?')
count_call = test_student_typed('(count|COUNT)\(((distinct|DISTINCT)\slanguage\))', msg='Are you calling `COUNT` correctly?')
alias = test_student_typed('(as|AS)\sresult', msg='Did you alias your result correctly?')
from_clause = test_student_typed('(from|FROM)\sfilms', msg='Is your `FROM` clause correct?')
modulo = test_student_typed('% 2', msg='Did you use the modulo operator (`%`)?', fixed=True)

Ex().test_correct(check_result(), [
    sel,
    distinct,
    count_call,
    modulo,
    alias,
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: c2bbd9a806
*** =instructions3
Get the of years between the oldest film and newest film. Alias the result as `difference`.

*** =solution3
```{sql}
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('difference', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the difference correctly?')

Ex().test_correct(check_result(), [
    from_clause, 
    alias_eqn, 
    alias,
    test_error()
])

```

*** =type4: NormalExercise
*** =key4: f272486b68

*** =instructions4
Get the number of decades this dataset covers. Alias the result as `number_of_decades`.
*** =solution4
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10
AS number_of_decades
FROM films;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('number_of_decades', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the number of decades correctly?')

Ex().test_correct(check_result(), [
    from_clause, 
    alias_eqn, 
    alias,
    test_error()
])
```

*** =type5: NormalExercise

*** =key5: 52d3616e78

*** =instructions5
Get the duration in hours for each film. Alias the duration in hours as `duration_hours`.

*** =solution5
```{sql}
SELECT title, duration / 60 AS duration_hours
FROM films;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('duration_hours', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the duration in hours correctly?')

Ex().test_correct(check_result(), [
    from_clause, 
    alias_eqn, 
    alias, 
    test_error()
])
```
