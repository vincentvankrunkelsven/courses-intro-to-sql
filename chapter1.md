---
title: Selecting and summarizing columns
description: This is a template chapter.

--- type:VideoExercise lang:r xp:50 skills:1 key:098eabb180
## Introduction

Content

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:9b7d5e5c60
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

--- type:NormalExercise lang:r xp:100 skills:1 key:be495706c3
## Simple SELECT statements

Single column, multiple columns, all columns (*). Order matters!

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

--- type:NormalExercise lang:r xp:100 skills:1 key:9a295d6e88
## Select the correct SELECT

Q: Which of the following is the proper way to select the column_name column from the table_name table?
A: SELECT column_name FROM table_name;

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

--- type:VideoExercise lang:r xp:50 skills:1 key:513763ceb9
## Aggregate functions

* COUNT (both COUNT(*) and COUNT(column_name))
* SUM
* AVG
* MIN
* MAX

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:9111147ed8
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

--- type:NormalExercise lang:r xp:100 skills:1 key:6ff1d4adc9
## SUM, AVG, MIN, and MAX

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

--- type:VideoExercise lang:r xp:50 skills:1 key:6c88a3104b
## DISTINCT and AS

* DISTINCT
* Aliases with AS
  * Column aliases for controlling display, easier reference (will come in handy later)
  * Can also create table aliases, helpful when working with multiple tables (not relevant here)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:c4d843b9b6
## The details of DISTINCT

Q: Which of the following will return the most records?
A: <The SELECT statement that uses DISTINCT on a single column>

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:1b3631cd35
## Combine COUNT and DISTINCT

COUNT(DISTINCT column_name), etc.

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

--- type:NormalExercise lang:r xp:100 skills:1 key:ca0893b74e
## Create aliases with AS

Column aliases for more control over display, e.g. COUNT(column_name) AS n_something

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
