
-- Day 12 : CASE WHEN
-- Sep 18, 2026

-- CASE WHEN lets SQL creates logic like:
-- if condition -> return this
-- Else if condtition -> return that
-- Else condition -> return something else

CASE 
	WHEN conditions THEN result
	WHEN conditions THEN RESULT
	ELSE result
END

--Ex
SELECT
 	first_name,
 	age,
 	CASE 
 		WHEN age < 25 THEN 'Young'
 		WHEN age <= 35 THEN 'Adult'
 		ELSE 'Older'
 	END
 FROM customers;


--simple binary category
SELECT 
	first_name,
	age,
	CASE 
		WHEN age >= 30 THEN '30 or Older'
		ELSE 'Under 30'
	END AS age_category
FROM customers;

--CASE NULL
--You can also handle missing values with case
SELECT 
	first_name,
	email,
	CASE 
		WHEN email IS NULL THEN 'Missing Email'
		ELSE 'Email Available'
	END AS email_status
FROM customers;
	

--Exercises-
--1. Using customers, return first_name, age, age_group
	--age < 25        → 'Young'
	--age 25 to 34    → 'Adult'
	--age >= 35       → 'Senior'
	--age IS NULL     → 'Unknown'

SELECT
	first_name,
	age,
	CASE 
		WHEN age < 25 THEN 'Young'
		WHEN age BETWEEN 25 and 34 THEN 'Adult'
		WHEN age >= 35 THEN 'Senior'
		ELSE 'Unknown'
	END AS age_group
FROM customers;
	
--2. Using orders, return: order_id, amount, order_size, classify
	--amount < 75       → 'Small'
	--75 to 149.99      → 'Medium'
	--150 or more       → 'Large'
SELECT
	order_id,
	amount,
	CASE 
		WHEN amount < 75 THEN 'Small'
		WHEN amount BETWEEN 75 AND 149.99 THEN 'Medium'
		ELSE 'Large'
	END AS order_size
FROM orders;
	
--3. CASE with aggregation; counts how many orders fall in each category
SELECT
    SUM(
        CASE
            WHEN amount < 75 THEN 1
            ELSE 0
        END
    ) AS small_orders,
    SUM(
        CASE
            WHEN amount BETWEEN 75 AND 149.99 THEN 1
            ELSE 0
        END
    ) AS medium_orders,
    SUM(
        CASE
            WHEN amount >= 150 THEN 1
            ELSE 0
        END
    ) AS large_orders
FROM orders;


-- 4. Calculate the total dollar amount for each category
SELECT 
	sum(
	CASE
		WHEN amount < 75 THEN amount
		ELSE 0
	END
	) AS small_revenue,
	sum(
	CASE 
		WHEN amount BETWEEN 75 AND 149.99 THEN amount
		ELSE 0
	END
	) AS medium_revenue,
	sum(
	CASE 
		WHEN amount >= 150 THEN amount
		ELSE 0
	END 
	) AS large_revenue
FROM orders;


--5. CASE WHEN with Group BY
SELECT 
	city,
	count(*)AS total_cutomers,
	sum(
		CASE 
			WHEN age >=30 THEN 1
			ELSE 0
		END
		) AS customer_30_plus,
	sum(
		CASE
			WHEN age < 30 THEN 1
			ELSE 0
		END
		) AS customer_under_30
FROM customers
WHERE city IS NOT NULL 
GROUP BY city;

