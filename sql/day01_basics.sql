
-- Day 1 : PostgreSQL Fundamentals
-- Sep 7, 2026




CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	city VARCHAR(50),
	age INTEGER
	);


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

SELECT *
FROM customers;

SELECT first_name, last_name, city 
FROM customers;

SELECT first_name, email, age 
FROM customers;

SELECT *
FROM customers
WHERE city = 'Dallas';

SELECT *
FROM customers
WHERE age > 30;

SELECT *
FROM customers
WHERE city = 'Kathmandu';

SELECT first_name, last_name, age 
FROM customers
ORDER BY age;

SELECT *
FROM customers
WHERE city = 'Dallas' AND age > 25;

SELECT first_name, last_name, age
FROM customers
ORDER BY age DESC;

SELECT first_name, last_name, age 
FROM customers
WHERE age >= 25
ORDER BY age DESC;


------Exercise-----
--return only : frist_name , last_name

SELECT first_name, last_name
FROM customers;


--show every customers who lives in houston
SELECT *
FROM customers
WHERE city = 'Houston';


-- show first_name, age for customers younger than 30

SELECT first_name,age 
FROM customers
WHERE age < 30;

-- show all customers sorted from youngest to oldest
SELECT *
FROM customers
ORDER BY age;

-- show firstname, city , age for customers aged 30 or older, sorted oldest first
SELECT first_name, city,age 
FROM customers
WHERE age >= 30
ORDER BY age DESC;


-- find customers who live in Dallas and are older than 25
SELECT *
FROM customers
WHERE city = 'Dallas' AND age > 25;






