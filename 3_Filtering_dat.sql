select * from employees where employeeNumber between 1000 and 1100;
/*
1002	Murphy	Diane	x5800	dmurphy@classicmodelcars.com	1		President
1056	Patterson	Mary	x4611	mpatterso@classicmodelcars.com	1	1002	VP Sales
1076	Firrelli	Jeff	x9273	jfirrelli@classicmodelcars.com	1	1002	VP Marketing
1088	Patterson	William	x4871	wpatterson@classicmodelcars.com	6	1056	Sales Manager (APAC)
							
*/
select firstName from employees where firstName like '%y';
/*
Andy
Anthony
Barry
Larry
Mary
*/
select firstName from employees where firstName like '___y'; --3 userscores
/*
Mary
Andy
*/

/*
If you don’t specify the escape character explicitly, the backslash character (\) is the default escape character.

For example, if you want to find products whose product codes contain the string _20 , you can use the pattern %\_20% with the default escape character:
*/
SELECT productCode FROM products WHERE productCode LIKE '%\_20%';
/*
S10_2016
S24_2000
S24_2011
S700_2047
S24_2022
*/
-- Alternatively, you can specify a different escape character e.g., $ using the ESCAPE clause:
SELECT productCode FROM products WHERE productCode LIKE '%$_20%' ESCAPE '$'; 

select distinct status from orders;
/*
Shipped
Resolved
Cancelled
On Hold
Disputed
In Process
*/

select status, count(*) from orders group by status;
/*
Shipped	    303
Resolved	4
Cancelled	6
On Hold	    4
Disputed	3
In Process	6
*/
select sum(t.counts) from  (select status, count(*) as counts from orders group by status) as t;
--326 i.e. total rows in orders table

select customerName, state, country from customers where state='ca' and country='usa' limit 5;
-- Mini Gifts Distributors Ltd.	CA	USA
-- Mini Wheels Co.	            CA	USA
-- Technics Stores Inc.	        CA	USA
-- Toys4GrownUps.com	        CA	USA
-- Boards & Toys Co.	        CA	USA