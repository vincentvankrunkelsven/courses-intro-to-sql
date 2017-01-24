---
title: Sorting and grouping
description: Description

--- type:VideoExercise lang:r xp:50 skills:1 key:1a71e69e84
## Sort with ORDER BY

* ORDER BY
  * Single column
  * Multiple columns
  * DESC

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:ad69d60796
## Sort by a single column

Use ORDER BY on one column at a time, with and without DESC

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

--- type:NormalExercise lang:r xp:100 skills:1 key:81899b670b
## Sort by multiple columns

Use  ORDER BY on multiple columns. Make tiebreaker analogy. Embed MCE to interpret single value from last result

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

--- type:VideoExercise lang:r xp:50 skills:1 key:d22ebac103
## Get started with GROUP BY

* GROUP BY
  * Single column
  * Multiple columns
* Combine with ORDER BY
* Introduce column aliases via AS as a convenient shorthand. Will become even more useful later in chapter

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:92bd2ff5b9
## Everything in its right place

Q: Which of the following sorts column1 in ascending order within each level of column2?
A:
SELECT column1 AS c1, column2 AS c2
FROM table_name
GROUP BY c1
ORDER BY c2;

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:38022b4648
## Sort within groups

Combine GROUP BY and ORDER BY to sort within groups. Embed another MCE at end to interpret last result

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

--- type:VideoExercise lang:r xp:50 skills:1 key:ab40311cfc
## Combine GROUP BY with aggregate functions

* Unleash the full power of GROUP BY and aggregate functions by combining them to perform operations within groups
* Examples covering grouped COUNT, SUM, AVG

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:r xp:100 skills:1 key:a27cc4921c
## Compute group extremes

Combine GROUP BY with MIN and MAX to compute the extreme values within each group for a couple of variables

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

--- type:NormalExercise lang:r xp:100 skills:1 key:778c8a8c12
## Sort by group averages

Compute group averages, then sort by the averages

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

--- type:VideoExercise lang:r xp:50 skills:1 key:4d6dff1105
## Filtering with aggregate functions

* WHERE keyword cannot be used to filter results from aggregate functions
* Enter HAVING
* Walk through several examples (this is not intuitive)
* Can't use aliases in the HAVING clause since evaluated before the SELECT clause
* Brief discussion of order of operations (note to self: should this come sooner in the course?)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:745c7b452a
## Order of operations

Check understanding of the order of operations, i.e. HAVING executes before SELECT, so alias is not helpful here

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:fd4b11369c
## HAVING patience

Compute group values, then filter for values above/below a certain threshold using HAVING

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

--- type:NormalExercise lang:r xp:100 skills:1 key:7e764376e8
## Combine HAVING with ORDER BY

Same as above, plus sort results by same group values. Note you can refer to the column alias in the ORDER BY since it's executed last

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
