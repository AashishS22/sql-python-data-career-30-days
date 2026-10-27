
-- Day 14: String Functions & Data Cleaning
-- Sep 20, 2026

--Today we’ll cover the string operations that show up constantly in analytics, cleaning, and LeetCode:
-- UPPER() / LOWER()
-- TRIM()
-- LENGTH()
-- CONCAT()
-- SUBSTRING()
-- fixing capitalization
-- pattern matching review
-- simple cleaning tasks

--UPPER() and LOWER()
SELECT 
	first_name,
	upper(first_name) AS upper_name,
	lower(first_name) AS lower_name
FROM customers;


-- TRIM()
--This removes the text from the begining and end of the text
SELECT TRIM('  Ram  ');

-- LENGTH()
SELECT
	LENGTH(first_name)
FROM customers;


-- CONCAT()
-- This helps to combine strings
SELECT 
	concat(first_name, ' ', last_name) AS full_name
FROM customers;

-- REPLACE()
--Replaces the occurence of a substring within a string with another substring
SELECT
	replace('Hello world', 'world','PEOPLE') AS Update_subStr;

-- SUBSTRING()/SUBSTR()
-- Used to extract a substring from a string, starting from a specified position.
SELECT 
	substr('Hello World',1,5)AS str;

-- LEFT() and RIGHT()
-- Allows you to extract a specified number of characters from left or right side of a string. It is used for truncating string for display.
SELECT LEFT ('Hello world', 9) AS leftString;



--Exercises
--1. Using customers , return first_name,last_name,full_name
SELECT
	first_name,
	last_name,
	concat(first_name,' ', last_name) AS full_name
FROM customers;

--2. 
SELECT 
	first_name,
	upper(first_name)AS upper_name,
	lower(first_name) AS lower_name
FROM customers;

--3.
SELECT 
	city,
	trim(city) AS clean_city
FROM customers;

--4. 
SELECT 	
	first_name,
	length(first_name) AS name_length
FROM customers;

--5.
SELECT
	first_name,
	substr(first_name, 1,3) AS first_3_letters
FROM customers;

--6. 
SELECT 
	first_name,
	concat (
	upper(substr(first_name,1,1)),
	lower(substr(first_name, 2))
	) AS clean_name
FROM customers;

--7. Clean and compare
SELECT 
	first_name,
	city,
	trim(city) AS clean_city
FROM customers
WHERE trim(city) = 'Dallas';


--8. extra spaces & inconsistent capitilization
SELECT 
	first_name,
	city,
	lower(trim(city)) AS clean_city
FROM customers 
WHERE lower(trim(city)) = 'dallas';

--9. Email/Text Pattern Cleaning

SELECT
	first_name,
	email,
	split_part(email, '@', 2) AS email_domain
FROM customers;




--
SELECT
	first_name,
	substr(first_name, 1, 2) AS short_name
FROM customers;

SELECT 
	first_name,
	city,
	lower(trim(city)) AS clean_city
FROM customers;

SELECT 
	first_name,
	concat (
	upper(substr(first_name,1,1)),
	lower(substr(first_name,2))
	) AS clean_name
FROM customers;
