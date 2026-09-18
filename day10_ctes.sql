
-- Day 10 : CTEs (Common Table Expressions)
-- Sep 16, 2026


-- CTE : Common Table Expressions
-- It is basically a temporary named result set that exists only while one query runs.
-- The syntax starts with : WITH

--normally we write 
 SELECT 
 	customer_id,
 	first_name,
 	age
 FROM customers
 WHERE age >= 30;

--now with a CTE:
WITH older_customers AS (
	SELECT
		customer_id,
		first_name,
		age
	FROM customers
	WHERE age >= 30
)
SELECT *
FROM older_customers;

-- CTEs often makes complicated SQL much easier to read.
--Example with aggregation.
--suppose we first calculate spedning per customer:

WITH customer_spending AS (
	SELECT
		c.customer_id,
		c.first_name,
		sum(o.amount)AS total_spent
	FROM customers c
	JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.first_name
	)
SELECT *
FROM customer_spending 
WHERE total_spent > 150;

-----Exercises---
--1. Create CTE called: dallas_customers , inside it, select customer_id, first_name, city from Dalls. then outside the CTE: return all from the table.

WITH dallas_customers AS (
	SELECT 
		customer_id,
		first_name,
		city
	FROM customers 
	WHERE city = 'Dallas'
)
SELECT *
FROM dallas_customers;

--2.Now create a CTE called: customer_spending, inside it, calculate customer_id, first_name, total_spent, usng coustomers and orders table: whose total_spent > 150

WITH customer_spending AS (
	SELECT
		c.customer_id,
		c.first_name,
		sum(o.amount) AS total_spent
	FROM customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id , c.first_name 
)
SELECT *
FROM customer_spending 
WHERE total_spent > 150;

--3. create CTE called: customer_order_count. Inside it, return: customer_id, first_name, total_orders, from all customers, including withj zero orders.
--then outside the CTE, return only customers with: total_orders>= 2

WITH customer_order_count AS (
	SELECT 
		c.customer_id,
		c.first_name,
		count(o.order_id) AS total_orders
	FROM customers c
	LEFT JOIN orders o
	ON c.customer_id = o.customer_id 
	GROUP BY c.customer_id, c.first_name 
)
SELECT *
FROM customer_order_count 
WHERE total_orders >= 2;

--4. Create CTE called: customer_revenue. Inside it, use all three tables: customers, orders, order_items.
--  Return customer_id, first_name, total_revenue, where total_revenue = SUM(quantity * unit_price)
WITH customer_revenue AS (
	SELECT 
		c.customer_id,
		c.first_name,
		sum(t.quantity * t.unit_price) AS total_revenue
	FROM customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id 
	INNER JOIN order_items t
	ON o.order_id = t.order_id
	GROUP BY c.customer_id , c.first_name 
)
SELECT *
FROM customer_revenue 
WHERE total_revenue > 100
ORDER BY total_revenue DESC; 

--5. miltiple CTEs
WITH order_counts AS (
	SELECT
		c.customer_id,
		count(o.order_id) AS total_orders
	FROM customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id 
),  
spending AS (
 	SELECT
 		c.customer_id,
 		sum(o.amount) AS total_spent
 	FROM customers c
 	INNER JOIN orders o
 	ON c.customer_id = o.customer_id
 	GROUP BY c.customer_id 
 )
 SELECT 
	oc.customer_id,
	oc.total_orders,
	s.total_spent
FROM order_counts oc 
INNER JOIN spending s
	ON oc.customer_id = s.customer_id;

--6. 
WITH high_value_orders AS (
	SELECT 
		o.customer_id,
		o.order_id,
		o.amount
	FROM orders o
	WHERE o.amount > 100
)
SELECT 
	c.first_name,
	h.order_id,
	h.amount
FROM high_value_orders h
INNER JOIN customers c
ON h.customer_id = c.customer_id;

--7. Find the highest-spending customer using CTE.

WITH customer_spending AS (
	SELECT 
		c.customer_id,
		c.first_name,
		sum(o.amount) AS total_spent
	FROM customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.first_name 
)
SELECT *
FROM customer_spending 
ORDER BY total_spent DESC 
LIMIT 1;


