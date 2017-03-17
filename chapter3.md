---
title: Sorting and grouping
description: >-
  Now that you've learned how to select the rows and columns you're most
  interested in, you'll take your analyses to the next level by learning how to
  sort and group tables by variables of interest. In particular, you'll see how
  to combine GROUP BY with aggregate functions like SUM and AVG to summarize
  your data within groups—a very powerful paradigm!

--- type:VideoExercise lang:sql xp:50 skills:1 key:1e7ee5ea17
## Sort with ORDER BY

* ORDER BY
  * Single column
  * Multiple columns
  * DESC

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:07c3efa162
## Sort by a single column

Use ORDER BY on one column at a time, with and without DESC

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:3cd0b1b3f0
## Sort by multiple columns

Use  ORDER BY on multiple columns. Make "tiebreaker" analogy. Embed MCE to interpret single value from last result

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:7bae86f836
## Get started with GROUP BY

* GROUP BY
  * Single column
  * Multiple columns
* Combine with ORDER BY
* Column aliasing refresher, use with ORDER BY

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:f7d993bf4a
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
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:fee2ef217a
## Sort within groups

Combine GROUP BY and ORDER BY to sort within groups. Embed another MCE at end to interpret last result

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:8db66ff1ab
## Combine GROUP BY with aggregate functions

* Unleash the full power of GROUP BY and aggregate functions by combining them to perform operations within groups
* Examples covering grouped COUNT, SUM, AVG

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:a4699e8edd
## Compute group extremes

Combine GROUP BY with MIN and MAX to compute the extreme values within each group for a couple of variables

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:9b8a92b782
## Sort by group averages

Compute group averages, then sort by the averages

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

--- type:VideoExercise lang:sql xp:50 skills:1 key:8ef71190e3
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

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:f4016de9c5
## Order of operations

Check understanding of the order of operations, i.e. HAVING executes before SELECT, so alias is not helpful here

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:d4265c2dcf
## HAVING patience

Compute group values, then filter for values above/below a certain threshold using HAVING

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

--- type:NormalExercise lang:sql xp:100 skills:1 key:f76b78916e
## Combine HAVING with ORDER BY

Same as above, plus sort results by same group values. Note you can refer to the column alias in the ORDER BY since it's executed last

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
