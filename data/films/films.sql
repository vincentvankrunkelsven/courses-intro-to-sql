CREATE TABLE films (
  id                    INTEGER     PRIMARY KEY,
  title                 VARCHAR,
  release_year          INTEGER,
  distributor           VARCHAR,
  actor1                VARCHAR,
  actor2                VARCHAR,
  actor3                VARCHAR,
  director_id           INTEGER
);

CREATE TABLE locations (
  id                    INTEGER     PRIMARY KEY,
  address               VARCHAR,
  fun_facts             VARCHAR
);

CREATE TABLE directors (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  date_of_birth         DATE,
  date_of_death         DATE
);

-- Copy over data from CSVs
\copy films FROM 'data/films/films.csv' DELIMITER ',' CSV HEADER;
\copy locations FROM 'data/films/locations.csv' DELIMITER ',' CSV HEADER;
\copy directors FROM 'data/films/directors.csv' DELIMITER ',' CSV HEADER;

/*
createdb films
psql films < data/films/films.sql
*/
