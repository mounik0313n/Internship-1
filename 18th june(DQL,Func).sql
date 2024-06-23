-- Create database
CREATE DATABASE IF NOT EXISTS company;

-- Use the database
USE company;

-- Create tables

-- Employee table
CREATE TABLE IF NOT EXISTS employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(255),
    age INT,
    department VARCHAR(255),
    salary DECIMAL(10, 2),
    joining_date DATE
);

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    pid INT PRIMARY KEY,
    pname VARCHAR(255),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2)
);

-- Works_on table (Many-to-Many relationship between employee and projects)
CREATE TABLE IF NOT EXISTS works_on (
    eid INT,
    pid INT,
    hours_worked INT,
    PRIMARY KEY (eid, pid),
    FOREIGN KEY (eid) REFERENCES employee(eid),
    FOREIGN KEY (pid) REFERENCES projects(pid)
);

-- Insert data into employee table
INSERT INTO employee (eid, ename, age, department, salary, joining_date) VALUES
(1, 'Alice', 30, 'HR', 50000.00, '2010-05-15'),
(2, 'Bob', 25, 'IT', 60000.00, '2015-08-20'),
(3, 'Charlie', 35, 'Finance', 70000.00, '2008-10-10'),
(4, 'David', 28, 'Marketing', 55000.00, '2012-12-01');

-- Insert data into projects table
INSERT INTO projects (pid, pname, start_date, end_date, budget) VALUES
(1, 'Website Development', '2023-01-01', '2023-06-30', 100000.00),
(2, 'Mobile App Launch', '2023-03-15', '2023-09-30', 80000.00),
(3, 'ERP Implementation', '2023-02-01', '2023-12-31', 120000.00);

-- Insert data into works_on table
INSERT INTO works_on (eid, pid, hours_worked) VALUES
(1, 1, 120),
(2, 1, 150),
(3, 2, 100),
(4, 3, 180),
(1, 3, 80),
(2, 2, 130);

-- GROUP BY Examples

-- Total budget allocated to each project
SELECT pname, SUM(budget) AS total_budget
FROM projects
GROUP BY pname;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department;

-- Total hours worked per employee
SELECT ename, SUM(hours_worked) AS total_hours_worked
FROM works_on w
JOIN employee e ON w.eid = e.eid
GROUP BY ename;

-- ORDER BY Examples

-- List employees by salary in descending order
SELECT ename, salary
FROM employee
ORDER BY salary DESC;

-- List projects by start date in ascending order
SELECT pname, start_date
FROM projects
ORDER BY start_date ASC;

-- HAVING Examples

-- Departments with average salary greater than 60000
SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 60000;

-- Projects with total hours worked more than 200
SELECT pname, SUM(hours_worked) AS total_hours_worked
FROM works_on w
JOIN projects p ON w.pid = p.pid
GROUP BY pname
HAVING SUM(hours_worked) > 200;

-- DQL (Data Query Language) COMMANDS

-- A) SELECT With DISTINCT Clause

-- List distinct departments
SELECT DISTINCT department 
FROM employee;

-- B) SELECT all columns(*)

-- Select all data from employee table
SELECT * FROM employee;

-- C) SELECT by column name

-- Select employee names
SELECT ename FROM employee;

-- D) SELECT with LIKE(%)

-- Employees whose name starts with 'A'
SELECT * FROM employee WHERE ename LIKE 'A%';

-- E) SELECT with CASE or IF

-- Employee remarks based on salary
SELECT eid,
       ename,
       CASE WHEN salary > 60000 THEN 'High Salary' ELSE 'Regular Salary' END AS 'Remark'
FROM employee;

-- F) SELECT with a LIMIT Clause

-- Top 2 highest salary employees
SELECT * 
FROM employee
ORDER BY salary DESC
LIMIT 2;

-- G) SELECT with WHERE

-- Select employees from IT department
SELECT * FROM employee WHERE department = 'IT';

-- Date and Time Functions Examples

-- 1) Get current date
SELECT CURRENT_DATE() AS today;

-- 2) Calculate day difference
SELECT DATEDIFF('2023-05-10', '2023-05-01') AS day_difference;

-- 3) Extract date from datetime
SELECT DATE('2023-05-01 12:34:56') AS result;

-- 4) Get current time
SELECT CURRENT_TIME() AS now;

-- 5) Get last day of a month
SELECT LAST_DAY('2023-05-01') AS last_day_of_may;

-- 6) Get current timestamp
SELECT SYSDATE() AS `Timestamp`;

-- 7) Add days to a date
SELECT ADDDATE('2023-05-01', INTERVAL 7 DAY) AS one_week_later;

-- Numeric Functions Examples

-- 1) Calculate average salary
SELECT AVG(salary) AS avg_salary
FROM employee;

-- 2) Count total number of employees
SELECT COUNT(*) AS total_employees
FROM employee;

-- 3) Calculate power
SELECT POW(2, 3) AS result;

-- 4) Find minimum salary
SELECT MIN(salary) AS min_salary
FROM employee;

-- 5) Find maximum budget per project location
SELECT MAX(budget) AS max_budget, location
FROM projects
GROUP BY location;

-- 6) Round a number
SELECT ROUND(3.1416, 2) AS rounded_number;

-- 7) Calculate square root
SELECT SQRT(25) AS result;

-- 8) Get floor value
SELECT FLOOR(3.8) AS floor_value;

-- 9) Get ceiling value
SELECT CEILING(3.8) AS ceiling_value;

-- 10) Calculate total budget
SELECT SUM(budget) AS total_budget
FROM projects;
