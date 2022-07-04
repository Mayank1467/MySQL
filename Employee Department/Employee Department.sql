SHOW DATABASES;
USE mysql_practice;
SHOW TABLES;

SELECT * FROM employees;
SELECT * FROM departments;

-- Select employees' first name, last name, job_id and salary whose first name starts with alphabet S
SELECT first_name, last_name, job_id, salary 
FROM employees 
WHERE first_name RLIKE '^S';

-- Write a query to select employee with the highest salary
SELECT first_name, last_name, job_id, salary
FROM employees
ORDER BY salary DESC LIMIT 1;

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Select employee with the second highest salary
SELECT first_name, last_name, job_id, salary
FROM employees
ORDER BY salary DESC LIMIT 1,1;

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary != (SELECT MAX(salary) FROM employees)
ORDER BY salary DESC LIMIT 1;


