---
title: Filtering rows
description: >-
  This chapter builds on the first by teaching you not only how to select and
  summarize columns of interest, but to filter tables for records satisfying
  some criteria of interest. You'll learn how to use basic comparison operators,
  combine multiple criteria, match patterns in text, and much more.

--- type:VideoExercise lang:sql xp:50 skills:1 key:16ee3ac33c
## Filter rows with WHERE

* WHERE
* Filtering numeric vs. text values
* Basic comparison operators: =, <>, <, <=, >, >=
* Multiple conditions with AND, OR

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:fe303a2df8
## Filter for a single condition

Practice filtering for numeric and text values. Start with = and <>, then move to inequalities

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:a5f129f91b
## Filter for multiple conditions

Same as above, but incorporate AND, OR. Recall something from chapter 1, like DISTINCT or aggregate functions? Do at least one >= AND <= for comparison to BETWEEN in later exercise

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:373505e3d8
## More advanced filtering

* BETWEEN (compare to >= AND <= )
* IN (compare to = AND = )
* IS NULL, IS NOT NULL

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:96018df98a
## Look familiar?

Give students a SELECT statement using BETWEEN and have them select an equivalent statement using >= AND <=

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:da87a6f306
## Stuck somewhere IN BETWEEN

Practice filtering with BETWEEN and IN

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:dcc3657853
## Manage missingness

Practice with IS NULL and IS NOT NULL. Combine with COUNT, DISTINCT, and/or other concepts from earlier

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:c988eea55b
## Pattern matching

* LIKE
* Wildcards (%, _)
* Very simple regular expressions (~, [a-z], [0-9], +, *)
* Caveat that some of these more advanced features may vary between DBMS

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:684d4152a4
## LIKE it or NOT

Practice with some simple pattern matching using LIKE with % and _. Then combine with NOT.

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:9e6ff660d3
## Regular expressions round-up

Practice using simple regular expressions to locate usernames in the users table. Finish with embedded MCE for interpretation

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:c33a39ab77
## Simple subqueries

Introduce subqueries as a convenient way to filter on values that aren't readily available in the table of interest. These values may be the result of a second filtering operation on the same table, or they may come from a different table entirely. Use as teaser for future course covering joins. We will only cover very simple examples here

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:98114f9e84
## Single table subqueries

Perform a couple of subqueries using information from only one table. Finish with embedded MCE to drill home motivation

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:cd1cb8db1d
## Two table subqueries

Perform some two table subqueries (i.e. use values from another table to filter this table). Finish again with an MCE to interpret the results

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
