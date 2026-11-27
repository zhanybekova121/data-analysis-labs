-- Самостоятельная работа. Агрегатные функции

----------- Задание 1. Общая статистика клиентов -----------
SELECT
	COUNT(*) AS customers_qty
FROM customers;


----------- Задание 2. Анализ заказов -----------
SELECT
	COUNT(*) AS orders_qty,
	COUNT(DISTINCT customer_id) AS unique_customers_qty
FROM orders;


----------- Задание 3. Анализ платежей -----------
SELECT
	COUNT(*) AS payments_qty,
	SUM(amount) AS total_amount,
	AVG(amount) AS avg_amount
FROM payments;


----------- Задание 4. Анализ стоимости товаров -----------
SELECT
	MIN(price) AS min_price,
	MAX(price) AS max_price,
	AVG(price) AS avg_price,
	COUNT(*) AS products_qty
FROM products;


----------- Задание 5. Анализ успешных платежей -----------
SELECT
	COUNT(*) AS paid_payments_qty,
	SUM(amount) AS paid_total_amount,
	AVG(amount) AS paid_avg_amount,
	MAX(amount) AS paid_max_amount
FROM payments
WHERE payment_status = 'Paid';


----------- Задание 6. Анализ заказанных товаров -----------
SELECT
	COUNT(*) AS order_items_qty,
	SUM(quantity) AS total_units,
	AVG(quantity) AS avg_units_per_item,
	MAX(quantity) AS max_units_per_item
FROM order_items;


----------- Задание 7. Анализ выручки -----------
SELECT
	SUM(quantity * unit_price) AS total_revenue,
	AVG(quantity * unit_price) AS avg_item_cost,
	MIN(quantity * unit_price) AS min_item_cost,
	MAX(quantity * unit_price) AS max_item_cost
FROM order_items;


----------- Задание 8. Анализ заказов по периоду -----------
SELECT
	COUNT(*) AS orders_qty,
	AVG(quantity) AS avg_quantity,
	MIN(quantity) AS min_quantity,
	MAX(quantity) AS max_quantity
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';
