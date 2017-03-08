CREATE TABLE films (
  id                    INTEGER     PRIMARY KEY,
  title                 VARCHAR,
  release_year          INTEGER,
  distributor           VARCHAR,
  director              VARCHAR,
  running_time_minutes  INTEGER,
  budget_millions       REAL,
  box_office_millions   REAL
);

CREATE TABLE actors (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  dob                   DATE,
  dod                   DATE
);

CREATE TABLE locations (
  id                    INTEGER     PRIMARY KEY,
  address               VARCHAR,
  fun_facts             VARCHAR
);

-- will throw error: `(film_id)=(1) already exists`, as we have non unique rows for film_id
-- to avoid, we use id as primary key as per:
-- http://stackoverflow.com/questions/6895419/postgresql-error-duplicate-key-value-violates-unique-constraint

CREATE TABLE casts (
  id                    INTEGER     PRIMARY KEY,
  film_id               INTEGER,
  actor_id              INTEGER
);

-- Copy over data from CSVs
\copy films FROM 'data/films/films.csv' DELIMITER ',' CSV HEADER;
\copy actors FROM 'data/films/actors.csv' DELIMITER ',' CSV HEADER;
\copy locations FROM 'data/films/locations.csv' DELIMITER ',' CSV HEADER;
\copy casts FROM 'data/films/casts.csv' DELIMITER ',' CSV HEADER;

/*
createdb films
psql films < data/films/films.sql
*/
