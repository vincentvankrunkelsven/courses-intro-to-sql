---
title: Introduction
description: |
  Get to know relational database management systems. 

--- type:VideoExercise lang:r xp: skills: key:061c61bf9a
## What is an RDBMS? 
Explain the concept of a relational database, about SQL, and about queries. But why use SQL in the first place, and not R/Python/other data analysis languages? You want the computation to be on the database side. When you've got the exact information you need, you can start your analyses in the tool of choice. Also interesting for real time dashboarding/visualization. Be very clear about what SQL is, and what it is not.
Give example database: use DESCRIBE and basic SELECT statement as a first reconnaissance.

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:2dce896f84
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

--- type:NormalExercise lang:r xp: skills: key:ba71277784
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

--- type:VideoExercise lang:r xp: skills: key:28e75f49b5
## SELECT 
How to select a column, multiple columns, all columns, and how to use aliases.
select a from x
select a, b from x
select * from x
select a as new_a, b as new_b from x

Also mention here that using SELECT or select does not matter. In general, SQL is not case-sensitive when it comes to keywords, but it does when it comes to table and column names!


*** =video_link

--- type:NormalExercise lang:r xp: skills: key:fed3e78adb
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

--- type:NormalExercise lang:r xp: skills: key:783880fc23
## Select multiple columns 
Seperate column names with commas to select multiple columns. The order matters!

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

--- type:NormalExercise lang:r xp: skills: key:909aaf8fe0
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

--- type:VideoExercise lang:r xp: skills: key:3484f6e938
## SELECT (2) 
COUNT, SUM, AVG, MIN, MAX, DISTINCT

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:43982013f2
## COUNT 
Content

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

--- type:NormalExercise lang:r xp: skills: key:9d6561f7e8
## SUM and AVG 
Content

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

--- type:NormalExercise lang:r xp: skills: key:8709702ad8
## MIN and MAX 
Content

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

--- type:NormalExercise lang:r xp: skills: key:a654e40551
## DISTINCT 
Content

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
