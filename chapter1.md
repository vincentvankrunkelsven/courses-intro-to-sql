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
Question goes here.

*** =instructions
-
-
-
-

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sct
```{sql}

```

--- type:TabExercise lang:sql xp:100 skills:1 key:c0bb58f7f9
## Single Column SELECTs
Selecting stuff from single column.

*** =pre_exercise_code
```
```

*** =sample_code
```
SELECT ___
FROM films;
```

*** =type1: NormalExercise
*** =instructions1
Get the title of every film.
*** =solution1
```
SELECT title
FROM films;
```
*** =sct1
```
```

*** =type2: NormalExercise
*** =instructions2
Get all details for every film.
*** =solution2
```
SELECT *
FROM films;
```
*** =sct2
```
```

*** =type3: NormalExercise
*** =instructions3
Get the names of everyone involved in working on the films.
*** =solution3
```
SELECT name
FROM people;
```
*** =sct3
```
```

--- type:TabExercise lang:sql xp:100 skills:1 key:09f21bae4c
## Multiple Column SELECTs
Selecting stuff from multiple columns.
*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Get the title and release year of every film.
*** =solution1
```
SELECT title, release_year
FROM films;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
Get the title, release year and country for every film.
*** =solution2
```
SELECT title, release_year, country
FROM films;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
Get every person's name and their date of birth where possible.
*** =solution3
```
SELECT name, birthdate
FROM people;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
Get every person name and their date of death where possible.
*** =solution4
```
SELECT name, deathdate
FROM people;
```
*** =sct4:

--- type:TabExercise lang:sql xp:100 skills:1 key:de52236965
## SELECT DISTINCT
Selecting distinct stuff from single columns.

*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Get all the different countries.
*** =solution1
```
SELECT DISTINCT country
FROM films;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
Get all the different film languages.
*** =solution2
```
SELECT DISTINCT language
FROM films;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
Get the different types of film roles.
*** =solution3
```
SELECT DISTINCT role
FROM roles;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
Get all the different certification categories.
*** =solution4
```
SELECT DISTINCT certification
FROM films;
```
*** =sct5:

*** =type5: NormalExercise
*** =instructions5
Get all the different IMDB scores - has any scored over 9.5?
*** =solution5
```
SELECT DISTINCT imdb_score
FROM reviews;
```
*** =sct5:

--- type:VideoExercise lang:sql xp:50 skills:1 key:3dd4ef4da9
## Aggregate Functions
- Introducing COUNT
- COUNT DISTINCT
- Difference between COUNT(*), COUNT(col) and COUNT(DISTINCT)
- SUM, AVG, MIN, MAX
- Introduction to Aliasing using AS - ROUND, FLOOR, CEILING

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:TabExercise lang:sql xp:100 skills:1 key:7643365e67
## Learning to COUNT
Simple count exercises.

*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Count the number of rows in the people table.
*** =solution1
```
SELECT COUNT(*)
FROM people;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
Count the number of birthdate entries in the people table.
*** =solution2
```
SELECT COUNT(birthdate)
FROM people;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
Count the number of unique birthdate entries in the people table.
*** =solution3
```
SELECT COUNT(DISTINCT birthdate)
FROM people;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
Count the number of unique languages.
*** =solution4
```
SELECT COUNT(DISTINCT language)
FROM films;
```
*** =sct4:


--- type:TabExercise lang:sql xp:100 skills:1 key:ba95f5cc97
## Different COUNTs
Exercises showing difference between COUNT(*), COUNT(col) AND COUNT(DISTINCT)

*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Instructions for first tab.
*** =solution1
```
Solution code goes here.
```
*** =sct1: SCT for first tab.

--- type:TabExercise lang:sql xp:100 skills:1 key:5260bda57a
## SUM, AVG, MIN, MAX
Simple exercises using SUM, AVG, MIN, MAX

*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Instructions for first tab.
*** =solution1
```
Solution code goes here.
```
*** =sct1: SCT for first tab.

--- type:VideoExercise lang:sql xp:50 skills:1 key:d57162a2ad
## Arithmetic in SQL

- Some stuff about arithmetic in SQL - Introduction to alisaing using AS

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:TabExercise lang:sql xp:100 skills:1 key:6db52132a0
## It's AS simple AS Aliasing
Simple AS exercises.

*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Instructions for first tab.
*** =solution1
```
Solution code goes here.
```
*** =sct1: SCT for first tab.

--- type:TabExercise lang:sql xp:100 skills:1 key:8612897f35
## Even More Aliasing
Some aliasing with arithmetic.
*** =pre_exercise_code
```
Pre-exercise code goes here.
```
*** =sample_code
```
Sample code goes here.
```

*** =type1: NormalExercise
*** =instructions1
Instructions for first tab.
*** =solution1
```
Solution code goes here.
```
*** =sct1: SCT for first tab.
