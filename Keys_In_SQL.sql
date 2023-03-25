/*
In SQL, a primary key is a column or set of columns that uniquely identify each row in a table. 
The primary key is used to enforce data integrity rules and ensure that there are no duplicate rows in the table. 
A primary key can be defined when creating a table or added later using an ALTER TABLE statement.

A foreign key is a column or set of columns in one table that refers to the primary key of another table. 
The purpose of a foreign key is to enforce referential integrity between tables, 
which means that a record in one table can only reference a record in another table if that record exists. 
This helps to maintain data consistency and prevent orphaned records.

When a table is created, a foreign key can be defined by adding a CONSTRAINT clause to 
the CREATE TABLE statement. The CONSTRAINT clause specifies the name of the foreign key, 
the name of the referenced table, and the column or columns in the referenced table that 
the foreign key refers to. Alternatively, a foreign key can be added to an existing table 
using an ALTER TABLE statement.

https://www.gleek.io/blog/er-model-cardinality
https://www.gleek.io/blog/uml-vs-erd
https://www.gleek.io/blog/crows-foot-notation

A database is the overall collection of data, 
a schema is a logical container for database objects within a database, 
and a table is an object within a schema that contains the actual data.
e.g.
library.catelog.books,
APP_SOCS.PARM_SOCS.JOB_METADATA,
Company.HR.Empleoyee,
Company.Sales.SalesTarget
*/

-- create projects and members mapping to understand PRIMARY and FOREIGN keys
create database the_office;

create table the_office.projects(
    id int auto_increment,
    title varchar(200) NOT NULL,
    primary key(id)
);

-- ms server
-- CREATE TABLE pm.projects(
--     id INT PRIMARY KEY IDENTITY,
--     title VARCHAR(255) NOT NULL
-- );

insert into the_office.projects(id, title) values (1, 'CVS health');
insert into the_office.projects(title) values ('UAT');
select * from the_office.projects;
create table the_office.members(
    id int auto_increment,
    name varchar(30) NOT NULL,
    project_id int,
    primary key (id),
    foreign key (project_id)
        references the_office.projects(id)
);
insert into the_office.members(name, project_id) values ('ron', 3);
select * from the_office.members;
select m.id, m.name, p.title from the_office.members as m
inner join 
the_office.projects as p
on m.project_id = p.id;
-- 1	jan	CVS health
-- 2	ron	UAT

-- ms server
-- CREATE TABLE the_office.members (
--     id INT IDENTITY(1,1) PRIMARY KEY,
--     name VARCHAR(30) NOT NULL,
--     project_id INT,
--     FOREIGN KEY (project_id)
--         REFERENCES the_office.projects(id)
-- );

/*
Note that in MS SQL Server, the IDENTITY keyword is used 
instead of auto_increment to specify that a column is an identity column. 
The IDENTITY function takes two arguments: 
the starting value and the increment value. 
In this case, the starting value is 1 and the increment 
value is also 1, so we can write IDENTITY(1,1).

Also note that in MS SQL Server, 
it's common practice to explicitly name the primary key constraint, 
which we've done in this code by including the PRIMARY KEY keyword 
after the id column definition. However, this is not strictly necessary 
and you could also use the shorthand 
CONSTRAINT PK_members PRIMARY KEY (id) 
after the closing parenthesis of the CREATE TABLE statement.
*/

-- CREATE TABLE user_roles(
--    user_id INT,
--    role_id INT,
--    PRIMARY KEY(user_id,role_id),
--    FOREIGN KEY(user_id) 
--        REFERENCES the_office.users(user_id),
--    FOREIGN KEY(role_id) 
--        REFERENCES the_office.roles(role_id)
-- );

