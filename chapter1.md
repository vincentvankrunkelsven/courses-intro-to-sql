---
title: Selecting and summarizing columns
description: >-
  This chapter provides a brief introduction to working with relational
  databases. You'll learn about their structure, how to talk about them using
  database lingo, and how to begin an analysis by using simple SQL commands to
  select and summarize columns from database tables.

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:a1f556e63f
## Beginning your SQL journey

Welcome to the course! Let's get straight into it. SQL, which stands for *Structured Query Language*, is a language for interacting with data stored in something called a *relational database*. 

You can think of a relational database as a collection of tables. A table is just a set of rows and columns, like a spreadsheet, which represents exactly one type of entity. For example, a table might represent employees in a company, or purchases made.

Each row, or *record*, of a table contains information about a single entity -- E.g., in a table representing employees, each row represents a single person. Each column, or *field*, contains a single attribute for all rows in the table -- E.g., in a table representing employees, we might have a column for an employee's first and last name.

The employees table might look something like this:

| id | name | age | nationality |
|----|----|----|----|
| 1 | Laura | 36 | USA
| 2 | Gabriel | 22 | France |
| 3 | Lisa | 52 | India |


Take a look at the employees table, how many fields does it contain?

*** =instructions
- 1
- 2
- 3
- 4

*** =hint
Remember that in database lingo, a column is called a *field*. How many fields does the table contain?

*** =sct
```{python}
msg1 = "Incorrect, a table contains information about one type of entity, but generally has multiple fields."
msg2 = "Sorry, try again!"
msg3 = "Incorrect, the table contains three records, but how many fields does it have?"
success_msg = "Correct! The table contains four columns, or fields."

Ex().test_mc(4, [msg1, msg2, msg3, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:c0bb58f7f9
## SELECTing single columns

While SQL can be used to create and modify databases, the focus of this course will be *querying* databases. A *query* is a request for data from a database table or combination of tables. Querying is an essential skill for a data scientist, since the data we need for our analyses often live in databases.

In SQL, you can select data from a table using a `SELECT` statement. For example, the following code selects the `name` column from the `people` table:

```sql
SELECT name
FROM people;
```

In this query, `SELECT` and `FROM` are called keywords. In SQL, keywords are not case-sensitive, which means you can write the same query as:

```sql
select name
from people;
```

That said, it's good practice to make SQL keywords uppercase to distinguish them from other parts of your query, like column and table names.

Additionally, it's also good practice (but not necessary for the exercises in this course) to include a semicolon at the end of your query. This tells SQL where the end of your query is!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: a41cc766d5
*** =instructions1
Select the `title` column from the `films` table. You can see your results in the query result tab to the right!
*** =solution1
```{sql}
SELECT title
FROM films;
```
*** =sct1
```{python}
Ex().test_ncols()

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
Modify your query to get the `release_year` column from the `films table`.

*** =solution2
```{sql}
SELECT release_year
FROM films;
```
*** =sct2
```{python}
Ex().test_ncols()
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
Now modify your query to get the `name` of each person in the `people` table.

*** =solution3
```{sql}
SELECT name
FROM people;
```
*** =sct3
```{python}
Ex().test_ncols()
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

Well done! Now you know how to select single columns. In the real world, you will often want to select multiple columns. Thankfully, SQL makes it really easy to select multiple columns. To select multiple columns from a table, you can simply separate the columns with commas!

For example, this query selects two columns, `name` and `birthdate`, from the `people` table:

```sql
SELECT name, birthdate
FROM people;
```

Sometimes, you may want to select all columns from a table. Typing out every column name would be a pain, so there's a handy shortcut:

```sql
SELECT *
FROM people;
```

If you only want to return a certain number of results, you can use the `LIMIT` keyword to limit the number of rows returned:

```sql
SELECT *
FROM people
LIMIT 10;
```

You can check out the column names in the tables by clicking on the tabs to the right under the editor!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise
*** =key1: d561b4df97
*** =instructions1
Get the `title` of every film from the `films` table.

*** =solution1
```{sql}
SELECT title
FROM films;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

title = sel.check_node('Identifier', 0).has_equal_ast('Have you selected the `title` column correcty?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    title,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 917d7dc533
*** =instructions2
Get the `title` and `release_year` for every film. 

*** =solution2
```{sql}
SELECT title, release_year
FROM films;
```
*** =sct2
```{python}
Ex().test_ncols()
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

*** =type3: NormalExercise
*** =key3: eeba078a00
*** =instructions3
Get the title, release year and country for every film.

*** =solution3
```{sql}
SELECT title, release_year, country
FROM films;
```
*** =sct3
```{python}
Ex().test_ncols()
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

*** =type4: NormalExercise
*** =key4: dac27d9aad
*** =instructions4
Get all columns from the `films` table.
*** =solution4
```{sql}
SELECT *
FROM films;
```
*** =sct4
```{python}
Ex().test_ncols()
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

Good work! 

Often your results will include many duplicate values. If you want to select all the unique values from a column, you can use the `DISTINCT` keyword.

This might be useful if, for example, you're interested in knowing which languages are represented in the `films` table:

```sql
SELECT DISTINCT language
FROM films;
```

Remember, you can check out the data in the tables by clicking on the tabs to the right under the editor!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise
*** =key1: e6b81711f1
*** =instructions1
Get all the unique countries represented in the `films` table.

*** =solution1
```{sql}
SELECT DISTINCT country
FROM films;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

language = sel.check_node('Identifier', 0).has_equal_ast('Did you select the `country` column correctly?')

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
Get all the different film certifications from the `films` table.
*** =solution2
```{sql}
SELECT DISTINCT certification
FROM films;
```
*** =sct2
```{python}
Ex().test_ncols()
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
Get the different types of film roles from the `roles` table.

*** =solution3
```{sql}
SELECT DISTINCT role
FROM roles;
```
*** =sct3
```{python}
Ex().test_ncols()
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

Nice work!

What if you want to count the number of employees in your employees table? The `COUNT` statement lets you do this! `COUNT` returns the number of rows in one or more columns.

So, the following code simply gives the number of rows in the `people` table:

```sql
SELECT COUNT(*)
FROM people;
```

<hr>
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

As you saw, `COUNT(*)` will tell you how many rows are in the table. However, if you want to count the number of non-missing values in a particular column, you can call `COUNT` on just that column.

For example, to count the number of birth dates present in the `roles` table:

```sql
SELECT COUNT(birthdate)
FROM roles;
```

It's also common to combine `COUNT` with `DISTINCT` to count the number of distinct values in a column. 

For example, this query counts the number of *unique* birth dates contained in the `roles` table:

```sql
SELECT COUNT(DISTINCT birthdate)
FROM roles;
```

Let's get some practice with `COUNT`!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
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
Ex().test_ncols()
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
Ex().test_ncols()
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
Ex().test_ncols()
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
Ex().test_ncols()
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
Ex().test_ncols()
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

Great work. 

Often you will want to perform some calculation on the data in a database. SQL provides a few functions to help you out with this.

For example:

```
SELECT AVG(budget)
FROM films;
```

gives you a result set where the only row contains the average value from the `budget` column of the `films` table. In the same fashion, the `MAX()` function would return the highest budget.

```
SELECT MAX(budget)
FROM films;
```

The `SUM()` function returns the result of adding up the numeric values in a column:
```
SELECT SUM(budget)
FROM films;
```

We're sure you can guess what the `MIN()` function does! Now it's your turn to try out some SQL functions.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise

*** =key1: 80fd462ae1

*** =instructions1
Get the total (sum) duration of all films.
*** =solution1
```{sql}
SELECT SUM(duration)
FROM films;
```
*** =sct1
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

sum_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
Ex().test_ncols()
sel = check_node('SelectStmt')

avg_call = sel.check_field('from_clause').check_node('Call').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
Ex().test_ncols()
sel = check_node('SelectStmt')

min_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
Ex().test_ncols()
sel = check_node('SelectStmt')

max_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MAX` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
Ex().test_ncols()
sel = check_node('SelectStmt')

min_call = sel.check_field('target_list').check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
    test_error()
])
```


--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:9ec3f029a9
## A note on arithmetic
In addition to using the built in SQL functions, you can perform basic arithmetic with symbols like `+`, `-`, `*`, and `/`. 

So, for example: 

```
SELECT (4 * 3);
```

gives you a result of `12`. 

However:

```
SELECT (4 / 3);
```

gives you a result of `1`. What's going on here?

Well, SQL assumes that if you divide an integer by an integer, that you want to get an integer back. So be careful when dividing! 

If you want to get more precision when dividing, you can add decimal places to your numbers:

```
SELECT (4.0 / 3.0) AS result;
```

which gives you the result you would expect: `1.333..` 

<hr>
What is the result of `SELECT (10 / 3);`?
*** =instructions
- 2.333
- 3.333
- 3
- 3.0

*** =hint
Run a query in the editor to the right. 

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
msg2 = "Incorrect, try out the query in the editor!"

Ex().test_mc(3,[msg2, msg2, success_msg, msg2])
```
--- type:BulletExercise lang:sql xp:100 key:6db52132a0
## It's AS simple AS aliasing

You may have noticed in the previous exercise that the column name of your result set was just the name of the function you used. For example:

```
SELECT MAX(budget)
FROM films;
```

gives you a result set with one column, named `max`. But what if you used two functions like this?:

```
SELECT MAX(budget), MAX(duration)
FROM films;
```

Well, then you'd have two columns named `max`, which isn't very useful!

To avoid situations like this, SQL allows you to do something called _aliasing_. Aliasing simply means you assign a temporary name to something. To alias, you use the `AS` keyword. For example, in the above example we could use aliases to make the result set clearer:

```
SELECT MAX(budget) AS max_budget, MAX(duration) AS max_duration
FROM films;
```

Aliases are helpful for making results more readable!

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
Get the title and profit or loss for each film, where possible. Let's define the profit or loss as being the amount the film made, minus the amount the film cost to make. Alias the profit or loss as `profit_or_loss`.
*** =solution1
```{sql}
SELECT title, gross - budget AS profit_or_loss
FROM films;
```
*** =sct1
```{python}
Ex().test_ncols()
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
Get the title and duration in hours for each film. Currently the duration is in seconds, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as `duration_hours`.

*** =solution2
```{sql}
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```
*** =sct2
```{python}

Ex().test_ncols()
sel = check_node('SelectStmt').has_equal_ast('Check your `SELECT` statement! Did you divide `duration` by `60` and alias the result as `duration_hours`?')


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
Get the average film duration in hours for all films, aliased as `avg_duration_hours`.

*** =solution3
```{sql}
SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;
```
*** =sct3
```{python}
Ex().test_ncols()
# TODO: come back to this with better solution
sel = check_node('SelectStmt')

alias = test_column('avg_duration_hours', match='exact', msg='Did you alias your result as `avg_duration_hours`?')

avg1 = test_student_typed('AVG(duration) / 60.0', msg='Are you calling `AVG` correctly?')
avg2 = test_student_typed('AVG(duration / 60.0)', msg='Are you calling `AVG` correctly?')

avg_call = test_or(avg1, avg2)

Ex().test_correct(check_result(), [
    avg_call,
    alias,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:8612897f35
## Even more aliasing

Nice work! Let's practice your newfound aliasing skills some more before moving on.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
SELECT (COUNT(___) * 100.0 / COUNT(___)) AS percentage_dead
FROM people;
```

*** =type1: NormalExercise
*** =key1: e14dc7c1a2

*** =instructions1
Get the percentage of `people` who are no longer alive. Alias the result as `percentage_dead`.
*** =solution1
```{sql}
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;
```
*** =sct1
```{python}
Ex().test_ncols()
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
*** =key2: c2bbd9a806
*** =instructions2
Get the number of years between the oldest film and newest film. Alias the result as `difference`.

*** =solution2
```{sql}
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```
*** =sct2
```{python}
Ex().test_ncols()
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

*** =type3: NormalExercise
*** =key3: f272486b68

*** =instructions3
Get the number of decades the `films` table covers. Alias the result as `number_of_decades`.
*** =solution3
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
```
*** =sct3
```{python}
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('number_of_decades', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the exact number of decades correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    alias_eqn,
    alias,
    test_error()
])
```
