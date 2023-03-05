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

-- So members who are not in committee can be found by adding below line:
WHERE c.committee_id IS NULL;  --> this is LEFT OUTER
-- +-----------+--------+--------------+-----------+
-- | member_id | member | committee_id | committee |
-- +-----------+--------+--------------+-----------+
-- |         2 | Jane   |         NULL | NULL      |
-- |         4 | David  |         NULL | NULL      |
-- +-----------+--------+--------------+-----------+


-- 3. right join
select m.* , c.* 
from joins_db.members as m
right join
joins_db.committees as c
using(name);
-- +-----------+--------+--------------+-----------+
-- | member_id | member | committee_id | committee |
-- +-----------+--------+--------------+-----------+
-- |         1 | John   |            1 | John      |
-- |         3 | Mary   |            2 | Mary      |
-- |         5 | Amelia |            3 | Amelia    |
-- |      NULL | NULL   |            4 | Joe       |
-- +-----------+--------+--------------+-----------+

--RIGHT OUTER
where m.member_id IS NULL;
-- +-----------+--------+--------------+-----------+
-- | member_id | member | committee_id | committee |
-- +-----------+--------+--------------+-----------+
-- |      NULL | NULL   |            4 | Joe       |
-- +-----------+--------+--------------+-----------+


-- 4. cross join
-- It does not have a join condition.
-- Suppose the first table has n(5) rows and the second table has m(4) rows. 
-- The cross join that joins the tables will return nxm(5*4=20) rows.
select m.*, c.* from 
joins_db.members as m
cross join
joins_db.committees as c;
-- +-----------+--------+--------------+-----------+
-- | member_id | member | committee_id | committee |
-- +-----------+--------+--------------+-----------+
-- |         1 | John   |            4 | Joe       |
-- |         1 | John   |            3 | Amelia    |
-- |         1 | John   |            2 | Mary      |
-- |         1 | John   |            1 | John      |
-- |         2 | Jane   |            4 | Joe       |
-- |         2 | Jane   |            3 | Amelia    |
-- |         2 | Jane   |            2 | Mary      |
-- |         2 | Jane   |            1 | John      |
-- |         3 | Mary   |            4 | Joe       |
-- |         3 | Mary   |            3 | Amelia    |
-- |         3 | Mary   |            2 | Mary      |
-- |         3 | Mary   |            1 | John      |
-- |         4 | David  |            4 | Joe       |
-- |         4 | David  |            3 | Amelia    |
-- |         4 | David  |            2 | Mary      |
-- |         4 | David  |            1 | John      |
-- |         5 | Amelia |            4 | Joe       |
-- |         5 | Amelia |            3 | Amelia    |
-- |         5 | Amelia |            2 | Mary      |
-- |         5 | Amelia |            1 | John      |
-- +-----------+--------+--------------+-----------+
-- 20 rows in set (0.00 sec)


-- # Note that MySQL hasn’t supported the FULL OUTER JOIN yet.
