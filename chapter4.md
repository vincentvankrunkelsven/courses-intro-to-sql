---
title: 'Case study: New York City bike share'
description: Description

--- type:VideoExercise lang:r xp:50 skills:1 key:f6dba3b593
## Introduction to the data

* Intro Citi Bike database: trips, stations, weather
* Part of an urban planning committee trying to understand biking habits in NYC
* Will be exploring a number of questions, practicing your SQL skills along the way
* Quick refresher of chapter 1 concepts (SELECT, DISTINCT, aggregate functions)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:cfd2bbec6d
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

--- type:NormalExercise lang:r xp:100 skills:1 key:8f74f4da51
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

--- type:NormalExercise lang:r xp:100 skills:1 key:e57a0cba2c
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

--- type:VideoExercise lang:r xp:50 skills:1 key:3cee8e5981
## Refresher: filtering rows

* Quick review of chapter 2 concepts (filtering rows)
* Pose some interested questions to be answered in the following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:295e283dd4
## When it rains, it pours

* How many days saw more than 1/2 inch of precipitation?
* How many days did it *rain* more than 1/2 inch? (Need to use LIKE to partial match for "Rain" on events column)
* How many days did it rain BETWEEN 1/2 and 1 inches, with cloud cover greater than 6?


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

--- type:NormalExercise lang:r xp:100 skills:1 key:dbf1ed7e2d
## Does rain affect rides?

* What's the average trip length?
* What's the average trip length on days with more than 1/2 inch of rain? (use start_date)

SELECT AVG(duration) 
FROM trips 
WHERE start_date IN (
  SELECT date 
  FROM weather 
  WHERE precipitation_in > 0.5
);

* Finish with multiple choice to interpret result

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

--- type:VideoExercise lang:r xp:50 skills:1 key:c91bca9b4a
## Refresher: sorting and grouping

* Refresher of chapter 3 concepts (sorting and grouping)
* Pose some interesting questions to be answered in following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:9413ecdaf6
## Most popular routes?

Count total number of trips within each combination of start_station_id and end_station_id, then sort in descending order (need to LIMIT result?)

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

--- type:NormalExercise lang:r xp:100 skills:1 key:8c580a71af
## Average trip duration by starting station

Compute the average trip duration by starting station and order the result by station id: 

SELECT start_station_id AS station, AVG(duration) AS seconds 
FROM trips 
GROUP BY station 
ORDER BY station

---

Again, but only the longest trips:

SELECT start_station_id AS station, AVG(duration) AS seconds 
FROM trips 
GROUP BY station 
HAVING AVG(duration) > 2000
ORDER BY seconds DESC;

Takes us to a station out in Bed-Stuy, Brooklyn!

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

--- type:VideoExercise lang:r xp:50 skills:1 key:d2365144ac
## Summary

Summarize what was learned from the case study and the course overall

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8
