---
title: Selecting and summarizing columns
description: This is a template chapter.

--- type:VideoExercise lang:r xp:50 skills:1 key:3e970f768b
## Introduction

* Motivating example (case study preview)
* Why not just use R/Python/etc?
  * Memory
  * Speed
  * Centralization
  * Access control
  * DMBS tools
  * ...?
* Database vocabulary (in context of example; make spreadsheet analogies)
  * Database (~ spreadsheet)
  * Tables (~ worksheet)
  * Columns & records (a.k.a. records) (~ columns & rows)
  * Fields (~ cells)
* Basic SQL syntax
  * Not case-sensitive
  * End statement with semicolon
  * Stylistic conventions (?)
* SELECT
* DISTINCT

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:35ac5d28c7
## Why use relational databases?

Q: Which of the following is NOT a good reason to use relational databases?
A: They are good at handling unstructured data

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:329710f634
## Simple SELECT statements

Single column, multiple columns, all columns (*). Order matters! Finish with embedded MCE asking for specific value from last query

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

--- type:NormalExercise lang:r xp:100 skills:1 key:ba6d88954a
## Combine SELECT with DISTINCT

Select all distinct values of column_name with SELECT DISTINCT. Repeat with multiple columns. Follow with embedded MCE to test interpretation

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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:4fb81f18b4
## Select the proper SELECT

(Test for style and syntax)

Q: Which of the following queries returns a list of every date on which at least one person read a blog post?
A: 
SELECT DISTINCT date
FROM reads;

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:VideoExercise lang:r xp:50 skills:1 key:c52bfdf232
## Aggregate functions

* Difference between COUNT(*) and COUNT(column_name)
* Combining COUNT with DISTINCT
* SUM
* AVG
* MIN
* MAX

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:c6d8fe45c9
## COUNT

COUNT(*) counts NULLs, COUNT(column_name) excludes NULLs

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

--- type:NormalExercise lang:r xp:100 skills:1 key:f3dea635ec
## Combine COUNT with DISTINCT

COUNT(DISTINCT column_name)

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

--- type:NormalExercise lang:r xp:100 skills:1 key:ff98f7f3da
## Fun with aggregate functions

AVE, MIN, MAX, SUM on numeric columns

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

--- type:VideoExercise lang:r xp:50 skills:1 key:413ec106e4
## Simple math in SQL

* Doing basic arithmetic on columns (+, -, *, /, %)
* Introduce column aliases via AS as a way to name columns in query result. Will become even more useful later in the course
* ROUND, FLOOR, CEILING

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:db86d092a0
## From seconds to minutes

Compute AVG and SUM of reading time in minutes instead of seconds, using aliases to name resulting columns. Do the same, but round one of the columns to nearest integer

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

--- type:NormalExercise lang:r xp:100 skills:1 key:5a7f6bdd0e
## How long have you been here?

First return all columns from the authors table, then add a column which gives the number of years each author has been writing for the blog (i.e. 2017 - year_joined)

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
