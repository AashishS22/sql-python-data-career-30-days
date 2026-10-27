
-- Day 6 : JOINS
-- Sep 12, 2026




CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	city VARCHAR(50),
	age INTEGER
	);
--


INSERT INTO customers
	(customer_id,first_name, last_name, email, city, age)
VALUES 
	(1, 'Aashish','Shah', 'aashish@gmail.com', 'Dallas', 24),
	(2, 'Dilasha', 'Malla', 'dilasha@gmail.com', 'Kathmandu', 20),
	(3,'Ram','Yadav', 'ram@gmail.com', 'Austin', 29),
	(4, 'Bibek','Shah', 'bibek@gmail.com', 'Kathmandu', 22),
	(5, 'Nabin', 'Pant', 'Nabin@gmail.com', 'Dallas', 23),
	(6, 'Ethan', 'Miller', 'ethan@example.com', 'Austin', 29),
    (7, 'Sophia', 'Moore', 'sophia@example.com', 'Dallas', 36),
    (8, 'Mason', 'Taylor', 'mason@example.com', 'Houston', 27),
    (9, 'Isabella', 'Anderson', 'isabella@example.com', 'Chicago', NULL),
    (10, 'Lucas', 'Thomas', 'lucas@example.com', 'Dallas', 24);
	( 11, 'Mia','Clark',NULL, 'Dallas', 26),
	(12, 'James', 'Lewis', 'james@gmail.com',NULL, 30),
	(13, 'Charlottee', 'Walker', NULL, 'Austin', NULL);
	

-- Create a TABLE orders--

CREATE TABLE orders (
	order_id INTEGER PRIMARY KEY,
	customer_id INTEGER,
	order_date DATE,
	amount DECIMAL(10,2),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
	);
	

INSERT INTO orders(
	order_id, customer_id, order_date, amount)
VALUES 
	(101, 1, '2026-09-01', 120.50),
	(102, 1, '2026-09-05', 80.00),
	(103, 3, '2026-09-02', 45.75),
	(104, 4, '2026-09-04', 200.00),
	(105, 7, '2026-09-06', 95.25),
	(106, 7, '2026-09-07', 60.00),
	(107, 10, '2026-09-08', 150.00);


---Exercise Day 6 ---
--1. show first_name, order_id, amount , for customers who have orders.

SELECT 
	c.first_name, 
	o.order_id, 
	o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

--2. Show all customers and any orders they may have.
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
	
--3. Find customers who have never placed an order.
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL;

--4. customer_id, first_name, order_date, amount for all the orders
SELECT 
	c.customer_id,
	c.first_name,
	o.order_date,
	o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id; 

--5. Find all orders greater than $100, including the customer's name.
SELECT c.first_name,o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id 
WHERE amount > 100;

--6. Show total order amount by customer.
SELECT c.first_name, SUM(o.amount) AS total_order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name;

--7. Show all customers and their total spending, including customers who have never ordered. IMP
SELECT c.first_name,
		COALESCE(SUM(o.amount), 0)AS total_spending  --use Coalesce before aggregating
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name;
	
--8. Show customers whose total spending is greater than $150
SELECT 
	c.first_name,
	sum(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
HAVING sum(o.amount) > 150;
	
--9. Count how many orders each customer has placed.
 SELECT c.first_name,
 		count(o.customer_id) AS no_of_order_placed
 FROM customers c
 INNER JOIN orders o
 ON c.customer_id = o.customer_id 
 GROUP BY c.customer_id, c.first_name;

--10. Show only customers who have placed at least 2 orders.
SELECT 
	c.first_name,
	count(o.customer_id) AS no_of_order_placed
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name 
HAVING count(o.customer_id) >= 2;

--11. Chellenge : Find the customer with the highest total spending.
SELECT 
	c.customer_id,
	c.first_name,
	sum(o.amount) AS highest_total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name 
ORDER BY highest_total_spending DESC
LIMIT 1;

	
--12. Very Imp challenge: Find the customers who have no orders.
SELECT c.first_name AS customers_with_no_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id 
WHERE o.customer_id IS NULL;
	

--SUMMARY--
-- INNER JOIN = only matching rows
-- LEFT JOIN = all rows from left table + matches from right
-- LEFT JOIN + WHERE right_table.key IS NULL = find unmatched rows
-- COALESCE (SUM(...), 0) = show 0 instead of NULL for me activity
	
	
	
	
	