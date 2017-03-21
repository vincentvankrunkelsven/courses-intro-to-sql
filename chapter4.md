---
title: 'Case Study: Citi Bike In New York City'
description: >-
  This chapter gives you an opportunity to apply everything you've learned in
  the first three chapters to real-world data! You'll be working with a database
  that contains information on millions of individual bike share trips in New
  York City in 2015, along with the stations the bikes belong to, and daily
  weather metrics recorded from Central Park during the same time period.

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:8e3524960e
## Get to Know Your Data
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

--- type:TabExercise lang:sql xp:100 skills:1 key:feae971647
## Know Your LIMITs
- Selecting from the different tables, but using LIMIT
- Counts

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
How many trips were made in 2015?
*** =solution1
```
SELECT COUNT(*)
FROM trips;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
Using LIMIT to display only top 10 results.
*** =solution2
```
SELECT *
FROM trips
LIMIT 10;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
How many different bikes are there?
*** =solution3
```
SELECT COUNT(DISTINCT bike_id)
FROM trips;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4

*** =solution4
```
SELECT COUNT(DISTINCT id)
FROM trips;
```
*** =sct4:


--- type:TabExercise lang:sql xp:100 skills:1 key:5f834c6a08
## Make Your Way Around (The Dataset)
Getting MIN, MAX, AVG

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
How long was the longest trip?
*** =solution1
```
SELECT MAX(duration)
FROM trips;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
How long was the shortest trip?
*** =solution2
```
SELECT MIN(duration)
FROM trips;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
How long was the average trip, in seconds?
*** =solution3
```
SELECT AVG(duration)
FROM trips;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
How long was the average trip, in minutes?
*** =solution4
```
SELECT AVG(duration) / 60
FROM trips;
```
*** =sct4:

*** =type5: NormalExercise
*** =instructions5
How much time total was spent on trips, in days?
*** =solution5
```
SELECT SUM(duration) / 60 / 60 / 24
FROM trips;
```
*** =sct5:

--- type:TabExercise lang:sql xp:100 skills:1 key:48b9934c8f
## Filtering
Filtering based on various criteria

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
How many days did it rain?
*** =solution1
```
SELECT COUNT(*)
FROM weather
WHERE events = 'Rain';
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
How many days do we not have data for?
*** =solution2
```
SELECT COUNT(*)
FROM weather
WHERE events IS NULL;
```
*** =sct2:

--- type:TabExercise lang:sql xp:100 skills:1 key:aadfa696e6
## Weather
Some weather related questions

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
How many days was it cloudy?
*** =solution1
```
SELECT COUNT(*)
FROM weather
WHERE cloud_cover = 0 OR cloud_cover IS NULL;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
How many days did it snow?
*** =solution2
```
SELECT COUNT(*)
FROM weather
WHERE events LIKE '%Snow';
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
How many days did it rain? (All variants).
*** =solution3
```
SELECT *
FROM weather
WHERE events LIKE '%Rain';
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
How many days was cloud cover greater than 5?
*** =solution4
```
SELECT COUNT(*)
FROM weather
WHERE cloud_cover > 5;
```
*** =sct4:

*** =type5: NormalExercise
*** =instructions5
How many days did it rain more than 0.5 inches?
*** =solution5
```
SELECT COUNT(*)
FROM weather
WHERE precipitation_in > 0.5;
```
*** =sct5:

*** =type6: NormalExercise
*** =instructions6
What was the average mean temperature for the year?
*** =solution6
```
SELECT AVG(mean_temp_f)
FROM weather;
```
*** =sct6:

--- type:TabExercise lang:sql xp:100 skills:1 key:f222b67a81
## Stations
Some questions related to stations

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
Are there any days on which no trips were made?
*** =solution1
```
SELECT *
FROM trips
WHERE id IS NULL;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
Which station was started from the most?
*** =solution2
```
SELECT station_id, COUNT(station_id)
FROM trips;
```
*** =sct2:

*** =type3: NormalExercise
*** =instructions3
What were the top ten most popular stations to start from?
*** =solution3
```
SELECT start_station_id, COUNT(start_station_id)
FROM trips
GROUP BY start_station_id
ORDER BY count DESC
LIMIT 10;
```
*** =sct3:

*** =type4: NormalExercise
*** =instructions4
What were the top ten least popular stations to start from?
*** =solution4
```
SELECT start_station_id, COUNT(start_station_id)
FROM trips
GROUP BY start_station_id
ORDER BY count
LIMIT 10;
```
*** =sct4:

--- type:TabExercise lang:sql xp:100 skills:1 key:6bda1c10dc
## Times
Some time related questions - e.g. most popular days to go cycling, etc.

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
Which date had the most trips?
*** =solution1
```
SELECT start_date, COUNT(*)
FROM trips
GROUP BY start_date
ORDER BY count DESC
LIMIT 10;
```
*** =sct1:

*** =type2: NormalExercise
*** =instructions2
How many trips were made on Christmas Day?
*** =solution2
```
SELECT COUNT(*)
FROM trips
WHERE start_date = '2015-12-25';
```
*** =sct2:
