-- Create database
CREATE DATABASE company_db;
USE company_db;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

-- Insert data into customers table
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(5001, 'Alice Johnson', 'Boston', 100, 7001),
(5002, 'Bob Martin', 'Chicago', 200, 7002),
(5003, 'Charlie Brown', 'San Francisco', 300, 7003),
(5004, 'David Lee', 'New York', NULL, 7004);

-- Create orders table
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

-- Insert data into orders table
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(9001, 800.00, '2023-01-15', 5001, 7001),
(9002, 1500.00, '2023-02-20', 5002, 7002),
(9003, 450.00, '2023-03-25', 5003, 7003),
(9004, 2200.00, '2023-04-30', 5004, 7004);

-- Create salesman table
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

-- Insert data into salesman table
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(7001, 'James Smith', 'Boston', 0.15),
(7002, 'Michael Johnson', 'Chicago', 0.13),
(7003, 'Robert Brown', 'San Francisco', 0.14),
(7004, 'William Lee', 'New York', 0.12);

-- SQL query to find those orders where the order amount exists between 500 and 2000
SELECT a.ord_no, a.purch_amt, b.cust_name, b.city 
FROM orders a 
JOIN customers b ON a.customer_id = b.customer_id 
WHERE a.purch_amt BETWEEN 500 AND 2000;

-- SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT s.name AS "Salesman", c.cust_name, c.city 
FROM salesman s 
JOIN customers c ON s.city = c.city;

-- SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT c.cust_name AS "Customer Name", c.city, s.name AS "Salesman", s.commission 
FROM customers c 
JOIN salesman s ON c.salesman_id = s.salesman_id;

-- SQL query to find salespeople who received commissions of more than 12 percent from the company
SELECT s.name AS "Salesman", s.city, s.commission 
FROM salesman s 
WHERE s.commission > 0.12;

-- SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.
SELECT c.cust_name AS "Customer Name", c.city AS "Customer City", s.name AS "Salesman", s.city AS "Salesman City", s.commission 
FROM customers c 
JOIN salesman s ON c.salesman_id = s.salesman_id 
WHERE s.commission > 0.12 AND c.city <> s.city;

-- SQL query to find the details of an order.
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name AS "Customer Name", c.grade, s.name AS "Salesman", s.commission 
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id 
JOIN salesman s ON o.salesman_id = s.salesman_id;

-- SQL statement to join the tables salesman, customers and orders so that the same column of each table appears once and only the relational rows are returned.
SELECT * 
FROM orders o 
NATURAL JOIN customers c 
NATURAL JOIN salesman s;

-- SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT c.cust_name, c.city, c.grade, s.name AS "Salesman", s.city 
FROM customers c 
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id 
ORDER BY c.customer_id;

-- SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending customer_id.
SELECT c.cust_name, c.city, c.grade, s.name AS "Salesman", s.city 
FROM customers c 
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id 
WHERE c.grade < 300 
ORDER BY c.customer_id;

-- SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt AS "Order Amount" 
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY o.ord_date;

-- SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt AS "Order Amount", s.name AS "Salesman", s.commission 
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id 
ORDER BY o.ord_date;
