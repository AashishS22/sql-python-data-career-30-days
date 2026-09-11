
-- Day 4 : Aggregates
-- Sep 10, 2026




CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	city VARCHAR(50),ahea
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



---Aggregate functions--

---COUNT--
-- This is used to the number of rows that matches a specified criterion.

SELECT count(*) -- counts all values in column including null.
FROM customers;

SELECT count(email)  -- counts all non-null values in a column
FROM customers; 


SELECT count(DISTINCT email) AS customer_with_unique_email -- counts unique values in a column
FROM customers;

---AVG--
-- This function returns the average value of a numeric column. it ignores the NULL values in a column.

SELECT round(avg(age), 2) AS average_age
FROM customers;

--MIN/MAX--
-- MIN: It returns the smallest value of the selected column
-- MAX: It returns the largest value of the selected column
SELECT min(age) AS youngest_age,
	   max(age) AS oldest_age,
	   round(avg(age), 2) AS average_age
FROM customers;


---SUM--
-- It calculates the total sum of the values within a numeric column.

SELECT sum(age * 10) AS total_membership_revenue
FROM customers;


---Aggeregate + WHERE
SELECT count(*) AS dallas_customers
FROM customers 
WHERE city = 'Dallas';


SELECT avg(age) AS average_dallas_age
FROM customers 
WHERE city = 'Dallas';

--GROUP BY --
-- It is used to group rows that have the same value into summary rows.

SELECT 
	city,
	count(city) AS total_customers
FROM customers 
GROUP BY city 


SELECT
	city,
	avg(age) AS average_age
FROM customers 
GROUP BY city;


-- Day 4 Exercise --------------------------------

--1. Count the total number of customers.

SELECT count(*)
FROM customers;

--2. Count how many customers have a non-NULL email.
SELECT count(email)
FROM customers;

--3. Count how many customers have a missing email.
SELECT count(*)
FROM customers  
WHERE email IS NULL;

--4. Find the average age of all customers with known ages.
SELECT avg(age)
FROM customers
WHERE age IS NOT NULL;

--5. Find the youngest and oldest customer ages in one query.
SELECT Min(age), Max(age)
FROM customers;

--6. Calculate the total hypothetical membership revenue if:
SELECT sum (age * 10) AS membership_revenue
FROM customers;

--7. Count how many customers live in Dallas.
SELECT count(city)
FROM customers 
WHERE city = 'Dallas';

--8. Find the average age of customers in Austin. 
SELECT 
	avg(age)
FROM customers 
WHERE city = 'Austin';

--9. Count this number of unique cities.
SELECT count(DISTINCT city)
FROM customers;

---10. Return each city and the number of customers in that city.
SELECT  city, Count(city) AS total_customers
FROM customers
WHERE city IS NOT null
GROUP BY city;

--11. Challenge : Return each city and its average customer age.
 SELECT city, avg(age) AS average_customer_age
 FROM customers
 WHERE city IS NOT null
 GROUP BY city;

--12. Business question which is larger: number of total customers , number of customers with an email
SELECT count(*)AS total_customer,  count(email) AS customers_with_email,
	GREATEST(Count(*), count(email)) AS larger_count
FROM customers;



