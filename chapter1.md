---
title: Introduction
description: >
  Get to know relational database management systems, and get to know the SELECT
  statement.

--- type:VideoExercise lang:r xp: skills: key:c770dc75ca
## What is an RDBMS? 
Explain the concept of a relational database, about SQL, and about queries. But why use SQL in the first place, and not R/Python/other data analysis languages? You want the computation to be on the database side. When you've got the exact information you need, you can start your analyses in the tool of choice. Also interesting for real time dashboarding/visualization. Be very clear about what SQL is, and what it is not. We won't talk about updating SQL, we're data scientist, not data engineers.
Give example database: use DESCRIBE and basic SELECT statement as a first reconnaissance.

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:f858df63c5
## A first date 
Use DESCRIBE to figure out the different tables in the database.

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:08ea889c45
## Your first SQL query 
Very basic:
select a from x

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:VideoExercise lang:r xp: skills: key:198fdede34
## SELECT 
How to select a column, multiple columns, all columns, and how to use aliases.
select a from x
select a, b from x
select * from x
select a as new_a, b as new_b from x

Also mention here that using SELECT or select does not matter. In general, SQL is not case-sensitive when it comes to keywords, but it does when it comes to table and column names!


*** =video_link

--- type:NormalExercise lang:r xp: skills: key:4b6fc7c138
## Select all columns 
Use the * to select all columns at once

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:13e65ba895
## Select multiple columns 
Separate column names with commas to select multiple columns. The order matters!

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:775f334479
## Using aliases 
Use the 'as' thing to load in certain columns under certain aliases.

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:VideoExercise lang:r xp: skills: key:20728fc50d
## SELECT (2) 
COUNT, SUM, AVG, MIN, MAX, DISTINCT to get a first idea about aggregates of your data.

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:8c981ba21a
## COUNT 
SELECT COUNT(*) FROM posts (to count the total number of posts)

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:fc13f42390
## SUM and AVG 
SELECT AVG(age) FROM readers

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:51151a2883
## MIN and MAX 
SELECT MAX(published_at) FROM posts to get the most recent post that was launched

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp: skills: key:a7b0035199
## DISTINCT 
Number of distinct users that read something:
SELECT COUNT(DISTINCT user_id) FROM reads

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```
