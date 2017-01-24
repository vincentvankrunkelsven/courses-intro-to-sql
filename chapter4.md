---
title: 'Case study: New York City bike share'
description: Description

--- type:VideoExercise lang:r xp:50 skills:1 key:88f0e8e324
## Introduction to the data

* Intro Citi Bike database: trips, stations, weather
* Part of an urban planning committee trying to understand biking habits in NYC
* Will be exploring a number of questions, practicing your SQL skills along the way
* Quick refresher of chapter 1 concepts (SELECT, DISTINCT, aggregate functions)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:c4e9e9cb6e
## How many records?

How many records are in the stations, trips, and weather tables, respectively? 498, 9937968, 365 (numbers may change if/when we subset the data to e.g. summer only)

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:63b1e3cf32
## Preview the tables

SELECT some columns from weather, then from stations, then from weather. But intro LIMIT for the last, since we don't want to retrieve all records from such a huge table

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

--- type:NormalExercise lang:r xp:100 skills:1 key:18e91336b0
## Explore the data

* How many bikes? SELECT COUNT(DISTINCT bike_id) FROM trips;
* Minimum, average, and maximum trip lengths (in seconds, minutes)?
* Minimum, average, and maximum mean_temp_f?

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

--- type:VideoExercise lang:r xp:50 skills:1 key:3795daa397
## Refresher: filtering rows

* Quick review of chapter 2 concepts
* Pose some interested questions to be answered in the following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:8b9e829826
## When it rains, it pours

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

--- type:NormalExercise lang:r xp:100 skills:1 key:04d9396ee5
## Title 7

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

--- type:VideoExercise lang:r xp:50 skills:1 key:86beaf8ab2
## Refresher: sorting and grouping

Content

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:e27c507b86
## Average trip duration by starting station

Compute the average trip duration by starting station and order the result by station id: 

SELECT start_station_id AS station, AVG(duration) AS seconds 
FROM trips 
GROUP BY station 
ORDER BY station;

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

--- type:NormalExercise lang:r xp:100 skills:1 key:0a5475c25e
## Again, but only the longest

Takes us to a station out in Bed-Stuy, Brooklyn!

SELECT start_station_id AS station, AVG(duration) AS seconds 
FROM trips 
GROUP BY station 
HAVING AVG(duration) > 2000
ORDER BY seconds DESC;

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

--- type:VideoExercise lang:r xp:50 skills:1 key:5257e201fd
## Summary

Content

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8
