---
title: 'Case Study: Citi Bike In New York City'
description: >-
  This chapter gives you an opportunity to apply everything you've learned in
  the first three chapters to real-world data! You'll be working with a database
  that contains information on millions of individual bike share trips in New
  York City in 2015, along with the stations the bikes belong to, and daily
  weather metrics recorded from Central Park during the same time period.

--- type:TabExercise lang:sql key:0dbcee0148
## Get to know your data
Wow, you've come a long way! Congrats on making it this far.

Imagine the mayor of NYC has caught wind of your new SQL skills, and wants you to produce an analysis of CitiBike usage to determine whether the bikes are useful to people living in the city. It's a big job, but you can handle it! 

Before you take on the job, you should get a feel for the data you'll be working with. 

**these questions need to be in each MCE tab - can we do that?**

- How many trips were made in total?
- How many stations are there?
- How many days of the year does the `weather` table cover?


*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}
```

*** =type1: MultipleChoiceExercise
*** =key1: 96f73c1255

*** =instructions1
- 26,259,032
- 19,937,968
- 5,126
- 9,937,968

*** =sct1
```{python}
success_msg = "Correct!"
msg2 = "Incorrect."

Ex().test_mc(2,[msg2, success_msg, msg2, msg2])
```

*** =type2: MultipleChoiceExercise
*** =key2: 36239dc2bb

*** =instructions2
- 498
- 562
- 892
- 365

*** =sct2
```{python}
success_msg = "Correct!"
msg2 = "Incorrect."

Ex().test_mc(1,[success_msg, msg2, msg2, msg2])
```

*** =type3: MultipleChoiceExercise
*** =key3: 0c3fd16aad

*** =instructions3
- 360
- 362
- 730
- 365

*** =sct3
```{python}
success_msg = "Correct!"
msg2 = "Incorrect."

Ex().test_mc(4,[msg2, msg2, msg2, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:dce32a0d9a
## The sky's the LIMIT

By now you may have noticed that the CitiBike database is huge! Displaying it is cumbersome, and takes a while. 

The mayor wants that report on his desk soon though and you don't have time to wait around! 

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}
SELECT ___
FROM trips
___ ___;
```

*** =type1: NormalExercise
*** =key1: 0f8c208095

*** =instructions1
Display only the top 10 results from the `trips` table.
*** =solution1
```{sql}
SELECT *
FROM trips
LIMIT 10;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Have you selected all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

limit_clause = sel.check_field('limit_clause').has_equal_ast('Is your `LIMIT` clause correct?')
```

*** =type2: NormalExercise
*** =key2: 824ef2c32f

*** =instructions2
How many different bikes are there?
*** =solution2
```{sql}
SELECT COUNT(DISTINCT bike_id)
FROM trips;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count_call = sel.chck_node('Unshaped').has_equal_ast('Are you calling `COUNT` correctly?')

distinct = count_call.check_field('arr', 2).has_equal_ast('Are you using the `DISTINCT` keyword?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call, 
    distinct,
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise

*** =key3: b5d489ca53

*** =instructions3
How many different trips were made?
*** =solution3
```{sql}
SELECT COUNT(DISTINCT id)
FROM trips;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

count_call = sel.chck_node('Unshaped').has_equal_ast('Are you calling `COUNT` correctly?')

distinct = count_call.check_field('arr', 2).has_equal_ast('Are you using the `DISTINCT` keyword?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call, 
    distinct,
    from_clause,
    test_error()
])
```
--- type:BulletExercise lang:sql xp:100 key:cfd546a48c
## Make your way around (the dataset)
The mayor wants to know some stats about trip durations, to see if people prefer to take long or short trips using CitiBike. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise
*** =key1: 036586f5a5

*** =instructions1
How long was the longest trip?
*** =solution1
```{sql}
SELECT MAX(duration)
FROM trips;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

max_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `MAX` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    max_call, 
    from_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: dae23c4de6

*** =instructions2
How long was the shortest trip?
*** =solution2
```{sql}
SELECT MIN(duration)
FROM trips;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

min_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    min_call, 
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: bff6c31833

*** =instructions3
How long was the average trip, in seconds?
*** =solution3
```{sql}
SELECT AVG(duration)
FROM trips;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

avg_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    avg_call, 
    from_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: 100be72761

*** =instructions4
How long was the average trip, in minutes? Alias your result as `duration_minutes`.
*** =solution4
```{sql}
SELECT AVG(duration) / 60
AS duration_minutes
FROM trips;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

alias = test_column('duration_minutes', match='exact')

avg_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    avg_call, 
    from_clause,
    alias,
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: 08622b2318

*** =instructions5
How much time total was spent on trips, in days? Alias your result as `duration_days`.
*** =solution5
```{sql}
SELECT SUM(duration) / 60 / 60 / 24
AS duration_days
FROM trips;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

sum_call = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('left').check_field('left').check_node('Unshaped').has_equal_ast('Did you use `SUM` on `duration`?')

alias = test_column('duration_days', match='exact')

from_clause = check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

division_check1 = test_student_typed('/ 60 / 60 / 24', msg='Make sure your division is correct!')

division_check2 = test_student_typed('/ 60 / 24 / 60', msg='Make sure your division is correct!')

division_check3 = test_student_typed('/ 24 / 60 / 60', msg='Make sure your division is correct!')

Ex().test_correct(check_result(), [
    alias,
    from_clause,
    sum_call,
    division_check1,
    division_check2,
    division_check3,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:27b5196db3
## Weather questions
The mayor is interested in discovering whether the weather has a large effect on whether people use CitiBike bikes.

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: 61cbbaf281

*** =instructions1
How many days did it rain?
*** =solution1
```{sql}
SELECT COUNT(*)
FROM weather
WHERE events = 'Rain';
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

from_clause = sel.check_field('from_clause')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    where_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 5731e34718

*** =instructions2
How many days is there no data for?
*** =solution2
```{sql}
SELECT COUNT(*)
FROM weather
WHERE events IS NULL;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

from_clause = sel.check_field('from_clause')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    where_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: 9c99a7f9fb

*** =instructions3
How many days was it cloudy?
*** =solution3
```{sql}
SELECT COUNT(*)
FROM weather
WHERE cloud_cover = 0 OR cloud_cover IS NULL;
```

*** =sct3
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = check_field('where_clause')

or_op1 = where_clause.check_field('left').has_equal_ast('Is the first part of your `WHERE` statement correct?')

or_op2 = where_clause.check_field('right').has_equal_ast('Is the second part of your `WHERE` statement correct?')

```

*** =type4: NormalExercise
*** =key4: b7d224f4d9

*** =instructions4
How many days did it snow?
*** =solution4
```{sql}
SELECT COUNT(*)
FROM weather
WHERE events LIKE '%Snow';
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    where_clause,
    from_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:69853cbb54
## Weather questions (2)
From your preliminary findings, it seems that the weather does play a role in people's cycling habits. However, the mayor knows not 'seems'. He asks you to do some further analysis concerning the effect of weather on biking habits. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: ad332fc611

*** =instructions1
How many days did it rain? (All variants).
*** =solution1
```{sql}
SELECT *
FROM weather
WHERE events LIKE '%Rain';
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    star,
    where_clause,
    from_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 8d1138ca7a

*** =instructions2
How many days was cloud cover greater than 5?
*** =solution2
```{sql}
SELECT COUNT(*)
FROM weather
WHERE cloud_cover > 5;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    where_clause,
    from_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: 3ec14beb5f

*** =instructions3
How many days did it rain more than 0.5 inches?
*** =solution3
```{sql}
SELECT COUNT(*)
FROM weather
WHERE precipitation_in > 0.5;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    where_clause,
    from_clause,
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: 275308669c

*** =instructions4
What was the average mean temperature for the year? Alias your answer as `avg_mean_temp`.
*** =solution4
```{sql}
SELECT AVG(mean_temp_f)
AS avg_mean_temp
FROM weather;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

alias = test_column('avg_mean_temp', match='exact')

avg_call = sel.check_field('target_list').check_node('Unshaped').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    avg_call,
    where_clause,
    from_clause,
    alias,
    test_error()
])
```



--- type:BulletExercise lang:sql xp:100 key:c3a36ee3f0
## Stations
The mayor wants to know which stations are the most popular.

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: db6d8198da

*** =instructions1
Which station was started from the most?
*** =solution1
```{sql}
SELECT id as station_id, COUNT(id)
FROM trips
GROUP BY station_id;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

count_call = sel.check_node('Unshaped').has_equal_ast('Are you calling `COUNT` correctly'?)
```

*** =type2: NormalExercise
*** =key2: 96d9e8384e

*** =instructions2
What were the top ten most popular stations to start from?
*** =solution2
```{sql}
SELECT start_station_id, COUNT(start_station_id)
FROM trips
GROUP BY start_station_id
ORDER BY count DESC
LIMIT 10;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_node('Unshaped', 0).has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

limit_clause = sel.check_field('Is your `LIMIT` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    group_by_clause,
    order_by_clause,
    limit_clause,
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: b235a96d86

*** =instructions3
What were the top ten least popular stations to start from?
*** =solution3
```{sql}
SELECT start_station_id, COUNT(start_station_id)
FROM trips
GROUP BY start_station_id
ORDER BY count
LIMIT 10;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_node('Unshaped', 0).has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    group_by_clause,
    order_by_clause,
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:4eba7f9dc9
## Times
The mayor is planning a publicity stunt, and wants to wants to know about how CitiBike usage changes depending on the time of the year. 

*** =pre_exercise_code
```{python}
connect('postgresql', 'nycbikes15')
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: 716df6c898

*** =instructions1
Which date had the most trips?
*** =solution1
```{sql}
SELECT start_date, COUNT(*)
FROM trips
GROUP BY start_date
ORDER BY count DESC
LIMIT 10;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list', 1).has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

limit_clause = sel.check_field('limit_clause').has_equal_ast('Is your `LIMIT` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    limit_clause,
    order_by_clause,
    group_by_clause,
    from_clause,
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: bcc5ad713c

*** =instructions2
How many trips were made on Christmas Day?
*** =solution2
```{python}
SELECT COUNT(*)
FROM trips
WHERE start_date = '2015-12-25';
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_field('target_list').has_equal_ast('Are you calling `COUNT` correctly?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    where_clause,
    test_error()
])
```


*** =type3: NormalExercise
*** =key3: 605066b226

*** =instructions3
Are there any days on which no trips were made?
*** =solution3
```{sql}
SELECT *
FROM trips
WHERE id IS NULL;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all the columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    star, 
    from_clause,
    where_clause,
    test_error()
])
```

