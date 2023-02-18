SELECT lastName FROM employees;
SELECT 1 + 1;    -- 2
-- current date 
SELECT NOW();
-- 2023-02-04 12:45:41
SELECT CONCAT('John',' ','Doe', ' Hi');
-- John Doe Hi
/*
mysql> SELECT 0 IS NULL, 0 IS NOT NULL, '' IS NULL, '' IS NOT NULL;
+-----------+---------------+------------+----------------+
| 0 IS NULL | 0 IS NOT NULL | '' IS NULL | '' IS NOT NULL |
+-----------+---------------+------------+----------------+
|         0 |             1 |          0 |              1 |
+-----------+---------------+------------+----------------+
*/
SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;
-- +---------+---------+---------+------------+
-- | 1 AND 0 | 0 AND 1 | 0 AND 0 | 0 AND NULL |
-- +---------+---------+---------+------------+
-- |       0 |       0 |       0 |          0 |
-- +---------+---------+---------+------------+


-- The logical AND operator returns NULL if either operand is non-zero or both operands are NULL.

SELECT 1 AND NULL, NULL AND NULL;

-- +------------+---------------+
-- | 1 AND NULL | NULL AND NULL |
-- +------------+---------------+
-- |       NULL |          NULL |
-- +------------+---------------+


-- When evaluating an expression that contains the AND operator, MySQL stops evaluating the remaining parts of the expression as soon as it can determine the result.

-- This is called short-circuit evaluation. In other words, the AND operator is short-circuited. For example:

SELECT 1 = 0 AND 1 / 0 ;

-- Try It Out

-- +-----------------+
-- | 1 = 0 AND 1 / 0 |
-- +-----------------+
-- |               0 |
-- +-----------------+


-- In this example, MySQL only evaluates the first part 1 = 0 of the expression 1 = 0 AND 1  / 0.

-- Since the expression 1 = 0 returns 0, MySQL can determine the result of the whole expression, which is 0.

-- Therefore, MySQL doesn’t need to evaluate the remaining part of the expression, which is 1/0; it would issue a division by zero error.

SELECT 1 OR 1, 1 OR 0, 0 OR 1;

-- +--------+--------+--------+
-- | 1 OR 1 | 1 OR 0 | 0 OR 1 |
-- +--------+--------+--------+
-- |      1 |      1 |      1 |
-- +--------+--------+--------+

SELECT 0 OR 0;

-- +--------+
-- | 0 OR 0 |
-- +--------+
-- |      0 |
-- +--------+

SELECT 1 OR NULL, 0 OR NULL, NULL or NULL;

-- +-----------+-----------+--------------+
-- | 1 OR NULL | 0 OR NULL | NULL or NULL |
-- +-----------+-----------+--------------+
-- |         1 |      NULL |         NULL |
-- +-----------+-----------+--------------+

-- Since the AND operator has higher precedence than the OR operator, 
-- MySQL evaluates the AND operator before the OR operator. For example:
SELECT 1 OR 0 AND 0;
-- +--------------+
-- | 1 OR 0 AND 0 |
-- +--------------+
-- |            1 |
-- +--------------+
SELECT (1 OR 0) AND 0;
-- +----------------+
-- | (1 OR 0) AND 0 |
-- +----------------+
-- |              0 |
-- +----------------+

-- Generally, the IN operator returns NULL in two cases:

-- The value on the left side of the operator is NULL.
-- The value doesn’t equal any value in the list and one of values in the list is NULL.
SELECT NULL IN (1,2,3);
-- +-----------------+
-- | NULL IN (1,2,3) |
-- +-----------------+
-- |            NULL |
-- +-----------------+
SELECT 0 IN (1 , 2, 3, NULL);
-- +-----------------------+
-- | 0 IN (1 , 2, 3, NULL) |
-- +-----------------------+
-- |                  NULL |
-- +-----------------------+
SELECT NULL IN (1 , 2, 3, NULL);
--NULL
-- The NOT IN operator returns NULL if the value on the left side of the IN operator is NULL.

SELECT NULL NOT IN (1,2,3);

-- +---------------------+
-- | NULL NOT IN (1,2,3) |
-- +---------------------+
-- |                NULL |
-- +---------------------+

select 5 between 4 and 5;
--1

SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);

-- 10100	2003-01-13	Shipped
-- 10101	2003-01-18	Shipped
-- 10102	2003-01-18	Shipped

--  Using MySQL LIMIT to get the nth highest or lowest value
-- To get the nth highest or lowest value, you use the following LIMIT clause:

SELECT select_list
FROM table_name
ORDER BY sort_expression
LIMIT n-1, 1;

-- The clause LIMIT n-1, 1 returns 1 row starting at the row n.

-- For example, the following finds the customer who has the second-highest credit:

SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 1,1;

-- If a DATE or DATETIME column has a NOT NULL constraint and contains
-- a special date '0000-00-00', you can use the IS NULL operator to find such rows.

-- First, create a table called projects:

CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);
-- Second, insert some rows into the projects table:

INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM','2020-01-01','0000-00-00'),
      ('ERP Future','2020-01-01','0000-00-00'),
      ('VR','2020-01-01','2030-01-01');
-- Third, use the IS NULL operator to select rows with the values in the complete_date column is '0000-00-00'.

SELECT * 
FROM projects
WHERE complete_date IS NULL;













