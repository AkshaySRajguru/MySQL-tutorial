select * from classicmodels.products limit 5;
select * from classicmodels.productlines limit 5;
-- Suppose you want to get:
-- The productCode and productName from the products table.
-- The textDescription of product lines from the productlines table.

select productCode, productName, textDescription from classicmodels.products as p
inner join 
classicmodels.productlines as pl
on p.productLine = pl.productLine;
-------
select * from products; -- productName
select * from orders WHERE orderNumber=10100; -- orderNumber,orderDate
select * from orderdetails WHERE orderNumber=10100; -- orderLineNumber, quantityOrdered, priceEach
select * from customers where customerNumber=363; --
-- p and od -> productCode
-- o and od -> orderNumber
-- c and o -> customerNumber
-- The following query uses a less-than ( <) join to find the sales price of the product whose
-- code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
select * from products as p
inner join orderdetails as od 
   ON p.productcode = od.productcode
      AND p.msrp > od.priceEach
WHERE
    p.productcode = 'S10_1678';
-- cardinality understanding
-- https://www.mysqltutorial.org/mysql-left-join.aspx
-- Each customer can have zero or more orders while each order must belong to one customer.
-- This query uses the LEFT JOIN clause to find all customers and their orders
select * from customers as c
left join orders as o using(customerNumber); -- 350 rows

select * from customers as c
inner join orders as o using(customerNumber); -- inner join gives 326 rows so 24 custs has not placed the order.

-- so to get custs whi has not placed the order 
select * from customers as c
left join orders as o using(customerNumber) where o.orderNumber is null; -- 24 roes

-- validate for 1 customer with no order :
select * from customers where customerNumber=125;
select * from orders where customerNumber=125; -- null