#### Questions
- Subqueries would ideally require a connection between location and film tables

#### General
- NULL vs 0 or ''
- IS NULL vs = NULL

#### Notes
- order of operations: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY
- in PostgreSQL, double quotes denote a column name, while single quotes denote a value

#### Some Code
```sql
-- Wrong
SELECT first_name, count(*)
FROM customer
WHERE count(*) > 1
GROUP BY first_name

-- Right
SELECT first_name, count(*)
FROM customer
GROUP BY first_name
HAVING count(*) > 1

-- Right
SELECT first_name, count(*)
FROM customer
GROUP BY first_name
ORDER BY count(*) DESC

-- Wrong
SELECT first_name, last_name, count(*)
FROM customer
GROUP BY first_name

-- Right
SELECT first_name, MAX(last_name), count(*)
FROM customer
GROUP BY first_name

-- Wrong
SELECT first_name || ' ' || last_name, count(*)
FROM customer
GROUP BY first_name

-- Right
SELECT first_name || ' ' || MAX(last_name), count(*)
FROM customer
GROUP BY first_name

-- Right
SELECT MAX(first_name || ' ' || last_name), count(*)
FROM customer
GROUP BY first_name
```
