/* Dropping the existing countries table if it exists */
DROP TABLE IF EXISTS countries;

/* Creating the countries table with the desired structure */
CREATE TABLE countries(
    COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
    COUNTRY_NAME varchar(40) NOT NULL,
    REGION_ID decimal(10,0) NOT NULL
);

/* Describing the countries table structure */
DESC countries;
/* Dropping the existing jobs table if it exists */
DROP TABLE IF EXISTS jobs;

/* Creating the jobs table */
CREATE TABLE jobs(
    JOB_ID varchar(10) NOT NULL UNIQUE,
    JOB_TITLE varchar(35) NOT NULL DEFAULT ' ',
    MIN_SALARY decimal(6,0) DEFAULT 8000,
    MAX_SALARY decimal(6,0) DEFAULT NULL
);

/* Describing the jobs table structure */
DESC jobs;
/* Dropping the existing job_history table if it exists */
DROP TABLE IF EXISTS job_history;

/* Creating the job_history table */
CREATE TABLE job_history(
    EMPLOYEE_ID decimal(6,0) NOT NULL,
    START_DATE date NOT NULL,
    END_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    DEPARTMENT_ID decimal(4,0) NOT NULL,
    CHECK (END_DATE LIKE '--/--/----')  /* Note: MySQL does not support CHECK constraints in this manner */
);

/* Describing the job_history table structure */
DESC job_history;

/* INSERT */
INSERT INTO employees (id, name, age) VALUES (1, 'John Doe', 30);

/* DELETE */
DELETE FROM employees WHERE id = 1;

/* CALL (Procedure) */
CALL calculate_total_salary();

/* UPDATE */
UPDATE employees SET age = 31 WHERE id = 1;

/* SELECT */
SELECT * FROM employees WHERE age > 25;

/* RENAME */
RENAME TABLE employees TO staff;

/* TRUNCATE */
TRUNCATE TABLE employees;

/* ALTER */
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
