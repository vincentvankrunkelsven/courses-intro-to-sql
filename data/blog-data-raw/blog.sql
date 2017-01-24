CREATE TABLE authors (
  id                    INTEGER     PRIMARY KEY,
  first_name            VARCHAR,
  last_name             VARCHAR,
  year_joined           INTEGER
);

CREATE TABLE posts (
  id                    INTEGER     PRIMARY KEY,
  date                  DATE,
  author_id             INTEGER,
  title                 VARCHAR
);

CREATE TABLE users (
  id                    INTEGER     PRIMARY KEY,
  username              VARCHAR,
  age                   INTEGER,
  trip_planned          VARCHAR,
  status                VARCHAR
);

CREATE TABLE reads (
  id                    INTEGER     PRIMARY KEY,
  date                  DATE,
  user_id               INTEGER,
  post_id               INTEGER,
  duration              INTEGER
);

-- Copy over data from CSVs
\copy authors FROM 'data/blog-data-raw/authors.csv' DELIMITER ',' CSV HEADER;
\copy posts FROM 'data/blog-data-raw/posts.csv' DELIMITER ',' CSV HEADER;
\copy users FROM 'data/blog-data-raw/users.csv' DELIMITER ',' CSV HEADER;
\copy reads FROM 'data/blog-data-raw/reads.csv' DELIMITER ',' CSV HEADER;

/*
createdb blog
psql blog < data/blog-data-raw/blog.sql
*/
