
-- Day 13: Date and Time Function
-- Sep 19, 2026

--Today we’ll focus on the date skills that show up constantly in analytics and SQL interviews:
	-- extracting year/month/day
	-- filtering by date ranges
	-- calculating date differences
	-- grouping by month
	-- working with “last 30 days”
	-- a couple of SQL 50 problems that use dates


--Extracting year/month/day

SELECT 
	order_id,
	order_date,
	CAST(EXTRACT(YEAR FROM order_date) AS integer) AS order_year,
	EXTRACT(MONTH FROM order_date) AS order_month,
	EXTRACT(DAY FROM order_date) AS order_day
FROM orders;

--

SELECT 
	order_id,
	order_date,
	amount
FROM orders 
WHERE 
EXTRACT(YEAR FROM order_date) = 2026
AND EXTRACT(MONTH FROM order_date) = 9;
	
--
SELECT 
	order_id,
	order_date,
	amount
FROM orders 
WHERE order_date BETWEEN '2026-09-02' AND '2026-09-06';

-- Date Difference
SELECT
	 order_id,
	 order_date,
	order_date - DATE '2026-09-01' AS days_since_first_order
FROM orders;

--
SELECT 
	order_id,
	order_date,
	order_date - (
		SELECT 
			min(order_date)
		FROM orders) AS days_since_first_order
FROM orders;

--
SELECT
	extract(YEAR FROM order_date) AS order_year,
	extract(MONTH FROM order_date) AS order_month,
	count(*)AS total_orders,
	sum(amount) AS total_revenue
FROM orders
GROUP BY order_year, order_month
HAVING 	sum(amount) > 200;

--Recent 30 Days
SELECT
	order_id,
	order_date,
	amount
FROM orders 
WHERE order_date >= (
	SELECT 
		max(order_date)
	FROM orders) - INTERVAL '30 days';

--This combines three concepts nicely:
-- MAX(order_date) → find the latest date
-- subquery → use that date dynamically
-- INTERVAL '30 days' → move 30 days backward

--CURRENT_DATE
SELECT 
	order_id,
	order_date,
	amount
FROM orders
WHERE order_date >= current_date - INTERVAL '30 days';

--
SELECT
	order_date,
	count(*) AS total_orders,
	sum(amount) AS total_revenue
FROM orders 
GROUP BY order_date
ORDER BY order_date ASC;
