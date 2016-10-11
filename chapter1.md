---
title: Introduction
description: |
  Get to know relational database management systems. 

--- type:VideoExercise lang:r xp: skills: key:71f89b2a36
## What is an RDBMS? 
Explain the concept of a relational database, about SQL, and about queries. But why use SQL in the first place, and not R/Python/other data analysis languages? You want the computation to be on the database side. When you've got the exact information you need, you can start your analyses in the tool of choice. Also interesting for real time dashboarding/visualization. Give very simple example of a query: get a column from a database.
Give example database: use DESCRIBE and basic SELECT statement as a first reconnaissance.

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:1b191cc1d2
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

--- type:NormalExercise lang:r xp: skills: key:b1b699df58
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

--- type:VideoExercise lang:r xp: skills: key:4c52a06d49
## SELECT 
How to select a column, multiple columns, all columns, and how to use aliases.
select a from x
select a, b from x
select * from x
select a as new_a, b as new_b from x


*** =video_link

--- type:NormalExercise lang:r xp: skills: key:e87919dfea
## Select all columns 
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

--- type:NormalExercise lang:r xp: skills: key:e297b066a6
## Select multiple columns 
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

--- type:NormalExercise lang:r xp: skills: key:c6b88c53e6
## Using aliases 
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

--- type:VideoExercise lang:r xp: skills: key:1196bfeba4
## SELECT (2) 
COUNT, SUM, AVG, MIN, MAX, DISTINCT

*** =video_link

--- type:NormalExercise lang:r xp: skills: key:3b7fc2f893
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

--- type:NormalExercise lang:r xp: skills: key:727bc22114
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

--- type:NormalExercise lang:r xp: skills: key:7fa70278c2
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

--- type:NormalExercise lang:r xp: skills: key:e573cc159d
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
