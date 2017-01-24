library(readr)
library(dplyr)
set.seed(232)

# authors: id, first_name, last_name, year_joined
authors <- data_frame(
  id = 1:5,
  first_name = c("Donna", "Lisa", "Shai", "Talia", "Frank"),
  last_name = c("White", "Smith", "Waters", "Francis", "Davis"),
  year_joined = c(2012, 2014, 2014, 2016, 2017)
)

# users: id, username, age, status
users <- data_frame(
  id = 1:10,
  user_name = c("tomcat12", "braveheart", "cbh1223", "nevermind99", "sporty88",
                "datalover", "avidreader", "xfactor99", "rsquared", "noname"),
  age = sample(18:55, 10, replace = TRUE),
  trip_planned = sample(c("Yes", "No"), 10, replace = TRUE),
  status = sample(c("Free", "Paid"), 10, replace = TRUE)
)
users$age[users$status == "Free"] <- ""
users$trip_planned[users$status == "Free"] <- ""

some_dates <- seq.Date(as.Date("2017-01-01"), as.Date("2017-01-31"), by = "day") %>%
  sample(8, replace = TRUE) %>%
  sort()
some_titles <- c(
  "US National Parks in a Nutshell",
  "A Whirlwind Tour of Massachusetts",
  "Crab Feasts in Baltimore",
  "A Beginners Guide to the Rocky Mountains",
  "Hiking the Rockies (Part 1)",
  "Hiking the Rockies (Part 2)",
  "A Wine-Lover's Guide to Napa Valley",
  "This Year's Most Affordable Getaways"
)

# posts: id, date, author_id, title
posts <- data_frame(
  id = 1:8,
  date = some_dates,
  author_id = c(3, 5, 1, 2, 2, 2, 4, 1),
  title = some_titles
)

some_more_dates <- seq.Date(as.Date("2017-01-01"), as.Date("2017-02-28"), by = "day") %>%
  sample(35, replace = TRUE) %>%
  sort()

# reads: id, date, user_id, post_id, duration
reads <- data_frame(
  date = some_more_dates,
  user_id = sample(users$id, 35, replace = TRUE),
  post_id = sample(posts$id, 35, replace = TRUE),
  duration = sample(30:600, 35, replace = TRUE)
) %>% inner_join(posts %>% select(id, date_posted = date), by = c("post_id" = "id")) %>%
  filter(date > date_posted) %>%
  bind_cols(data_frame(id = 1:nrow(.))) %>%
  select(id, date:duration)
reads$duration[c(8, 13, 20)] <- c(12033, 3303, 7799)

# write csvs
path <- "data/blog-data-raw/"
write_csv(authors, file.path(path, "authors.csv"))
write_csv(users, file.path(path, "users.csv"))
write_csv(posts, file.path(path, "posts.csv"))
write_csv(reads, file.path(path, "reads.csv"))

# remove cruft
rm(some_dates)
rm(some_titles)
rm(some_more_dates)

# print all tables
sapply(ls(), get)
