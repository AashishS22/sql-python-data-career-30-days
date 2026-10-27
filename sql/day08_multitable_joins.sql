
-- Day 8 : JOIN revision -> tiny SELF JOIN refresher -> 3-table join
-- Sep 14, 2026


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



--1. Once you've created order_items, write a query that shows: customer first name, order_id, product_name, quantity, unit_price.
-- We'll need to connect: customers -> orders -> order_items

SELECT 
	c.first_name,
	o.order_id,
	i.product_name,
	i.quantity,
	i.unit_price
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id;
	

--2. customer first_name, order_id, product_name, quantity, unit_price, item_total ; item_total = quantity * unit_price

SELECT 
	c.first_name,
	o.order_id,
	i.product_name,
	i.quantity,
	i.unit_price,
	(i.quantity * i.unit_price) AS item_total
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id;
	
--3. Show each customer's total value of all purchased items. Return: customer_id, first_name, total spent

SELECT 
	c.customer_id,
	c.first_name,
	sum(i.quantity * i.unit_price) AS total_spent
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name ;


--4. Show all customers, including customers who bought nothing, with: customer_id, first_name, total_spent. Customers with no purchases should show: 0

SELECT 
	c.customer_id,
	c.first_name,
	COALESCE(sum(i.quantity * i.unit_price), 0)AS total_spent
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id 
LEFT JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name ;

--5. Now show only customers whose total purchased value is greater than $100.

SELECT 
	c.customer_id,
	c.first_name,
	sum(i.quantity * i.unit_price)AS total_spent
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name
HAVING sum(i.quantity * i.unit_price) > 100;


--6. Show the number of different products/items purchased by each customer. Return customer_id, first_name, total_items
SELECT 
	c.customer_id,
	c.first_name,
	count(i.item_id) AS total_items
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name;

--7. Now distinguish number of item rows from actual quantity purchased. Show, for each customer: customer_id, first_name, total_quantity_purchased.
 
SELECT 
	c.customer_id,
	c.first_name,
	sum(i.quantity) AS total_quantity_purchased
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name;

--8. Now show the customer who purchased the highest total quantity of units. Return: customer_id, first_name, total_quantity_purchased.

SELECT 
	c.customer_id,
	c.first_name,
	sum(i.quantity) AS total_quantity_purchased
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id 
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_quantity_purchased DESC
LIMIT 1;


--9. Show each product and total quantity sold. Return: product_name, total_quantity_sold.

SELECT
	i.product_name,
	sum(i.quantity) AS total_quantity_sold
FROM order_items i
GROUP BY i.product_name;


--10. Now show the total revenue generated by each product. Return product_name, total_revenue

SELECT
	i.product_name,
	sum(i.quantity * i.unit_price ) AS total_revenue
FROM order_items i
GROUP BY i.product_name;


--11. Mixed challenge: show customers who: have purchased at least 2 items rows and have spent more than $100 total. Return customer_id, first_name, total_items, total_spent.
SELECT
	c.customer_id,
	c.first_name,
	count(i.item_id) AS total_items,
	sum(i.quantity * i.unit_price ) AS total_spent
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id  
INNER JOIN order_items i
	ON o.order_id = i.order_id
GROUP BY c.customer_id , c.first_name
HAVING count(i.item_id) >= 2 
	AND sum(i.quantity * i.unit_price ) > 100;
























