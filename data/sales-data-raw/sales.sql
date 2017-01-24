CREATE TABLE sales (
  id                    INTEGER     PRIMARY KEY,
  date                  DATE,
  customer_id           INTEGER,
  product_id            INTEGER,
  payment_type          VARCHAR
);

CREATE TABLE products (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  price                 NUMERIC,
  mfr                   VARCHAR
);

CREATE TABLE customers (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  age                   INTEGER,
  state                 CHAR(2)
);

-- Copy over data from CSVs
\copy sales FROM 'data/sales-data-raw/sales.csv' DELIMITER ',' CSV;
\copy products FROM 'data/sales-data-raw/products.csv' DELIMITER ',' CSV;
\copy customers FROM 'data/sales-data-raw/customers.csv' DELIMITER ',' CSV;

/*
createdb sales
psql sales < data/sales-data-raw/sales.sql
*/
