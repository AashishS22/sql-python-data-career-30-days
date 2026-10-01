
-- Day 15: Window Functions
-- Sep 21, 2026
    -- A window function calculates across related rows without collapsing them.
    -- OVER() : This clause define the window

--Main concepts: 
    --SUM() OVER()
    --PARTITION BY
    --ROW_NUMBER()
    --RANK()
    --DENSE_RANK()
    --running totals
    --LAG()
    --LEAD()
    --top row per group using CTE
    --second-highest value
    --top 3 salaries per department


 
SELECT 
	order_id,
	customer_id,
	amount,
	sum(amount) over() AS total_revenue
FROM orders;

-- PARTITION BY: It divides the data into groups using PARTITION BY
SELECT
	order_id,
	customer_id,
	amount,
	sum(amount) over( PARTITION BY customer_id ) AS customer_total
FROM orders;

--ROW_NUMBER()
SELECT 
	order_id,
	customer_id,
	amount,
	Row_number() over( PARTITION BY customer_id ORDER BY amount desc) AS order_rank
FROM orders;

--
SELECT 
	customer_id,
	order_id,
	amount
FROM (
	SELECT 
		customer_id,
		order_id,
		amount,
		Row_number()  over( 
			PARTITION BY customer_id 
			ORDER BY amount desc) AS order_rank
	FROM orders) as ranked_order
WHERE order_rank = 1;

--using CTE

WITH ordered_ranked AS (
	SELECT 
		customer_id,
		order_id,
		amount,
		ROW_NUMBER() over(
		PARTITION BY customer_id 
		ORDER BY amount desc) AS order_rank
	FROM orders
)
SELECT 
	customer_id,
	order_id,
	amount
FROM ordered_ranked 
WHERE order_rank = 1;


--
SELECT
	customer_id,
	order_id,
	order_date,
	amount,
	sum(amount) over( 
				PARTITION BY customer_id
				order BY order_date) AS running_total
FROM orders;


--
SELECT
	order_id,
	amount,
	row_number() over(ORDER BY amount desc) AS row_num,
	Rank() over(ORDER BY amount desc) AS rank_num,
	dense_rank() OVER(ORDER BY amount desc)AS dense_rank_num
FROM orders;

--


WITH ordered_rank AS (
	SELECT 
		order_id,
		amount,
		DENSE_RANK () over(
		ORDER BY amount desc) AS rank_num
	FROM orders
)
SELECT 
	order_id,
	amount
FROM ordered_rank
WHERE rank_num = 2;




--Using subquery

SELECT
	order_id,
	amount
FROM (
	SELECT 
		order_id,
		amount,
		DENSE_RANK() OVER(ORDER BY amount DESC) AS rank_num
	FROM orders
	)
WHERE rank_num = 2;



--LAG() and LEAD()

SELECT 
	order_id,
	order_date,
	amount,
	LAG(amount) over( ORDER BY order_date) AS previous_amount,
FROM orders;
--

SELECT 
	order_id,
	order_date,
	amount,
	LAG(amount) over( ORDER BY order_date) AS previous_amount,
	amount -  LAG(amount) over( ORDER BY order_date) AS amount_difference
FROM orders;


--
SELECT
	order_id,
	order_date,
	amount,
	Lead(amount) over(ORDER BY order_date) AS next_amount
FROM orders;

--Ex:
--1. Return each order with the total amount spent by that customer while keeping every order row.
SELECT 
	customer_id,
	order_id,
	sum(amount) over( PARTITION BY customer_id ) AS total_spent
FROM orders;

--2. Return each order with a row number where numbering restarts for each customer and the largest order gets 1.

SELECT
	customer_id,
	order_id,
	amount,
	row_number() over(PARTITION BY customer_id ORDER BY amount desc) AS row_num
FROM orders;

--3. Find the highest-value order for each customer using ROW_NUMBER() and a CTE.

WITH ordered_rank AS (
	SELECT 	
		customer_id,
		order_id,
		amount,
		row_number() over(PARTITION BY customer_id ORDER BY amount DESC) AS row_num	
	FROM orders )
SELECT *
FROM ordered_rank 
WHERE row_num = 1;


--4. Rank all order amounts from highest to lowest using DENSE_RANK().
SELECT 
	order_id,
	amount,
	dense_rank() over(ORDER BY amount desc)AS dense_rank_num
FROM orders;


--5. 1. Return: order_id, amount, previous_amount, using LAG().
SELECT
	order_id,
	amount,
	lag(amount) over(ORDER BY order_id) AS prevous_amount
FROM orders;



