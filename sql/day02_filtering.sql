
-- Day 2 : Filtering and Sorting
-- Sep 8, 2026




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
    (9, 'Isabella', 'Anderson', 'isabella@example.com', 'Chicago', 33),
    (10, 'Lucas', 'Thomas', 'lucas@example.com', 'Dallas', 24);


-- Comparison operators ---
SELECT first_name, city 
FROM customers 
WHERE city != 'Dallas';  -- we can also write: city <> 'Dallas'--

--AND---
SELECT *
FROM customers 
WHERE city = 'Dallas' AND age > 20 ; --both the condition must be true

-- R---
SELECT *
FROM customers 
WHERE city = 'Dallas' OR city = 'Austin';  -- at least one condition must be true / either condtions

--NOT---
SELECT *
FROM customers 
WHERE NOT city = 'Dallas'; -- This returns customers whose city is not Dallas

--IN--
SELECT *
FROM customers 
WHERE city IN ('Dallas','Austin','Houston');

--BETWEEN--
SELECT first_name,age
FROM customers 
WHERE age BETWEEN 25 AND 30 ; -- inclusive

--LIKE--
--This is very useful for text searches.
SELECT *
FROM customers 
WHERE first_name LIKE 'A%' --whose firstname starts with letter A
OR last_name LIKE '%a' -- whose last name ends with letter a
OR last_name LIKE '%son%'; -- lastname that contain 'son'

-- ILIKE---
-- this is case in-sensitive
SELECT *
FROM customers 
WHERE first_name ILIKE 'ram'; -- this can match : Emma, EMMA, emma

--DISTINCT--
-- helps to reduce the dublicates 
SELECT city 
FROM customers; -- out table has many repeated cities

SELECT DISTINCT city 
FROM customers ; -- should see each city only once

--LIMIT--
SELECT *
FROM customers 
LIMIT 5; -- returns only 5 rows

SELECT first_name, age 
FROM customers 
ORDER BY age DESC 
LIMIT 3; -- returns 3 oldest customers


----Exercise Day 2------------------------------

-- 1. Show all customers who are not from Dalls
SELECT *
FROM customers
WHERE city <> 'Dallas';

--2. Show customers from Dallas or Houston
SELECT *
FROM customers 
WHERE city = 'Dallas' OR city = 'Houston';

--3. Show customers whose age is between 25 and 32
SELECT *
FROM customers
WHERE age BETWEEN 25 AND 32;

--4. show customers from Dallas, austin, chicago
SELECT *
FROM customers 
WHERE city IN ('Dallas','Austin','Chicago');

--5. Show customers whose first name starts with S
SELECT *
FROM customers 
WHERE first_name LIKE 'S%';

--6. Show all unique cities
SELECT DISTINCT city 
FROM customers;

--7. Show the 3 oldest customers
SELECT *
FROM customers
ORDER BY age DESC
LIMIT 3;

--8. Show customers who are from Dalls or Austin and are older thean 30.
SELECT *
FROM customers 
WHERE (city = 'Dallas' OR city = 'Austin')
AND age > 30;

--9. Show customers whose last name contains: son
SELECT *
FROM customers 
WHERE last_name ILIKE '%son%';

--10. show 5 youngest customers
SELECT *
FROM customers 
ORDER BY age 
LIMIT 5;
