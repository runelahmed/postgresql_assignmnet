
--What is PostgreSQL?

PostgreSQL is an open-source relational database management system used to store, manage and retrieve data for applications. Postgres follow the SQL standard, also postgreSQL has many advance features.

--What is the purpose of a database schema in PostgreSQL?

A database scheme is logical container that organize the database objects nicely. There are several purposes of database schema, the. Primary purpose Namespace isolation which means prevents naming conflicts, access control means schema allow granular permission, logical organization, as well as default schema which if there is not created schema by default postgreSQL create a public schema 


--Explain the Primary Key(PK) and Foreign Key(FK) concepts in PostgreSQL?

Foreign key(FK) and primary key(PK) are the fundamental relational database concepts that used to maintain data integrity and define the relationship between two tables or more tables. 

Primary key(PK) is a column or can be combined columns make a primary key(PK) that must be unique identifier for each row of the table and also it can not be null, a table must be have one primary key(PK), can not be more.

Foreign key(FK) is a column or set of columns to make a key which establishes a connection between two tables, also it reference the primary key(PK) of another table.

--Explain the purpose of the WHERE clause in a SELECT statement?

WHERE clause in a postgresql SELECT is used to filter row base on specific condition. It allows to retrieve only those row from table which meet the certain criteria. If you do not ise WHERE clause in SELECT statement, it will return all row from table, only you can narrow down the return by using WHERE clause give them specific condition. 

--What are the LIMIT and OFFSET clauses used for?
The LIMIT and OFFSET clauses in PostgreSQL used to control the number of row return by query and skip the specific number of row by using OFFSET respectively. Those tow clauses specifically used for pagination in working large databases. 
LIMIT clause used for showing specific number which one you will set, for example 

SELECT columns FROM table LIMIT number;

It will show from first column to until the column what you will mention 

OFFSET is skipping the specific number of row before returning. Example
SELECT * FROM students LIMIT 10 OFFSET 20;
Which means it will skip first 20 rows and return next 10 rows i mean (21-30)


