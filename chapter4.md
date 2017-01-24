---
title: 'Case study: New York City bike share'
description: Description

--- type:VideoExercise lang:r xp:50 skills:1 key:95a02647f2
## Introduction to the data

* Intro Citi Bike database: trips, stations, weather
* Part of an urban planning committee trying to understand biking habits in NYC
* Will be exploring a number of questions, practicing your SQL skills along the way
* Quick refresher of chapter 1 concepts (SELECT, DISTINCT, aggregate functions)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:aeffbbd6ee
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

--- type:NormalExercise lang:r xp:100 skills:1 key:d1364b703a
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

--- type:NormalExercise lang:r xp:100 skills:1 key:24b25f8bad
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

--- type:VideoExercise lang:r xp:50 skills:1 key:54c3410c20
## Refresher: filtering rows

* Quick review of chapter 2 concepts (filtering rows)
* Pose some interested questions to be answered in the following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:fa3248d236
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

--- type:NormalExercise lang:r xp:100 skills:1 key:3e3ad8bb28
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

--- type:VideoExercise lang:r xp:50 skills:1 key:c2f80aea33
## Refresher: sorting and grouping

* Refresher of chapter 3 concepts (sorting and grouping)
* Pose some interesting questions to be answered in following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:d792e28129
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

--- type:NormalExercise lang:r xp:100 skills:1 key:91a278ba12
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

--- type:VideoExercise lang:r xp:50 skills:1 key:9e8fed7345
## Summary

Content

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8
