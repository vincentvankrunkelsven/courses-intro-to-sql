# Intro to SQL for Data Science

## Chapter 1: Selecting and summarizing columns

* Motivating example (case study preview)
* Why not just use R/Python/etc?
  * Memory
  * Speed
  * Centralization
  * Access control
  * DBMS tools
  * ...?
* Database vocabulary (in context of example; make spreadsheet analogies)
  * Database (~ spreadsheet)
  * Tables (~ worksheet)
  * Columns & records (a.k.a. records) (~ columns & rows)
  * Fields (~ cells)
* Basic SQL syntax
  * Not case-sensitive
  * End statement with semicolon
  * Stylistic conventions (?)
* SELECT
* DISTINCT
* Aggregate functions
  * COUNT (both COUNT(*) and COUNT(column_name))
  * SUM
  * AVG
  * MIN
  * MAX
* Column aliases with AS (?)

## Chapter 2: Filtering rows

* WHERE
* Filtering numeric vs. text values
* Basic comparison operators: =, <>, <, <=, >, >=
* Multiple conditions with AND, OR
* BETWEEN (compare to >= AND <= )
* IN (compare to = AND = )
* IS NULL, IS NOT NULL
* LIKE
* Wildcards: %, _, [charlist], [!charlist]
* Simple subqueries (teaser for joins)

## Chapter 3: Sorting and grouping

* ORDER BY
  * Single column
  * Multiple columns
  * DESC
* GROUP BY
  * Single column
  * Multiple columns
* GROUP BY + ORDER BY
* GROUP BY + aggregate functions
* Filtering based on results from aggregate functions (HAVING)

## Chapter 4: Case study: New York City bike share

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
