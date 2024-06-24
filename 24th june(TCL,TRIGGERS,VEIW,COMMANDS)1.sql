-- Create database
CREATE DATABASE company;

USE company;

-- Employees - emp_id, emp_name, position, salary, location (Mumbai or Delhi)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

-- Payments - pay_id, emp_id, amount, mode (upi, credit, debit), status
CREATE TABLE payments (
    pay_id INT PRIMARY KEY,
    emp_id INT,
    amount INT NOT NULL,
    mode VARCHAR(30) CHECK(mode IN ('upi', 'credit', 'debit')),
    status VARCHAR(30),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Inserting sample data into employees table
INSERT INTO employees (emp_id, emp_name, position, salary, location) VALUES
(1, 'John Doe', 'Manager', 80000, 'Mumbai'),
(2, 'Jane Smith', 'Developer', 60000, 'Delhi'),
(3, 'Alice Johnson', 'Analyst', 50000, 'Mumbai');

-- Inserting sample data into payments table
INSERT INTO payments (pay_id, emp_id, amount, mode, status) VALUES
(1, 1, 80000, 'credit', 'completed'),
(2, 2, 60000, 'debit', 'pending'),
(3, 3, 50000, 'upi', 'completed');

#tcl 
-- Start a transaction
START TRANSACTION;

-- Inserting a new employee and payment
INSERT INTO employees (emp_id, emp_name, position, salary, location) VALUES (4, 'Bob Brown', 'Designer', 55000, 'Delhi');
INSERT INTO payments (pay_id, emp_id, amount, mode, status) VALUES (4, 4, 55000, 'upi', 'completed');

-- Savepoint
SAVEPOINT before_commit;

-- Commit the transaction
COMMIT;

-- Rolling back to the savepoint
ROLLBACK TO before_commit;
