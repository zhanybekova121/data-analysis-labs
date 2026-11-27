-- Самостоятельная работа. HAVING

----------- Задание 1. Активность клиентов -----------
SELECT
	c.customer_name,
	COUNT(o.order_id) AS orders_qty
FROM customers AS c
INNER JOIN orders AS o
	ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2;


----------- Задание 2. Завершённые заказы клиентов -----------
SELECT
	c.customer_name,
	c.city,
	COUNT(o.order_id) AS completed_orders_qty
FROM customers AS c
INNER JOIN orders AS o
	ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.customer_name, c.city
HAVING COUNT(o.order_id) > 1;


----------- Задание 3. Анализ способов оплаты -----------
SELECT
	payment_method,
	COUNT(*) AS payments_qty,
	SUM(amount) AS total_amount,
	AVG(amount) AS avg_amount
FROM payments
GROUP BY payment_method
HAVING COUNT(*) > 3;


----------- Задание 4. Анализ категорий товаров -----------
SELECT
	c.category_name,
	SUM(oi.quantity) AS units_sold,
	SUM(oi.quantity * oi.unit_price) AS revenue
FROM categories AS c
INNER JOIN products AS p
	ON p.category_id = c.category_id
INNER JOIN order_items AS oi
	ON oi.product_id = p.product_id
GROUP BY c.category_id, c.category_name
HAVING SUM(oi.quantity) > 5;


----------- Задание 5. Анализ скидок -----------
SELECT
	status,
	AVG(discount) AS avg_discount,
	MAX(discount) AS max_discount,
	COUNT(*) AS orders_qty
FROM orders
GROUP BY status
HAVING AVG(discount) > 10;


----------- Задание 6. Анализ клиентской базы по городам -----------
SELECT
	city,
	COUNT(DISTINCT customer_id) AS unique_customers_qty
FROM customers
GROUP BY city
HAVING COUNT(DISTINCT customer_id) > 2;


----------- Задание 7. Анализ выручки по клиентам -----------
SELECT
	c.customer_name,
	COUNT(DISTINCT o.order_id) AS completed_orders_qty,
	SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o
	ON o.customer_id = c.customer_id
INNER JOIN order_items AS oi
	ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
	AND SUM(oi.quantity * oi.unit_price) > 10000
ORDER BY total_revenue DESC;
