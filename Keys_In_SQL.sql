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

