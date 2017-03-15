setwd("/Users/colinedwardricardo/Desktop/courses-intro-to-sql/data/films/")
library(lubridate)
library(purrr)
library(readr)
library(dplyr)
library(stringr)
library(data.table)
library(tidyr)

# read in data
original <- read_csv('raw/raw.csv')

# make col headers lowercase, replace spaces
names(original) <- str_replace(tolower(names(original)), ' ', '_')

# change locations to location
names(original)[3] <- 'location'

# remove duplicate rows
unique_original <- original %>% group_by(title) %>% filter(row_number() == 1)

# remove extra 12th column left over
unique_original <- select(unique_original, -12)

glimpse(original)

# function to get all unique values for columns
get_unique <- function (x, col_nums, new_name) {
  full_list <- unlist(map(x[col_nums], unlist))
  unique_values <-na.omit(unique(full_list))
  l <- length(unique_values)

  df <- data_frame(unique_values)
  df <- arrange(df, unique_values)
  id <- c(1:l)

  df$id <- id
  df <- select(df, id, unique_values)
  names(df)[2] <- new_name
  df
}

# populates actors.csv
actors <- get_unique(original, c(9:11), 'actors') %>%
  select(actor_id=id, name=actors)
write_csv(actors, path='actors.csv', na='')

# populates locations.csv
# get unique locations and keys, order, and set appropriate col names
locations <- get_unique(original, 3, 'address') %>%
  select(location_id=id, address)

#Use previously created unique set in order to pull fun facts for the locations
unique_original_loc <- select(unique_original, 3, 4)

loc_merged <- merge(x=locations, y=unique_original_loc, all.x=TRUE, by.x='address', by.y='location')

# could probably skip this line by joining the opposite direction above
loc_merged <- loc_merged %>%
  group_by(address) %>%
  filter(row_number() == 1) %>%
  select(2,1,4)

write_csv(loc_merged, path='locations.csv', na='')

# populate cast.csv
unique_films <- get_unique(original, 1, "title") %>%
  select(film_id=id, title)

# add film ids to unique rows table
unique_full <- merge(x=unique_films, y=unique_original)

# create table with film ids and the corresponding actors
film_actors <- select(unique_full, 2, 10, 11, 12)

# exclude film_id
gthr <- gather(film_actors, 'Actor 1', 'Actor 2', -1) %>%
  # arrange by film_id, e.g. 1, 1, 1, 2, 2, 3 etc.
  arrange(film_id) %>%
  # select first col, and third col, call third col 'name'
  select(1, name=3)

# only take non NAs
gthr <- gthr[complete.cases(gthr),]

# populate casts.csv
# film_id, actor_id, actor so we remove actor name
# if row in x but not in y, keep x
cast_list <- merge(x=gthr, y=actors, all.x=TRUE) %>%
  select(2, 3) %>%
   arrange(film_id)

cast_list$id <- c(1:nrow(cast_list))
cast_list <- select(cast_list, 3, 1, 2)
write_csv(cast_list, path = "casts.csv")

# populate films.csv
# select cols 2, 3 from casts.csv
films <- unique_full %>%
  select(2, 1, 3, 7, 8)
write_csv(films, path='films.csv', na = '')
