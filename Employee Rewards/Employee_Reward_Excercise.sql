CREATE DATABASE mysql_practice;
USE mysql_practice;
SHOW TABLES;
DESCRIBE employee;
DESCRIBE reward;

-- Get all employees.
SELECT * FROM employee;	

-- Display the first name and last name of all employees.
SELECT First_name, Last_name FROM employee;		

-- Display all the values of the “First_Name” column using the alias “Employee Name”
SELECT First_name AS 'Employee Name' FROM employee;

-- Get all “Last_Name” in lowercase.
SELECT lower(Last_name) AS 'Last Name' FROM employee;

-- Get unique “Departement”.
SELECT DISTINCT(Departement) FROM employee;

-- Get the first 4 characters of “FIRST_NAME” column.
SELECT LEFT(First_name,4) AS 'First Name' FROM employee;
SELECT SUBSTRING(First_Name,1,4) FROM employee;

-- Get the position of the letter ‘h’ in ‘John’.
SELECT LOCATE('h',First_name) FROM employee WHERE First_name = 'John';
SELECT POSITION('h' IN First_name) FROM employee WHERE First_name = 'John';

-- Get all values from the “FIRST_NAME” column after removing white space on the right.
SELECT TRIM('RIGHT' FROM First_name) AS First_name FROM employee;
SELECT RTRIM(First_name) AS First_name FROM employee;

-- Write the syntax to create the “employee” table.
DESCRIBE employee;
DESCRIBE employee_copy1;
CREATE TABLE employee_copy1(
Employee_id INT PRIMARY KEY AUTO_INCREMENT,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Salary INT,
Joining_date DATE,
Departement VARCHAR(50));

-- Get the length of the text in the “First_name” column.
SELECT LENGTH(First_name) AS 'Length of First Name' FROM employee;

-- Get the employee’s first name after replacing ‘o’ with ‘#’.
SELECT REPLACE(First_name,'o','#') AS 'First Name after replacement' FROM employee;

-- Get the employee’s last name and first name in a single column separated by a ‘_’.
SELECT CONCAT_WS('_',First_name,Last_name) AS 'Full Name' FROM employee;
SELECT CONCAT(First_name,'_',Last_name) AS 'Full Name' FROM employee;

-- Get the year, month, and day from the “Joining_date” column.
SELECT YEAR(Joining_date) AS 'Year', MONTH(Joining_date) AS 'Month', DAY(Joining_date) AS 'Day' FROM employee;

-- Get all employees in descending order by first name.
SELECT * FROM employee ORDER BY First_name DESC;

-- Get all employees in ascending order by first name and descending order by salary.
SELECT * FROM employee ORDER BY First_name, salary DESC;

-- Get employees whose first name is nether “Bob” nor “Alex”.
SELECT * FROM employee WHERE First_name NOT IN ('Bob','Alex');

-- Get all the details about employees whose first name begins with ‘B’.
SELECT * FROM employee WHERE First_name LIKE 'B%';
SELECT * FROM employee WHERE First_name RLIKE '^B';

-- Get all the details about employees whose first name contains ‘o’.
SELECT * FROM employee WHERE First_name LIKE '%o%';
SELECT * FROM employee WHERE First_name RLIKE 'o';

-- Get all the details about employees whose first name ends with ‘n’ and contains 4 letters.
SELECT * FROM employee WHERE First_name LIKE '___n';
SELECT * FROM employee WHERE First_name RLIKE '^...n$';

-- Get all the details about employees with a salary between 2,000,000 and 5,000,000.
SELECT * FROM employee WHERE salary BETWEEN 2000000 AND 5000000;

-- Get all the details about employees whose joining year is “2019”.
SELECT * FROM employee WHERE YEAR(Joining_date) = 2019;

-- Get all the details on employees whose participation month (Joining_date) is “January”
SELECT * FROM employee WHERE MONTHNAME(Joining_date) = 'January';
SELECT * FROM employee WHERE MONTH(joining_date) = '01';

-- Get all the details of the employees who joined before March 1, 2019.
SELECT * FROM employee WHERE Joining_date < '2019/03/1';

-- Get the date and time of the employee’s enrollment.
SELECT DATE(Joining_date) AS 'Date', TIME(Joining_date) AS 'Time' FROM employee;

-- Get the difference between the “Joining_date” and “date_reward” column
SELECT  (r.date_reward - e.Joining_date) AS Difference  FROM employee AS e
	INNER JOIN reward AS r ON e.Employee_id = r.Employee_ref_id;

-- Get the current date and time.
SELECT CURDATE() AS 'Current Date', CURTIME() AS 'Current Time';

-- Get the first names of employees who have the character ‘%’. Example: ‘Jack%’.
SELECT * FROM employee WHERE First_name LIKE '%\%%';
SELECT * FROM employee WHERE First_name RLIKE '%';

-- Get the employee’s department and total salary, grouped by department,and sorted by total salary in descending order
SELECT departement, SUM(Salary) AS 'Total Salary' FROM employee GROUP BY departement ORDER BY SUM(salary) DESC;

-- Get the department, the number of employees in that department, and the total salary grouped by department, and sorted by total salary in descending order.
SELECT departement, COUNT(First_name) AS 'Number of employees', SUM(Salary) AS 'Total Salary' FROM employee
	GROUP BY departement ORDER BY SUM(salary) DESC;

--  Get the average salary by department in ascending order of salary.
SELECT departement, AVG(Salary) AS 'Average Salary' FROM employee GROUP BY departement ORDER BY AVG(salary);

-- Get the maximum salary by department in ascending order of salary.
SELECT departement, MAX(Salary) AS 'Maximum Salary' FROM employee GROUP BY departement ORDER BY MAX(salary);

-- Get the number of employees grouped by year and month of membership.
SELECT YEAR(Joining_date) AS 'Membership Year', MONTH(Joining_date) AS 'Membership Month', COUNT(First_name) AS 
	'Number of employees' FROM employee GROUP BY YEAR(Joining_date), MONTH(Joining_date);
    
--  Get the department and total salary grouped by the department, where the total salary is greater than 1,000,000, and sorted in descending order of the total salary.
SELECT departement, SUM(Salary) AS 'Total Salary' FROM employee GROUP BY departement 
	HAVING SUM(Salary) > 1000000 ORDER BY SUM(Salary) DESC;

-- Get all the details of an employee if the employee exists in the Reward table.
SELECT * FROM employee WHERE employee_id IN (SELECT DISTINCT Employee_ref_id FROM reward);

-- Get the IDs of employees who received rewards without using subqueries?
SELECT DISTINCT Employee_id FROM employee INNER JOIN reward ON employee.employee_id = reward.employee_ref_id;

-- Get 20% of Bob’s salary, 10% of Alex’s salary, and 15% of other employees’ salaries.
SELECT First_name, salary, CASE first_name
WHEN 'Bob' THEN salary * 0.2
WHEN 'Alex' THEN salary * 0.1
ELSE salary * 0.15
END AS 'Salary Perecnt' FROM employee;

/* Display the text:
-- ‘IT services’ instead of ‘IT’,
-- ‘Financial services’ instead of ‘Finance’, and
-- ‘Banking services’ instead of ‘Banking’
from the “Department” column.*/
SELECT DISTINCT CASE departement
WHEN 'IT' THEN 'IT Services'
WHEN 'Finance' THEN 'Financial Services'
WHEN 'Banking' THEN 'Banking Services'
ELSE departement
END AS 'Department\'s New Name' FROM employee;

-- Remove employees who have received rewards.
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM employee WHERE employee_id IN (SELECT DISTINCT employee_ref_id FROM reward);
SELECT * FROM employee;
SET FOREIGN_KEY_CHECKS=1;

-- Insert employee whose name contains a single quote '
INSERT INTO employee (first_name) VALUES("Ale'x");

-- Get the first name of the employees which contains only numbers.
SELECT first_name FROM employee WHERE first_name RLIKE '\\d';

-- Rank employees according to their total reward.
SELECT employee_id, CONCAT(first_name,' ',last_name) AS 'Full Name', sum(amount) AS 'Total reward', DENSE_RANK() OVER(
ORDER BY sum(amount) DESC) AS Ranking 
FROM employee AS e INNER JOIN reward AS r ON e.employee_id = r.Employee_ref_id GROUP BY r.Employee_ref_id;

-- Rank employees according to their reward for each year.
SELECT employee_id, CONCAT(first_name,' ',last_name) AS 'Full Name', amount AS 'Total reward', DENSE_RANK() OVER(
PARTITION BY YEAR(date_reward) ORDER BY amount DESC) AS Ranking 
FROM employee,reward WHERE employee.employee_id = reward.Employee_ref_id;

-- Update the reward of “Bob” to 3000.
UPDATE reward SET amount = 3000
WHERE employee_ref_id = (
SELECT employee_id FROM employee WHERE first_name = 'Bob');

-- Get the first name, the amount of the reward for the employees who have rewards.
SELECT first_name,SUM(amount) AS 'Total Reward' FROM employee INNER JOIN reward ON 
employee_id = employee_ref_id GROUP BY employee_ref_id;

-- Get the first name, the reward amount for employees who have rewards with an amount greater than 3000.
SELECT first_name,amount FROM employee INNER JOIN reward ON 
employee_id = employee_ref_id WHERE amount > 3000;

-- Get the first name, the amount of the reward for the employees even if they have not received any rewards.
SELECT first_name, amount FROM employee LEFT JOIN reward ON employee_id = employee_ref_id;

/* Get the first name, the reward amount for employees even if they did not receive any rewards, 
and set a reward amount equal to 0 for the employees who did not receive rewards.*/
SELECT first_name,IFNULL(amount,0) FROM employee LEFT JOIN reward ON employee_id = employee_ref_id;

-- Get the first name, the reward amount for employees who have rewards using “Right Join”.
SELECT first_name,IFNULL(amount,0) FROM employee RIGHT JOIN reward ON employee_id = employee_ref_id;

-- Get the maximum reward per employee using subquery.
SELECT first_name, max(amount) FROM employee INNER JOIN reward ON employee_id = employee_ref_id GROUP BY employee_ref_id;

-- Get the employees with highest three salaries;
SELECT * FROM employee ORDER BY salary DESC LIMIT 3;

-- Get the 2nd highest salary among the employees.
SELECT MAX(salary) AS '2nd Highest Salary' FROM employee WHERE salary NOT IN (
SELECT MAX(salary) FROM employee);
SELECT salary FROM employee ORDER BY salary DESC LIMIT 2,1;

SELECT first_name FROM employee UNION SELECT last_name FROM employee;

-- 

	