USE mysql_practice;
SHOW TABLES;

SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM orderline;

-- Get the list of all items that are present in each orders.
SELECT GROUP_CONCAT(name) AS 'Ingredients' FROM orderline GROUP BY order_id;

-- Get the list of all products that are present on several orders.
SELECT name, COUNT(*) FROM 
	(SELECT order_id, name FROM orderline GROUP BY name,order_id) AS orderline_sg 
	GROUP BY name HAVING count(*) > 1;
    
-- Get the list of all the products that are present on several orders and add a column that lists the id of the associated orders.
SELECT name, GROUP_CONCAT(order_id) AS 'List of order_id' FROM ( 
	SELECT * FROM orderline GROUP BY name,order_id) AS orderline_sg GROUP BY name HAVING count(*) > 1;
    
-- Store the total price within each order line, based on the unit price and quantity.
UPDATE orderline SET total_price = quantity * unit_price;

/* Get the total price for each order and the date associated with that order as well as the 
first and last name of the associated customer.*/
SELECT order_id, CONCAT(firstname, ' ', lastname) AS 'Full Name', purchase_date, SUM(total_price) AS 'Bill Amount'
	FROM orderline INNER JOIN orders ON orderline.order_id = orders.id 
    INNER JOIN customer ON orders.customer_id = customer.id
    GROUP BY order_id ORDER BY SUM(total_price) DESC;

-- Store the total price of each order in the field named “order_total_price”.
UPDATE orders INNER JOIN (
SELECT order_id, SUM(total_price) AS Bill_Amount FROM orderline GROUP BY order_id ) AS sub ON orders.id = order_id
SET order_total_price = Bill_Amount;

-- Get the total price of all orders, for each month.
SELECT MONTH(purchase_date),SUM(order_total_price) AS 'Monthly Sale' FROM orders 
	GROUP BY YEAR(purchase_date), MONTH(purchase_date);
    
-- Get a list of the 10 customers who made the largest amount of orders, and get this total price for each customer.
SELECT firstname, lastname, SUM(order_total_price) AS 'Total Purchase' FROM orders 
	INNER JOIN customer ON customer_id = customer.id 
    GROUP BY customer_id ORDER BY SUM(order_total_price) DESC LIMIT 10;

-- Get the total price of orders for each date.
SELECT purchase_date, SUM(order_total_price) AS 'Total Sale' FROM orders GROUP BY (purchase_date);

-- Add a column named “category” to the table containing the orders. This column will contain a numerical value.
ALTER TABLE orders ADD category INT NOT NULL AFTER order_total_price;

/* Enter the value of the category, according to the following rules:
“1” for orders under 200€.
“2” for orders between 200€ and 500€.
“3” for orders between 500€ and 1.000€.
“4” for orders over 1.000€.*/
UPDATE orders SET category = (
	SELECT CASE 
	WHEN order_total_price < 200 THEN 1
    WHEN order_total_price BETWEEN 200 AND 500 THEN 2
    WHEN order_total_price  BETWEEN 500 and 1000 THEN 3
    ELSE 4 END AS cat);
    
