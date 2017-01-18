---
title: Selecting and summarizing columns
description: This is a template chapter.

--- type:VideoExercise lang:r xp:50 skills:1 key:0ed64dcc64
## Introduction

* Motivating example (case study preview)
* Why not just use R/Python/etc? Memory, speed, etc.
* Database vocabulary (in context of example)
  * Database
  * Tables
  * Columns & rows (a.k.a. records)
  * Fields (informal = cells)
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:dbde251efa
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

--- type:NormalExercise lang:r xp:100 skills:1 key:1ab52d1c2f
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

--- type:NormalExercise lang:r xp:100 skills:1 key:eaeced03e4
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:f4024e2997
## Select the proper SELECT

(Test for style and syntax)

Q: Which of the following is the proper way to select all distinct values of column_name from the table_name table?
A: 
SELECT DISTINCT column_name
FROM table_name;

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:VideoExercise lang:r xp:50 skills:1 key:6f04742cd0
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

--- type:NormalExercise lang:r xp:100 skills:1 key:5a7abead3d
## COUNT

COUNT(*) counts NULLs, COUNT(column_name) excludes NULLs, COUNT(DISTINCT column_name)

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

--- type:NormalExercise lang:r xp:100 skills:1 key:5a4c5e5012
## SUM and AVG

Find SUM and AVG of numeric column. Embedded MCE to interpret result

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

--- type:NormalExercise lang:r xp:100 skills:1 key:5022ac4a6e
## MIN and MAX

MIN and MAX of numeric column. Embedded MCE to interpret result

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
