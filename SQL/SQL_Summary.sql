-----------------------------SQL Summary by Puchong Saribut------------------------------

--Relational Database
----Relational databases define relationships between tables of data inside the database
----Database > Table > Data

--Table
----Table rows and columns = records and fields
----Good table names : lowercase, no spaces, be plural
----Good field names : lowercase, no spaces, be singular, be different from other field names, be different from table names
--Data
----Types : strings VARCAR, integers INT, floats NUMERIC

--Queries
SELECT field_name AS new_fields_name, ...
FROM table_name
WHERE condition
GROUP BY field_name
HAVING condition for grouping
ORDER BY
LIMIT N;

--SELECT
---Single field
SELECT name
FROM customers;
--Multiple fields
SELECT name, age
FROM customers;
--All fields
SELECT *
FROM customers;

----------intermediate SQL using PostgreSQL
COUNT(field_name) -- count the number of records with value in a field, use an alias for clarity
COUNT(*) -- count records in a table
DISTINCT field_name -- return only unique values in a field, COUNT(DISTINCT field_name) to count unique values
---Example
SELECT DISTINCT(COUNT(field_name)) AS count_fieldname, COUNT(*) AS total_records
FROM table_name;

--Order of execution
FROM table_name
WHERE condition
GROUP BY
HAVING
SELECT field_name AS new_fields_name
ORDER BY field_name
LIMIT N;

--WHERE condition
---Comparision operators
----: > Greater than or after
----: < Less than or before
----: = Equal to
----: >= Greater than or equal to
----: <= Less than or equal to
----: <> Not equal to

---For multiple conditions, use 
OR, AND, BETWEEN ... AND ....

---For text, use 
LIKE, NOT LIKE, IN

---Null values
IS NULL, IS NOT NULL

--Summarizing data (Aggregate)
AVG() -- num only
SUM() -- num only
MIN() -- various
MAX() -- various
COUNT() -- various
---Note : Use aliasing when summarizing
ROUND(number_to_round, decimal_places) -- round a number to a specified decimal, place can be negative.

--Sorting
ORDER BY field_name1 ASC, field_name2 DESC -- sort field1 from min to max, sort field2 max to min

--Grouping
GROUP BY field_name1, field_name2 -- grouping by field1, and then field2

--Filtering grouped data
HAVING condition --choose groups by condition, because of order of execution

--Example
SELECT
    field_name1,
    field_name2 AS new_fields_name
FROM table_name
WHERE field_name1 IN (...)
GROUP BY field_name1
HAVING COUNT(field_name3) > integers
ORDER BY new_fields_name --can use new name because this line is executed after aliasing
LIMIT N:

---------Joining---------
SELECT t1.field_name
FROM table_1 AS t1
INNER JOIN table_2 AS t2
ON table_1.field_name = table_2.field_name;

-- If two field names is same, USING is optional
SELECT t1.field_name
FROM table_1 AS t1
INNER JOIN table_2 AS t2
USING (field_name);

-- There are many ways to do
-- - Multiple joins
-- - Joining on multiple keys (fields)

INNER JOIN -- same data in two tables
LEFT JOIN -- refer to left table
RIGHT JOIN -- refer to right table
FULL JOIN -- Get everything
CROSS JOIN -- create all possible combinations of two tables
-- SELF JOIN -- Join with themselves, use to compare parts of the same table 

-- Set theory, we can query sets of data and do set operations
UNION -- remove duplicates
UNION ALL
INTERSECT -- remove duplicates
EXCEPT

-- Subqueries
-- - SEMI JOIN & ANTI JOIN
SELECT *
FROM table1
WHERE field IN -- (IN|NOT IN)
    (SELECT field
    FROM table2
    WHERE condition);

-- - Subqueries inside WHERE
SELECT *
FROM some_table
WHERE some_field IN
    (include subquery here);

-- - Subqueries inside SELECT
SELECT DISTINCT field
    (SELECT COUNT(*)
    FROM table2
    WHERE table1.field = table2.field) AS table2_count
FROM table1;

-- -Subqueries inside FROM
SELECT left_table.id, left_val
FROM left_table, right_table
WHERE left_table.id = right_table.id;

-------------------------------------------------------