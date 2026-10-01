
-- Day 16 : EXISTS, NOT EXISTS, and Correlated Subqueries.
-- Sep 22, 2026

-- EXISTS asks: “Does at least one matching row exist?”
-- SQL provides the EXISTS operator to check whether a subquery returns at least one row. It is useful for filtering data based on the presence of related records.

	--Checks if a subquery returns one or more rows.
	--Returns TRUE if data exists, otherwise FALSE.
	--Commonly used with subqueries.


--Exercises
--1. Using customers and orders, return: customer_id, first_name , for customers who have placed at least one order

SELECT 
	customer_id,
	first_name
FROM customers c
WHERE EXISTS (
		SELECT 1
		FROM orders o
		WHERE o.customer_id = c.customer_id
);

--2. Return customer_id, first_name, for customers who have never placed an order.

SELECT 
	customer_id,
	first_name
FROM customers c
WHERE NOT EXISTS (
		SELECT 1
		FROM orders o
		WHERE o.customer_id = c.customer_id 
);

--3. Find the customers who have at least one order greater than $100.
SELECT
	customer_Id,
	first_name
FROM customers c 
WHERE EXISTS (
	SELECT 1
	FROM orders o
	WHERE o.customer_id = c.customer_id 
	AND o.amount > 100	
)

--4. Find the customers who do not have any order greater than $100.
SELECT 
	customer_id,
	first_name
FROM customers c 
WHERE NOT EXISTS (
	SELECT 1
	FROM orders o
	WHERE o.customer_id = c.customer_id 
	AND o.amount > 100
);

-- correlated subquery with an aggregate --
--5. Find orders whoese amount is greater than that customer's average order amount.
SELECT
	o1.customer_id,
	o1.order_id
FROM orders o1 
WHERE o1.amount > (
	SELECT 
		avg(o2.amount)
	FROM orders o2
	WHERE o2.customer_id = o1.customer_id
);

--6. — Correlated subquery with MAX()
--Find the highest value order for each customer using a correlated subquery
-- Return order_id, customer_id, amount

SELECT
	o1.order_id,
	o1.customer_id,
	o1.amount
FROM orders o1
WHERE o1.amount = (
		SELECT 
			max(o2.amount)
		FROM orders o2
		WHERE o2.customer_id = o1.customer_id 
);


--7. Find the customers whose total spending is greater than the average total spending across customers who have orders.
SELECT 
	o1.customer_id,
	sum(o1.amount) AS total_spending
FROM orders o1
GROUP  BY customer_id 
HAVING sum(o1.amount) > (
	SELECT 
		AVG(total_spending)
	FROM (
		SELECT 
			customer_id,
			sum(amount) AS total_spending
		FROM orders
		GROUP BY customer_id
	)customer_totals
);

--8. Count orders per customer, Return: customer_id ,first_name ,order_count for every customer, including customers with zero orders.


SELECT 
	c.customer_id,
	c.first_name,
	(
	SELECT 
		count(*)
	FROM orders o
	WHERE o.customer_id = c.customer_id
	) AS order_count
FROM customers c;
	

--9. Compare against a group average
--Find customers whose age is greater than the average age of customers in the same city.
-- Return customer_id, first_name, city, age

SELECT 
	c1.customer_id,
	c1.first_name,
	c1.city,
	c1.age
FROM customers c1
WHERE c1.age > (
	SELECT 
		avg(c2.age)
	FROM customers c2
	WHERE c2.city = c1.city 
); 
	 



--**--

SELECT
	o1.order_id,
	o1.customer_id,
	o1.amount
FROM orders o1 
WHERE amount > (
	SELECT 
		avg(o2.amount)
	FROM orders o2
	WHERE o1.customer_id = o2.customer_id 
	GROUP BY o2.customer_id 
);


SELECT 
	customer_id,
	first_name,
	(
	SELECT 
		count(*)
	FROM orders o
	WHERE o.customer_id = c.customer_id
	) AS order_count
FROM customers c;



SELECT 
	customer_id,
	first_name
FROM customers c
WHERE NOT EXISTS (
	SELECT 1
	FROM orders o
	WHERE o.customer_id = c.customer_id 

);