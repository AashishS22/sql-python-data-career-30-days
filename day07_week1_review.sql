
-- Day 7 : Week 1 Review SQL Challenge
-- Sep 13, 2026

-- SELECT, filtering, NULL, aggregates,
-- GROUP BY, HAVING, INNER JOIN, LEFT JOIN



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


---Exercise Day 7 :  ---
--Part 1: No note SQL challenge.

--1. Show all customers from Dalls
SELECT
	first_name,
	city 
FROM customers
WHERE city = 'Dallas';

--2.Show the 5 youngest customers with known ages
SELECT first_name, age
FROM customers 
WHERE age IS NOT NULL 
ORDER BY age
LIMIT 5;

--3. Show each unique city 
SELECT DISTINCT city 
FROM customers
WHERE city IS NOT NULL;

--4. Count the total number of customers.
SELECT count(*) AS total_customers
FROM customers c ;

--5. Find the average known customer age
SELECT Round(avg(age), 2) AS average_customer_age -- AVG(age) already ignores NULL 
FROM customers   ;

--6. Show each city and number of customers
SELECT city, count(*) AS number_of_customers
FROM customers 
WHERE city IS NOT NULL
GROUP BY city ;

--7. Show only cities with at least 2 customers
SELECT city , count(*) AS no_of_customers 
FROM customers
WHERE city IS NOT NULL 
GROUP BY city 
HAVING count(*) >= 2;
	
--8. Show each city and its average age, ordered highest average age first.
SELECT
	city,
	Round(avg(age), 2) AS average_age
FROM customers 
WHERE city IS NOT NULL  
GROUP BY city 
ORDER BY average_age DESC;

--9. Show customer names and their orders using an INNER Join.
SELECT c.customer_id, c.first_name, o.order_id, o.order_date, o.amount 
FROM customers c
INNER JOIN orders o 
ON c.customer_id = o.customer_id;

--10. Show all customers, including customers without orders.
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;


--11. Find customers who have never placed an order
SELECT c.first_name AS customer_with_no_orders, c.customer_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL;

--12. Show all orders greater than $100 with customer names.
SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id 
WHERE o.amount > 100;

--13. Show each customer's total spending.
SELECT c.customer_id, c.first_name, sum(o.amount) AS total_spending
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name 
ORDER BY c.customer_id;

--14. Show all customers and total spending, including customers who spent $0
 SELECT 
 	c.customer_id,
 	c.first_name,
 	COALESCE (sum(o.amount), 0) AS total_spending
 FROM customers c 
 LEFT JOIN orders o 
 ON c.customer_id = o.customer_id
 GROUP BY c.customer_id
ORDER BY c.customer_id ;


--15. show customers whose total spending is greater than $150.
SELECT 
	c.customer_id, 
	c.first_name, 
	sum(o.amount) AS total_spending
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id ,c.first_name
HAVING sum(o.amount ) > 150
ORDER BY c.customer_id ;

--16. Count the number of orders placed by each customer.
SELECT 
	c.customer_id, 
	c.first_name,
	count(o.order_id) AS no_of_order_placed
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.customer_id 
ORDER BY c.customer_id ;

--17. Show only customers with at least 2 orders
SELECT 
	c.customer_id, 
	c.first_name,
	count(o.customer_id) AS no_of_order_placed
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id
HAVING count(o.customer_id) >= 2;

---18. Find customer with the highest total spending 
SELECT 
	c.customer_id,
	c.first_name,
	sum(o.amount) AS total_spending
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id 
ORDER BY total_spending DESC 
LIMIT 1;

--19. Show customers aged 25+ from Dallas or Austin.
SELECT customer_id ,first_name,city, age
FROM customers
WHERE age >= 25 
	AND city IN ('Dallas', 'Austin');

--20. Return: first_name, email and replace a missing email with "No Email Provided".
SELECT  
	first_name,
	COALESCE (email, 'No Email Provided') AS email
FROM customers;


--Part 2: Explain these aloud

----A: What is the difference between: WHERE COUNT(*) > 2 & HAVING COUNT(*) > 2, Which one is correct and why ?
-- WHERE filters individual rows before GROUP BY.
-- HAVING filters grouped/aggregated results after GROUP BY.
-- Aggregate conditions like COUNT(*) > 2 belong in HAVING.

----B: What is the difference between: Inner join and LEFT join.
-- INNER JOIN keeps only rows that match in both tables.
-- LEFT JOIN keeps every row from the left table and adds matching rows from the right; unmatched right-side values become NULL.

---C: Why can: SUM(o.amount) return NULL after a LEFT JOIN? And why would we use:COALESCE(SUM(o.amount), 0)
-- With a LEFT JOIN, a customer with no orders still remains, but o.amount is NULL. 
-- Then: COALESCE(SUM(o.amount), 0); turns a missing total into 0, which is usually the better business meaning for “no spending.”


---D: Why is:GROUP BY c.customer_id, c.first_name better than only: GROUP BY c.first_name
-- Grouping only by name can accidentally merge two different people who happen to have the same name. customer_id is unique, 
-- so: GROUP BY c.customer_id, c.first_name , keeps each customer separate.

