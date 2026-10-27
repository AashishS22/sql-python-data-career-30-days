
-- Day 5: GROUP BY and HAVING
-- Sep 11, 2026

-- GROUP BY, HAVING, WHERE vs HAVING, aggregate filtering

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

INSERT INTO customers 
	(customer_id, first_name, last_name, email, city, age)
VALUES 
	( 11, 'Mia','Clark',NULL, 'Dallas', 26),
	(12, 'James', 'Lewis', 'james@gmail.com',NULL, 30),
	(13, 'Charlottee', 'Walker', NULL, 'Austin', NULL);
	

----Group BY--
--It is used to group rows that have the same values into summary rows, like " Find the number of customers in each city"
SELECT city,
	count(*) AS total_customers
FROM customers 
GROUP BY city;

--Group BY + AVG --
SELECT city,
	avg(age) AS average_age
FROM customers c 
GROUP BY city;

--Group BY + MIN + MAX --
SELECT city,
	count(*) AS total_customers,
	min(age)AS youngest_age,
	max(age) AS oldest_age,
	round(avg(age), 2) AS average_age
FROM customers
WHERE city IS NOT NULL
GROUP BY city;

-- ORDER BY aggregate results--
 SELECT city,
 	count(*) AS total_customers
 FROM customers 
 GROUP BY city 
 ORDER BY total_customers DESC ;

-- WHERE vs HAVING---
SELECT city,
	count(*) AS total_customers
FROM customers 
WHERE age >= 25  -- filters before aggregation
GROUP BY city;


SELECT city,
	count(*) AS total_customers 
FROM customers 
GROUP BY city 
HAVING count(*) >= 2; -- filters after aggregation

----WHERE + GROUP BY + HAVING together--
SELECT city,
	count(*) AS total_customers 
FROM customers 
WHERE  age >= 25
GROUP BY city 
HAVING count(*) >= 2
ORDER BY total_customers DESC ;


-- IMP Business example: 
-- Imagine asking: which cities have an average customer age above 30?

SELECT city,
	round(avg(age), 2) AS average_age 
FROM customers 
WHERE city IS NOT NULL
GROUP BY city 
HAVING avg(age) > 30
ORDER BY average_age DESC;


--- Day 5 Exercise -------------------------------------------------
--1. Retrun each city and number of customers
SELECT city,
	count(*) AS total_customers
FROM customers
WHERE city IS NOT null
GROUP BY city;

--2. Return each city and average customer age.
SELECT city,
	round(avg(age),2) AS average_age
FROM customers 
WHERE city IS NOT NULL 
GROUP BY city;

---3. Returns each city with: total customers, youngest age, oldest age, average age.
SELECT city,
	count(*) AS total_customers,
	min(age) AS youngest_age,
	max(age) AS oldest_age,
	Round(avg(age), 2) AS average_age
FROM customers
WHERE city IS NOT NULL 
GROUP BY city;


--4. Show cities ordered from most customers to fewest customers.
SELECT city,
	count(*) AS total_customers 
FROM customers
WHERE city IS NOT NULL 
GROUP BY city 
ORDER BY total_customers DESC; 


---5. Show only cities with at least 2 customers.
SELECT city, 
	count(*) AS total_customers 
FROM customers 
WHERE city IS NOT NULL 
GROUP BY city 
HAVING count(*) >= 2
ORDER BY total_customers DESC; 

---6. show cities whose average customer age is greater than 30.
SELECT city,
	 Round(avg(age), 2) AS average_age 
FROM customers
WHERE city IS NOT NULL 
GROUP BY city 
HAVING avg(age) > 30
ORDER BY average_age DESC ;  

---7. Count customers by city, but only include customers aged 25 or older.
SELECT city,
	count(*) AS total_customers 
FROM customers
WHERE age >= 25 AND city IS NOT NULL 
GROUP BY city
ORDER BY total_customers DESC;

--8. Show cities that: have customers age 25+ , and after filtering, have atleast 2 customers.
SELECT city,
	count(*) AS total_customers 
FROM customers
WHERE age >= 25 AND city IS NOT NULL 
GROUP BY city 
HAVING count(*) >= 2
ORDER BY total_customers DESC;

---9. Show each city and the number of customers with a non-Null email.
 SELECT city,
 	count(email) AS customers_with_email,
 	count(*) AS total_customers 
 FROM customers
 WHERE city IS NOT NULL
 GROUP BY city;

---10. Show cities where at least 2 customers have an email.
SELECT city,
	count(email) AS customers_with_email,
	count(*) AS total_customers 
FROM customers
WHERE city IS NOT NULL 
GROUP BY city 
HAVING count(email) >= 2
ORDER BY total_customers DESC;

---11. Returns each city and it's average age, but only for cities with: at least 2 customers, average age greater than 28.

SELECT city,
	count(*) AS total_customers,
	ROund(avg(age),2) AS average_age
FROM customers 
WHERE city IS NOT NULL 
GROUP BY city
HAVING avg(age) > 28 AND count(*) >= 2;

--12. Business-Style challenge ---
 SELECT city, 
 		count(*) AS total_customers,
 		Round(avg(age), 2) AS average_age
 FROM customers
 WHERE city IS NOT NULL
 GROUP BY city 
 ORDER BY average_age DESC
 LIMIT 1;


---Key takeaways from Day 5: GROUP BY and HAVING---

-- WHERE : filters individual rows BEFORE grouping
--- GROUP BY : creates group
-- HAVING : filters those group AFTER grouping