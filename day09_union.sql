
-- Day 9 : UNION & UNION ALL
-- Sep 15, 2026



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


-- Build our third table--

-- we already have table: customers , table: orders, now we create table: order_items

CREATE TABLE order_items (
	item_id INTEGER PRIMARY KEY,
	order_id INTEGER,
	product_name VARCHAR(200),
	quantity INTEGER,
	unit_price DECIMAL(10,2),
	FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO order_items
	(item_id, order_id, product_name, quantity, unit_price)
VALUES
	(1, 101, 'Keyboard', 1, 70.00),
	(2, 101, 'Mouse', 2, 25.25),
	(3, 102, 'USB Cable', 4, 20.00),
	(4, 103, 'Laptop Stand', 1, 45.75),
	(5, 104, 'Monitor', 1, 200.00),
	(6, 105, 'Headphones', 1, 95.25),
	(7, 106, 'Webcam', 2, 30.00),
	(8, 107, 'SSD', 1, 150.00);



--- UNION--
--This is used to combine the result-set of two or more SELECT queries into a single output.
--UNION removes duplicate rows and returns only unique records from all combined queries.
--UNION ALL includes all rows, even duplicates.
-- Queries must have matching columns and data types.
-- Helpful for combining data from different sources.


SELECT first_name, city
FROM customers 
WHERE city = 'Dallas'
UNION
SELECT first_name, city
FROM customers 
WHERE city = 'Austin';


--UNION ALl--
-- Stacks everything , including duplicates values 
SELECT city
FROM customers 
UNION ALL
SELECT  city 
FROM customers;

---COLUMN names with UNION
-- The final result normally takes its column names from the first SELECT. 
SELECT 
	first_name AS person_name, 
	city AS locations 
FROM customers 
WHERE city = 'Dallas'

UNION 

SELECT 
	first_name, 
	city 
FROM customers 
WHERE city = 'Austin';

--- ORDER BY with UNION
-- if you want to sort the combined result, put ORDER BY at the end.
SELECT first_name, city 
FROM customers 
	WHERE city = 'Dallas'
	UNION 
SELECT first_name, city 
FROM customers 
	WHERE city = 'Austin'
ORDER BY first_name;

---Day 9 Challenges / exercises-------------------------------------------------------

--1. Using only the customers table: 
--Return first_name, city for customers who live in: Dallas
--and combine them with customers who live in: Austin
--Using UNION
SELECT first_name, city
FROM customers 
	WHERE city = 'Dallas'
UNION
SELECT first_name, city
FROM customers 
WHERE city = 'Austin';

--2. Using UNION ALL 
SELECT first_name, city
FROM customers 
	WHERE city = 'Dallas'
UNION ALL
SELECT first_name, city
FROM customers 
WHERE city = 'Austin';
 -- : so, if exact same first_name, city row appreared in both SELECT results, UNION would keep one copy, while UNION ALL would keep both. 

-- Return first_name, city, source 
-- for Dallas customers, the source should say: Dallas group,
-- for Austin customers, the source should say: Austin group
SELECT 
	first_name,
	city,
	'Dallas Group' AS source
FROM customers 
	WHERE city = 'Dallas'
UNION ALL
SELECT 
	first_name, 
	city,
	'Austin Group' AS source
FROM customers 
WHERE city = 'Austin';


--4. Nwo combine two different types of rocords into one result. 
-- Return record_type, id , value,  for customers: record type = 'Customer', id = 'customer_id', value = first_name,
-- For orders: record_type = 'Order' id = order_id, value = amount

SELECT 
     'Customer' AS record_type,
      customer_id AS id,
      first_name AS Value
FROM customers 
UNION ALL 
SELECT
	'Order' AS record_type,
	order_id AS id,
	cast(amount AS text) AS value -- we could also write: amount::text
FROM orders;
	

--5. 
SELECT 
	first_name AS name,
	'Customer' AS category
FROM customers 
UNION 
SELECT
	product_name AS name,
	'Product' AS category
FROM order_items;

--6. Return single column called: city
-- containing: all customer cities from customers, plus the text 'online'
SELECT 
	city
FROM customers 
WHERE city IS NOT NULL 
UNION 
SELECT 'Online' AS city;

--7. Combine customers.first_name, order_items.product_name into a single column called label.
SELECT first_name AS LABEL
FROM customers 
UNION ALL 
SELECT product_name AS LABEL 
FROM order_items;

--8. Now let's make ORDER BY with UNION explicit.
-- combine Dallas and Austin customers into : first_name , city
-- using UNION ALL, then sort the entire combined result by city as ASC and first_name ASC
SELECT first_name , city 
FROM customers 
WHERE city = 'Dallas'
UNION ALL 
SELECT first_name, city 
FROM customers 
WHERE city = 'Austin'
ORDER BY city ASC, first_name ASC;
--9. Final Mixed UNION challenge
SELECT 
	'Customer' AS record_type,
	first_name AS name,
	city AS details
FROM customers 
WHERE city IS NOT NULL 
UNION ALL 
SELECT 
	'Product' AS record_type,
	product_name AS name,
	CAST(unit_price as text) AS details
FROM order_items
ORDER BY record_type ASC , name ASC;

--UNION concept: 
--JOIN
--→ combines related rows horizontally

--UNION
-- → stacks results vertically
-- → removes duplicate rows

--UNION ALL
-- → stacks results vertically
-- → keeps duplicate rows

--Requirements:
-- → same number of columns
-- → corresponding data types compatible
-- → final ORDER BY goes at the end