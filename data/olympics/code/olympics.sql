CREATE TABLE athletes (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  gender                CHAR(1),
  nationality           CHAR(3)
);

CREATE TABLE editions (
  id                    INTEGER     PRIMARY KEY,
  year                  INTEGER,
  city                  VARCHAR
);

CREATE TABLE events (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  sport                 VARCHAR,
  discipline            VARCHAR
);

CREATE TABLE countries (
  id                    CHAR(3)     PRIMARY KEY,
  country               VARCHAR
);

-- Copy over data from CSVs
\copy athletes FROM 'data/olympics/athletes.csv' DELIMITER ',' CSV HEADER;
\copy editions FROM 'data/olympics/editions.csv' DELIMITER ',' CSV HEADER;
\copy events FROM 'data/olympics/events.csv' DELIMITER ',' CSV HEADER;
\copy countries FROM 'data/olympics/countries.csv' DELIMITER ',' CSV HEADER;

/*
createdb olympics
psql olympics < data/olympics/olympics.sql
*/
