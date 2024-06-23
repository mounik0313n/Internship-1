#creating a data base;
CREATE DATABASE SAMPLE;
#FOR using data base 
USE SAMPLE;

#creating a table 
CREATE TABLE CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25) ,
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
); #here we use not null mean the column should not be empty while inserting a value
#not null is a constraint
#example now salary has no constraint to add constraint not null 
ALTER TABLE CUSTOMERS
MODIFY SALARY DECIMAL (18, 2) NOT NULL;# now it modified now salary has constraint

#using default constraint
ALTER TABLE CUSTOMERS
MODIFY SALARY DECIMAL (18, 2) DEFAULT 5000.00;

#for dropping default constraint 
ALTER TABLE CUSTOMERS
ALTER COLUMN SALARY DROP DEFAULT;

#create primary key id 
ALTER TABLE CUSTOMERS ADD PRIMARY KEY (ID);

#delete primary key id
ALTER TABLE CUSTOMERS DROP PRIMARY KEY ;

#usage of select keyword
SELECT * from customers;

#usage of distinct keyword
SELECT DISTINCT column1, column2 ... columnN
FROM table_name;

#usage of where clause
SELECT column1, column2 ... columnN
FROM table_name
WHERE CONDITION;

#usage of and or clause
SELECT column1, column2 ... columnN
FROM table_name
WHERE CONDITION-1 {AND|OR} CONDITION-2;

#usage of in clause
SELECT column1, column2 ... columnN
FROM table_name
WHERE column_name IN (val-1, val-2,. val-N);

#usage of between clause
SELECT column1, column2 ... columnN
FROM table_name
WHERE column_name BETWEEN val-1 AND val-2;

#usage of order by clause
SELECT column1, column2 ... columnN
FROM table_name
WHERE CONDITION
ORDER BY column_name {ASC|DESC};

#usage of group by clause
SELECT SUM(column_name)
FROM table_name
WHERE CONDITION
GROUP BY column_name;

#usage of count clause
SELECT COUNT(column_name)
FROM table_name
WHERE CONDITION;

#usage of having clause
SELECT SUM(column_name)
FROM table_name
WHERE CONDITION
GROUP BY column_name
HAVING (arithematic function condition);

#usage of drop 
drop table customers;

#usage of turncate 
truncate table customers;

#for describing table 
desc table customers;

#inserting values into table 
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (1, 'John Doe', 30, '123 Elm St', 55000.00);

#usage of update 
UPDATE CUSTOMERS
SET ADDRESS = '456 Oak St', SALARY = 58000.00
WHERE ID = 1;

#usage of delete 
DELETE FROM table_name
WHERE {CONDITION};

#usage of arthimetic operators
select 10+ 20;
select 10*20;
select 10-5;
select 10/5;

#usage of comparison operators
SELECT * FROM CUSTOMERS WHERE SALARY > 5000;
SELECT * FROM CUSTOMERS WHERE SALARY = 2000;
SELECT * FROM CUSTOMERS WHERE SALARY != 2000;
SELECT * FROM CUSTOMERS WHERE SALARY >= 6500;

#usage of logical operators
SELECT * FROM CUSTOMERS WHERE AGE >= 25 AND SALARY >= 6500;
SELECT * FROM CUSTOMERS WHERE AGE >= 25 OR SALARY >= 6500;
SELECT * FROM CUSTOMERS WHERE AGE IS NOT NULL;
SELECT * FROM CUSTOMERS WHERE AGE IN ( 25, 27 );
SELECT * FROM CUSTOMERS WHERE AGE BETWEEN 25 AND 27;
SELECT AGE FROM CUSTOMERS
WHERE EXISTS (SELECT AGE FROM CUSTOMERS WHERE SALARY > 6500);
SELECT * FROM CUSTOMERS
WHERE AGE > ALL (SELECT AGE FROM CUSTOMERS WHERE SALARY > 6500);
SELECT * FROM CUSTOMERS
WHERE AGE > ANY (SELECT AGE FROM CUSTOMERS WHERE SALARY > 6500);

#usage of date and time stamp
SELECT CURRENT_TIMESTAMP;

#selecting particular id
SELECT ID, NAME, SALARY
FROM CUSTOMERS
WHERE NAME = 'Hardik';

#usage of like   here it shows which start with 200
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '200%';

#usage of like here it shows which contain 200 in the values
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '%200%';

#showing top 3 
SELECT * FROM CUSTOMER LIMIT 3;

#usage of order by
 SELECT * FROM CUSTOMERS
ORDER BY NAME, SALARY;

#order by in descending order
 SELECT * FROM CUSTOMERS
ORDER BY NAME DESC;

#usage of group by
 SELECT NAME, SUM(SALARY) FROM CUSTOMERS
GROUP BY NAME;

#usage od distinct
SELECT DISTINCT SALARY FROM CUSTOMERS
ORDER BY SALARY;

#syntax of inner join 
SELECT table1.column1, table2.column2...
FROM table1
INNER JOIN table2
ON table1.common_filed = table2.common_field;

#syntax of left join 
SELECT table1.column1, table2.column2...
FROM table1
LEFT JOIN table2
ON table1.common_filed = table2.common_field;

#syntax of right join 
SELECT table1.column1, table2.column2...
FROM table1
RIGHT JOIN table2
ON table1.common_filed = table2.common_field;

#usage of full join
SELECT table1.column1, table2.column2...
FROM table1
FULL JOIN table2
ON table1.common_filed = table2.common_field;

#usage self join 
SELECT a.column_name, b.column_name...
FROM table1 a, table1 b
WHERE a.common_filed = b.common_field;

#usage of union syntax
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]
UNION
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition];

#usage of union all syntax
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]
UNION ALL
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]

#usage of except 
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]
EXCEPT
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]

#usage of is not null
 SELECT ID, NAME, AGE, ADDRESS, SALARY
FROM CUSTOMERS
WHERE SALARY IS NOT NULL;

#usage of is null 
 SELECT ID, NAME, AGE, ADDRESS, SALARY
FROM CUSTOMERS
WHERE SALARY IS NULL;
