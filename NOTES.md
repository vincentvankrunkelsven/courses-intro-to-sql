# CodeSchool - Try SQL

* Start with a specific example to motivate databases
* Databases used everywhere! Then back to example...
* Structure of databases (following with example)
* Zoom in on one table
* Rows and columns, etc.
* Unique identifies, i.e. primary key
* Exercises begin with a bunch of toy tables + multiple choice / fill-in-the-blank
* Start asking questions that force people to generate [intuitive queries](https://www.dropbox.com/s/38qyt7w4mo3hl73/Screenshot%202017-01-16%2015.17.29.png?dl=0)

* How do we talk to the database? SQL!
* Ask a question that we want to answer
* Show "recipe" for answering the question with SQL (i.e. basic query structure)
* Basic syntax (i.e. colon at end of query)
* Select specific column(s), using * to select all columns
* Introduce WHERE clauses for filtering for specific conditions
* Filter on numbers and strings (single quotes!)

* Seen how to select and filter data, now look at how to arrange
* Introduce the ORDER BY receipe
* Then show DESC (assumes ascending order by default)
* Comparison operators (=, >, <>, etc.)
* Multiple conditions (AND, OR)


# CodeSchool - The Sequel to SQL

* Start with SELECT COUNT(\*) and COUNT(column_name) (latter is not null only)
* Then SUM, AVG, MAX, MIN (only work if column contains numbers)
* One at a time, then multiple aggregates (e.g. MAX(...), MIN(...))
* GROUP BY combined with aggregate functions - very powerful...
* HAVING as a way to filter groups (important!)
* Combine with WHERE [as well](https://www.dropbox.com/s/k1jg5fj55h4akae/Screenshot%202017-01-16%2016.48.04.png?dl=0)

INTERESTING TAKEAWAYS

* Refers to SELECT/UPDATE/... "recipe" instead of "statement" (I don't like this)
* They spend chapters 2-3 modifying tables - we won't cover at all in first course
* Don't get to aggregrate functions until second course - we should cover in first
* Don't get to other operators for WHERE clause (BETWEEN, LIKE, IN)

QUESTIONS

* Do we want to show people how to add data to tables?
* When is the appropriate time for us to introduce primary keys?
* When/if to discuss NULL (i.e. missing) data?
* Should explicitly focus on querying data, not changing it - do we even mention UPDATE/DELETE/etc?
* Do we want to cover subqueries in first course?

