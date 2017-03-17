---
title: Selecting and summarizing columns
description: >-
  This chapter provides a brief introduction to working with relational
  databases. You'll learn about their structure, how to talk about them using
  database lingo, and how to begin an analysis by using simple SQL commands to
  select and summarize columns from database tables.

--- type:VideoExercise lang:sql xp:50 skills:1 key:99c7a591b5
## Introducing SQL

- Motivating example: preview of Citi Bike case study. - Why not just use R / Python?
  - Memory
  - Speed
  - Centralization
  - Acesss control
  - DBMS tools
  - Scalability
- Vocabulary: comparing to spreadsheet
  - Database: like a spreadsheet
  - Table: like a worksheet
  - Columns / Rows: same concept
  - Fields: cells
  - Entities:
  - Attributes:
- Basic SQL syntax
  - We're using PostgreSQL
  - Not case sensitive
  - Statements end with semi-colon
  - Brief intro to order of operations
- Introducing SELECT, SELECT * and DISTINCT - Brief note on LIMIT

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:a1f556e63f
## Which of the following is a good reason to use SQL?

- Question and answers go here.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:c0bb58f7f9
## Single Column SELECTs

- Selecting stuff from single column.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:09f21bae4c
## Multiple Column SELECTs

- Selecting stuff from multiple columns.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:de52236965
## SELECT DISTINCT

- Selecting distinct stuff from single columns.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:VideoExercise lang:sql xp:50 skills:1 key:3dd4ef4da9
## Aggregate Functions

- Introducing COUNT - COUNT DISTINCT - Difference between COUNT(*), COUNT(col) and COUNT(DISTINCT) - SUM, AVG, MIN, MAX - Introduction to Aliasing using AS - ROUND, FLOOR, CEILING

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:7643365e67
## Learning to COUNT

- Simple count exercises.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:ba95f5cc97
## Different COUNTs

- Exercises showing difference between COUNT(*), COUNT(col) AND COUNT(DISTINCT)

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:5260bda57a
## SUM, AVG, MIN, MAX

- Simple exercises using SUM, AVG, MIN, MAX

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:VideoExercise lang:sql xp:50 skills:1 key:d57162a2ad
## Arithmetic in SQL

- Some stuff about arithmetic in SQL - Introduction to alisaing using AS

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:6db52132a0
## It's AS simple AS Aliasing

- Simple AS exercises.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:8612897f35
## Even More Aliasing

- Some aliasing with arithmetic.

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```
