---
title: Selecting and summarizing columns
description: This is a template chapter.

--- type:VideoExercise lang:r xp:50 skills:1 key:cc22206553
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:4d42d3e116
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

--- type:NormalExercise lang:r xp:100 skills:1 key:ab724352f9
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

--- type:NormalExercise lang:r xp:100 skills:1 key:ef0d40f77a
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

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:334077e0cf
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

--- type:VideoExercise lang:r xp:50 skills:1 key:a91aa0b04b
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

--- type:NormalExercise lang:r xp:100 skills:1 key:ee8a7e7da1
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

--- type:NormalExercise lang:r xp:100 skills:1 key:fe4dd04634
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

--- type:NormalExercise lang:r xp:100 skills:1 key:4ea2f4aa5b
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
