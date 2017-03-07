CREATE TABLE films (
  id                    INTEGER     PRIMARY KEY,
  title                 VARCHAR,
  release_year          INTEGER,
  distributor           VARCHAR,
  lead_actor            VARCHAR,
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
  date_of_birth         DATE
);

-- Copy over data from CSVs
\copy films FROM 'data/sf-data-raw/films.csv' DELIMITER ',' CSV HEADER;
\copy locations FROM 'data/sf-data-raw/locations.csv' DELIMITER ',' CSV HEADER;
\copy directors FROM 'data/sf-data-raw/directors.csv' DELIMITER ',' CSV HEADER;

/*
createdb films
psql films < data/sf-data-raw/films.sql
*/
