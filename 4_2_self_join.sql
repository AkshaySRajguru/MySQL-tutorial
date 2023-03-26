-- self inner join

SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager, m.jobTitle as manager_role,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report',  e.jobTitle as emp_role
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;

SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
    
select * from customers;
select c1.city, c1.customerName, c2.customerName from customers as c1
inner join customers as c2
on c1.city=c2.city and c1.customerName <> c2.customerName order by c1.city;

SELECT 
    c1.city, c1.customerName, c2.customerName
FROM
    customers c1
        INNER JOIN
    customers c2 ON c1.city = c2.city
        AND c1.customername <> c2.customerName
ORDER BY c1.city;