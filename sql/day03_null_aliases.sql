--Day 3 : NULL and Aliases
-- Sep 9, 2026
--NULL---
-- Null means a value is missing/unknown/not abailable
-- Add some null data 




SELECT *
FROM customers
WHERE city IS NULL; --find missing cities

SELECT *
FROM customers 
WHERE city IS NOT NULL; -- find not missing values for cities

SELECT *
FROM customers 
WHERE age IS NULL;

---COALESCE--
-- Helps to replace a NULL value in the result.
SELECT first_name,
COALESCE (email, 'Not Email') AS email
FROM customers;

--Column aliases---
-- It is a temporary rename for a column in your query's output.
 SELECT 
 first_name AS name,
 city AS address
 FROM customers;

--Column Calculations---
 SELECT 
 	first_name AS name,
	customer_id + age AS pin,
	COALESCE (email, 'No Email') AS mail
	FROM customers;

SELECT 
	first_name,
	age,
	age * 12 AS age_in_months
FROM customers 
	WHERE age IS NOT NULL;

---Multiple-Column sorting---

SELECT *
FROM customers
ORDER BY city ASC, age DESC;

---DISTINCT with multiple comumns---
SELECT DISTINCT city, age 
FROM customers;

----Day 3 Exercises ------

--1. Find all customers whose email is missing.
SELECT *
FROM customers
WHERE email IS NULL; 

--2. Find customers whose city is not missing.
SELECT *
FROM customers
WHERE city IS NOT NULL;

--3. Return first_name, email, but replace emails with no email provided.
SELECT first_name,
	COALESCE (email, 'No email provided') AS email
FROM customers;

-- 4. Return first_name, age, age_in_10_years ; for a customers who age is known. 
SELECT first_name,
	age,
	age + 10 AS age_in_10_years
FROM customers 
WHERE age IS NOT NULL;

---5. Return first_name, city but reneame them customer_name and customer_city
SELECT first_name AS customer_name,
		city AS customer_city
FROM customers;

---6. Sort all customers first by city alphabetically, then by age from oldest to youngest.

SELECT *
FROM customers 
ORDER BY city ASC, age DESC;

--7. Show only unique combination of : city, age
SELECT DISTINCT age, city 
FROM customers;

--8. Find customers whose: email is Null, or city is Null
SELECT *
FROM customers 
WHERE email IS NULL OR city IS NULL ;

--9. show first_name, age, for 3 youngest customers with a known age.

SELECT  first_name, age
FROM customers 
WHERE age IS NOT NULL
ORDER BY age 
LIMIT 3;

--10. Pretend each person's yearly membership fee is : age * $10 ; return first_name,age, membership_fee.
SELECT first_name,
	age,
	age * 10 AS membership_fee
FROM customers
WHERE age IS NOT NULL
ORDER BY membership_fee DESC;

