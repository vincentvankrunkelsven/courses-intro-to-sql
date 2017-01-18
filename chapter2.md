---
title: Filtering rows
description: Description

--- type:VideoExercise lang:r xp:50 skills:1 key:83d0ed5848
## Filter rows with WHERE

* WHERE
* Filtering numeric vs. text values
* Basic comparison operators: =, <>, <, <=, >, >=
* Multiple conditions with AND, OR

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:f2aaa7d624
## Filter for a single condition

Practice filtering for numeric and text values. Start with = and <>, then move to inequalities

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

--- type:NormalExercise lang:r xp:100 skills:1 key:8e97f3e696
## Filter for multiple conditions

Same as above, but incorporate AND, OR. Recall something from chapter 1, like DISTINCT or aggregate functions? Do at least one >= AND <= for comparison to BETWEEN in later exercise

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

--- type:VideoExercise lang:r xp:50 skills:1 key:e3af82cfd2
## More advanced filtering

* BETWEEN (compare to >= AND <= )
* IN (compare to = AND = )
* IS NULL, IS NOT NULL

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:c821fd5bf5
## Look familiar?

Give students a SELECT statement using BETWEEN and have them select an equivalent statement using >= AND <=

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:92ae1c6f6d
## Stuck somewhere IN BETWEEN

Practice filtering with BETWEEN and IN

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

--- type:NormalExercise lang:r xp:100 skills:1 key:dae620caf0
## Manage missingness

Practice with IN NULL and IS NOT NULL. Combine with COUNT, DISTINCT, and/or other concepts from earlier

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

--- type:VideoExercise lang:r xp:50 skills:1 key:f1a18f3e40
## Search for patterns with LIKE

* LIKE
* Wildcards: %, _, [charlist], [!charlist]

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:fcce25111c
## LIKE it or NOT

Practice with some simple pattern matching using LIKE with % and _. Then combine with NOT.

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

--- type:NormalExercise lang:r xp:100 skills:1 key:a959c5cbf9
## Pattern matching mania

Practice with LIKE some more, using more advanced wildcards: sets and ranges of characters. Use negation (!) as well. Finish with embedded MCE for interpretation

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

--- type:VideoExercise lang:r xp:50 skills:1 key:5d2ea34dea
## Simple subqueries

Content

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:5e0082aeac
## Title

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

--- type:NormalExercise lang:r xp:100 skills:1 key:e64d900a47
## Title

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
