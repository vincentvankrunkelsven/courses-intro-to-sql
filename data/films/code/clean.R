set.seed(123)
library(dplyr)
library(purrr)
library(readr)
library(stringr)

options(scipen = 999)

# read in initial data, set type as double to avoid error due to huge budgets in yen
raw <- read_csv("../raw.csv", col_types = cols(budget = col_double()))
# create unique film identifier
raw$film_id <- c(1:nrow(raw))
raw <- select(raw, film_id, 1:28)
raw$movie_title <- str_trim(raw$movie_title)

# create function to get list of unique values over multiple specified columns
get_unique <- function (x, col_nums) {
  
  
  full_list <- unlist(map(x[col_nums], unlist))
  unique_values <-na.omit(unique(full_list))
  l <- length(unique_values)
  
  df <- data_frame(unique_values)
  df <- arrange(df, unique_values)
  id <- c(1:l)
  
  df$id <- id
  df <- select(df, id, unique_values)
  names(df)[2] <- "name"
  df
}

# function to prepare actor/director columns for binding
get_list <- function(x, col_name, r) {
  d <- select(x, film_id, col_name) %>%
    mutate(role = r)
  names(d)[2] <- "name"
  d
}


# create people table and assign unique id
people <- get_unique(raw, c(3, 8, 12, 16))
names(people)[1] <- "person_id"





## roles

# form individual lists with necessary information for each column, then combine them, specifying role
# come back and do this using map function
actor_1 <- get_list(raw, 12, "a")
actor_2 <- get_list(raw, 8, "a")
actor_3 <- get_list(raw, 16, "a")
actors <- bind_rows(actor_1, actor_2, actor_3)

directors <- get_list(raw, 3, "d")


# merge with film dataframe, and people dataframe to get person_ids
actors <- merge(x = actors, y = people)
directors <- merge(x = directors, y = people)

# combine actors and directors into one roles table, assign unique role id, and remove redundant columns
roles <- rbind(actors, directors)
roles$id <- c(1:nrow(roles))
roles <- select(roles, id, film_id, person_id, role)



## reviews 
# create reviews table
reviews <- select(raw, 
                  film_id,
                  num_user = num_user_for_reviews,
                  num_critic = num_critic_for_reviews, 
                  imdb_score, 
                  num_votes = num_voted_users,
                  facebook_likes = movie_facebook_likes)

# assign ids in random order so they don't match up exactly with film ids
reviews$review_id <- sample(nrow(reviews))
reviews <- select(reviews, review_id, 1:7) %>%
  arrange(review_id)


# leave review_id and film_id as is for merging with films table


## films
films <- select(raw, 
                id = film_id,
                title = movie_title,
                release_year = title_year,
                duration,
                gross,
                budget,
                country,
                certification = content_rating,
                language,
                color)

films <- merge(x = films, y = reviews[,1:2], by.x = "id", by.y = "film_id")
films <- select(films, 
                id,
                title,
                release_year,
                duration,
                gross,
                budget,
                country,
                certification,
                language,
                review_id,
                color)

## remove redundant columns and rename for desired output
reviews <- select(reviews, id = review_id, 3:7)
names(people)[1] <- "id"
rm(actor_1, actor_2, actor_3, actors, directors)

# write tables to csv
# write_csv(roles, "../roles.csv", na = "")
# write_csv(people, "../people.csv", na = "")
# write_csv(reviews, "../reviews.csv", na = "")
write_csv(films, "../films.csv", na = "")
# write.csv(films, "../horse.csv", na = "")

