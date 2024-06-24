-- Create database
CREATE DATABASE company;

-- Use the created database
USE company;

-- Create employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Create departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create employee_department table (many-to-many relationship)
CREATE TABLE employee_department (
    employee_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, department_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into employees table
INSERT INTO employees (name, position, salary) VALUES
('John Doe', 'Manager', 6000.00),
('Jane Smith', 'Developer', 5000.00),
('Alice Johnson', 'Designer', 4000.00),
('Bob Brown', 'Developer', 4500.00);

-- Insert sample data into departments table
INSERT INTO departments (name) VALUES
('IT'),
('HR'),
('Marketing');

-- Insert sample data into employee_department table
INSERT INTO employee_department (employee_id, department_id) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 1);

-- Create procedures and functions

-- PROCEDURE to select all employees
DELIMITER $$
CREATE PROCEDURE select_all_employees()
BEGIN
    SELECT * FROM employees;
END$$
DELIMITER ;

-- FUNCTION to calculate total salary expense
DELIMITER $$
CREATE FUNCTION get_total_salary_expense()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_expense DECIMAL(10,2);
    SELECT SUM(salary) INTO total_expense FROM employees;
    RETURN total_expense;
END$$
DELIMITER ;

-- PROCEDURE to get employee details by employee ID (IN parameter)
DELIMITER $$
CREATE PROCEDURE get_employee_details(IN emp_id INT)
BEGIN
    SELECT * FROM employees WHERE employee_id = emp_id;
END$$
DELIMITER ;

-- PROCEDURE to get employee count (OUT parameter)
DELIMITER $$
CREATE PROCEDURE get_employee_count(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM employees;
END$$
DELIMITER ;

-- PROCEDURE to calculate total salary of developers using predefined SUM()
DELIMITER $$
CREATE PROCEDURE calc_total_developer_salary(OUT total_salary DECIMAL(10,2))
BEGIN
    SELECT SUM(salary) INTO total_salary
    FROM employees
    WHERE position = 'Developer';
END$$
DELIMITER ;

-- PROCEDURE to declare and use a cursor to iterate through employees and print names
DELIMITER //
CREATE PROCEDURE print_employee_names()
BEGIN
    DECLARE emp_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE employee_cursor CURSOR FOR SELECT name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN employee_cursor;

    get_names: LOOP
        FETCH employee_cursor INTO emp_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT emp_name;
    END LOOP get_names;

    CLOSE employee_cursor;
END//
DELIMITER ;

-- Additional explanatory comments

/*
1. **IN Parameter**:
   - Used in stored procedures to pass values into the procedure. These values are read-only and cannot be modified within the procedure.

2. **OUT Parameter**:
   - Used in stored procedures to return values from the procedure. These values can be accessed by the calling program after the procedure execution.

3. **Cursors**:
   - Used to retrieve and process rows one by one from the result set of a query.
   - Declared using the `DECLARE CURSOR` statement, opened with the `OPEN` statement, fetched using the `FETCH` statement, and closed with the `CLOSE` statement.
   - Example provided to declare a cursor, iterate through the `employees` table, and print employee names.

4. **DELIMITER Command**:
   - Used to change the standard delimiter (semicolon) to a different character, which is useful when defining stored procedures or functions that contain semicolons within their body.
   - After defining the stored procedure or function, the delimiter is reset back to the standard semicolon.
*/
