-- Самостоятельная работа: CASE_WHEN

----------- Задание 1. Анализ товаров по ценовым категориям -----------
SELECT
	CASE
		WHEN price < 2000 THEN 'Low'
		WHEN price <= 5000 THEN 'Medium'
		ELSE 'High'
	END AS price_category,
	COUNT(*) AS products_qty
FROM products
GROUP BY price_category;


----------- Задание 2. Анализ заказов по скидкам -----------
SELECT
	CASE
		WHEN discount = 0 THEN 'No discount'
		WHEN discount BETWEEN 0.01 AND 10 THEN 'Low'
		ELSE 'High'
	END AS discount_category,
	COUNT(*) AS orders_qty,
	ROUND(AVG(discount)) AS avg_discount,
	MAX(discount) AS max_discount
FROM orders
GROUP BY discount_category;


----------- Задание 3. Анализ статусов заказов -----------
SELECT
	CASE
		WHEN status IN ('completed', 'shipped') THEN 'Successful'
		WHEN status = 'processing' THEN 'In Progress'
		ELSE 'Cancelled'
	END AS status_group,
	COUNT(*) AS orders_qty,
	AVG(discount) AS avg_discount
FROM orders
GROUP BY status_group;


----------- Задание 4. Анализ товаров по ценовым сегментам -----------
SELECT
	CASE
		WHEN price < 1500 THEN 'Budget'
		WHEN price <= 7000 THEN 'Standard'
		ELSE 'Premium'
	END AS price_segment,
	COUNT(*) AS products_qty,
	ROUND(AVG(price), 2) AS avg_price,
	MIN(price) AS min_price,
	MAX(price) AS max_price
FROM products
GROUP BY price_segment
ORDER BY avg_price;


----------- Задание 5. Анализ выручки по ценовым категориям -----------
SELECT
	CASE
		WHEN p.price < 2000 THEN 'Budget'
		WHEN p.price <= 6000 THEN 'Medium'
		ELSE 'Premium'
	END AS price_category,
	SUM(oi.quantity) AS units_sold,
	SUM(oi.quantity * oi.unit_price) AS revenue,
	ROUND(AVG(oi.unit_price), 2) AS avg_sale_price
FROM products AS p
INNER JOIN order_items AS oi
	ON oi.product_id = p.product_id
GROUP BY price_category;


----------- Задание 6. Сравнение заказов по скидкам и статусам -----------
SELECT
	CASE
		WHEN discount = 0 THEN 'No discount'
		ELSE 'With discount'
	END AS discount_category,
	status,
	COUNT(*) AS orders_qty,
	ROUND(AVG(discount), 2) AS avg_discount
FROM orders
GROUP BY discount_category, status;


----------- Задание 7. Комплексный анализ продаж по категориям товаров -----------
SELECT
	c.category_name,
	CASE
		WHEN oi.unit_price < 2000 THEN 'Budget'
		WHEN oi.unit_price <= 7000 THEN 'Standard'
		ELSE 'Premium'
	END AS price_segment,
	SUM(oi.quantity) AS units_sold,
	SUM(oi.quantity * oi.unit_price) AS revenue,
	ROUND(AVG(oi.unit_price), 2) AS avg_sale_price
FROM categories AS c
INNER JOIN products AS p
	ON p.category_id = c.category_id
INNER JOIN order_items AS oi
	ON oi.product_id = p.product_id
GROUP BY c.category_id, c.category_name, price_segment
ORDER BY revenue DESC;
