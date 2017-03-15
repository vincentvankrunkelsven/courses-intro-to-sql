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

######

SELECT column-names
  FROM table-name1
 WHERE value IN (SELECT column-name
                   FROM table-name2
                  WHERE condition)

SELECT column1 = (SELECT column-name FROM table-name WHERE condition),
                         column-names
                    FROM table-name
                   WEHRE condition

SELECT FirstName, LastName,
                          OrderCount = (SELECT COUNT(O.Id) FROM [Order] O WHERE O.CustomerId = C.Id)
                     FROM Customer C

<!-- SELECT (SELECT r.id from reviews r WHERE r.num_votes = 11158)
                     FROM films AS f;
                    -->

<!-- SELECT t.*
                    FROM (
                        SELECT SUM(points) AS total_points
                        FROM sometable
                        GROUP BY username
                    ) t
                    WHERE total_points > 25 -->
