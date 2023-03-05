-- https://www.mysqltutorial.org/mysql-primary-key/
-- https://www.mysqltutorial.org/mysql-foreign-key/

/*
SELECT * FROM members;
+-----------+--------+
| member_id | name   |
+-----------+--------+
|         1 | John   |
|         2 | Jane   |
|         3 | Mary   |
|         4 | David  |
|         5 | Amelia |
+-----------+--------+

SELECT * FROM committees;
+--------------+--------+
| committee_id | name   |
+--------------+--------+
|            1 | John   |
|            2 | Mary   |
|            3 | Amelia |
|            4 | Joe    |
+--------------+--------+
*/

-- 1. inner join 
-- inner join clause includes only matching rows from both tables.
select m.member_id, m.name as member, c.committee_id, c.name as committee 
from
joins_db.members as m
inner join
joins_db.committees as c
on 
c.name = m.name ;
/*
   member_id  member  committee_id committee
0          1    John             1      John
1          3    Mary             2      Mary
2          5  Amelia             3    Amelia
*/

-- 2. left join
-- A LEFT JOIN in MySQL is a type of join operation that returns 
-- all the rows from the left table and matching rows from the right table. 
-- If there are no matching rows in the right table, 
-- NULL values are returned in their place.

select m.* , c.* 
from joins_db.members as m
left join
joins_db.committees as c
using(name);

--  using pandas:
--    member_id    name  committee_id    name
-- 0          1    John           1.0    John
-- 1          2    Jane           NaN    None
-- 2          3    Mary           2.0    Mary
-- 3          4   David           NaN    None
-- 4          5  Amelia           3.0  Amelia