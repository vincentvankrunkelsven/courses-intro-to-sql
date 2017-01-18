---
title: Selecting and summarizing columns
description: This is a template chapter.

--- type:VideoExercise lang:r xp:50 skills:1 key:37a4514873
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:e39702c14b
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

--- type:NormalExercise lang:r xp:100 skills:1 key:f044021639
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

--- type:NormalExercise lang:r xp:100 skills:1 key:4a432ceffd
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:23e5fa3f6e
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

--- type:VideoExercise lang:r xp:50 skills:1 key:23721c9847
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

--- type:NormalExercise lang:r xp:100 skills:1 key:cc8d80c4d5
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

--- type:NormalExercise lang:r xp:100 skills:1 key:1115e20a57
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

--- type:NormalExercise lang:r xp:100 skills:1 key:4b1ec9f071
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
