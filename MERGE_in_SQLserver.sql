--AIM: merge values from source to target table.
--create database testmergedb;

--truncate table SourceProducts;
--truncate table TargetProducts;

--create table TargetProducts(
--productid int,
--productname varchar(20),
--price decimal(9,2)
--);

--insert into TargetProducts values (1, 'Table', 100);
--insert into TargetProducts values (2, 'Chair', 180);
--insert into TargetProducts values (3, 'bed', 1000);
--insert into TargetProducts values (4, 'keyborad', 60);
--select * from TargetProducts;

--create table SourceProducts(
--productid int,
--productname varchar(20),
--price decimal(9,2)
--);

--insert into SourceProducts values (1, 'Table', 100);
--insert into SourceProducts values (2, 'Chair', 80);
--insert into SourceProducts values (5, 'laptop', 880);
--insert into SourceProducts values (6, 'charger', 10);
--select * from SourceProducts;


--expected target table after merge (upsert)
--(1, 'Table', 100);
--(2, 'Chair', 80);
--(3, 'bed', 1000);
--(4, 'keyborad', 60);
--(5, 'laptop', 880);
--(6, 'charger', 10);

--SYNTAX
--MERGE target_table AS target
--USING source_table AS source
--ON condition
--WHEN MATCHED THEN
--    UPDATE SET column1 = source.column1, column2 = source.column2, ...
--WHEN NOT MATCHED THEN
--    INSERT (column1, column2, ...)
--    VALUES (source.column1, source.column2, ...);

-- <-- MERGE WITH UPSERT -->

--merge TargetProducts as T
--using SourceProducts as S
--on S.productid = T.productid 

--when matched then update set
-- productid = S.productid,
-- productname = S.productname,
-- price = S.price 

--when not matched then
--insert (productid, productname, price)
--values (S.productid, S.productname, S.price)

--OUTPUT inserted.*, deleted.*;

--returned :
--5	laptop	880.00	NULL	NULL	NULL
--6	charger	10.00	NULL	NULL	NULL
--1	Table	100.00	1	Table	100.00
--2	Chair	80.00	2	Chair	180.00

--select * from TargetProducts;
--1	Table	100.00
--2	Chair	80.00
--3	bed	1000.00
--4	keyborad	60.00
--5	laptop	880.00
--6	charger	10.00

-- <-- MERGE WITH UPSERT & DELETE -->

--An action of type 'DELETE' is not allowed in 
--the 'WHEN NOT MATCHED' clause of a MERGE statement.

delete from TargetProducts where productid in (3,4);
select * from TargetProducts;

--1	Table	100.00
--2	Chair	80.00
--5	laptop	880.00
--6	charger	10.00
