# Intro to SQL for Data Science

## Chapter 1: Selecting and summarizing columns

* Motivating example (case study preview)
* Why not just use R/Python/etc? Memory, speed, etc.
* Database vocabulary (in context of example)
  * Database
  * Tables
  * Columns & rows (a.k.a. records)
  * Fields (informal = cells)
* Basic SQL syntax (e.g. end statement with semicolon)
* SELECT
* Aliases with AS
* Aggregate functions
  * COUNT (both COUNT(*) and COUNT(column_name))
  * SUM
  * AVG
  * MIN
  * MAX
* DISTINCT

## Chapter 2: Filtering rows

* WHERE
* Filtering numeric vs. text values
* Operators
  * =, <>, <, >, <=, >=
  * BETWEEN, LIKE, IN
  * IS NULL, IS NOT NULL
* Multiple conditions (AND & OR)
* Simple subqueries (teaser for joins)

## Chapter 3: Sorting and grouping

* ORDER BY
  * Single column
  * Multiple columns
  * DESC
* GROUP BY + ORDER BY
* GROUP BY + aggregate functions

## Chapter 4: Putting it all together

* Introduce Citi Bike database and narrative (urban planning research)
* Disclaimer: dates are tricky (removed times for simplicity)
* LIMIT for limiting number of records returned
* Some example questions (likely a subset of these, create a narrative?):
  * In which month is ridership highest?
  * Is ridership higher or lower on weekends compared to weekdays?
  * What about national holidays?
  * What are the most and least popular stations?
  * What's the most popular route?
  * Is the least popular route very long (or very short)?
  * What's the average trip duration in seconds? In minutes?
  * What's the fastest trip between two specific stations?
  * Are the days with the highest precipitation among the lowest in terms of ridership?
