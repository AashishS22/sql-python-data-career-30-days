
-- Day 11 : Subqueries
-- Sep 17, 2026


-- A subquery is simply: a query inside another query.
-- Basic Shape:
SELECT ... 
FROM ... 
WHERE colum = (
	SELECT ...
	FROM ... 
);

--Example 1: Find customers older than the average age

SELECT 
	first_name,
	age 
FROM customers 
WHERE age > (
	SELECT avg(age)
	FROM customers
);

--Subquery type 1: Scalar subquery-
--A Scalar subquery returns exactly one value.
-- ex: 
WHERE age > (
	SELECT agv(age) 
	FROM customers
);

--ex: Highest order amount
WHERE amount = (
	SELECT  MAX(amount)
	FROM customers
);

--Challanges or exercises--
--1. Using your customers table: Return customer_id, first_name, age
--for customers whose age is greater then the average customer age.
SELECT
	customer_id,
	first_name, 
	age
FROM customers
WHERE age > (
	SELECT avg(age)
	FROM customers
);

--2.Find order or orders with the highest amount.Return order_id,customer_id,amount 
SELECT 
	order_id,
	customer_id,
	amount
FROM orders
WHERE amount = (
	SELECT MAX(amount)
	FROM orders
);
	
--3.Find customers whose age is greater than the age of Emma. 
-- Return customer_id, first_name, age
SELECT 
	customer_id,
	first_name,
	age 
FROM customers 
WHERE age > (
	SELECT 
		age 
	FROM customers
	WHERE first_name = 'Aashish'
)
GROUP BY customer_id;

-- 4. Now find customers who have placed at least one order.
-- This time i want you to use a subquery with: IN. Return customer_id, first_name
SELECT
	customer_id,
	first_name
FROM customers
WHERE customer_id IN (
	SELECT 
		DISTINCT customer_id
	FROM orders
);

--5. Find the customers who have never placed an order using a subquery.
SELECT
	customer_id,
	first_name
FROM customers 
WHERE customer_id NOT IN (
	SELECT customer_id 
	FROM orders
);

--6. Find customers whose age is greater than every customer from Austin.
SELECT 
	customer_id,
	first_name,
	age
FROM customers
WHERE age > (
	SELECT MAX(age)
	FROM customers 
	WHERE city = 'Austin'
);

--7. Find orders whose amount is greater than the average order amount.
--Return: order_id, customer_id, amount :
SELECT 
	order_id,
	customer_id,
	amount
FROM orders 
WHERE amount > (
	SELECT AVG(amount)
	FROM orders
);

-- Find the customer or customers whose total spending is greater than the average total spending across customers who placed the orders.
-- Return customer_id, first_name, total_spent 
-- ***
SELECT 
	c.customer_id,
	c.first_name,
	SUM(o.amount) AS total_spending
FROM customers c 
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name
HAVING SUM(o.amount) > (
	SELECT AVG(total_spent)
	FROM (
		SELECT 
			customer_id,
			sum(amount) AS total_spent
		FROM orders
		GROUP BY customer_id
	) customer_totals
);
	






