CREATE TABLE IF NOT EXISTS pizza (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(255),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price FLOAT,
    total_price FLOAT,
    pizza_size VARCHAR(255),
    pizza_category VARCHAR(255),
    pizza_ingredients VARCHAR(255),
    pizza_name VARCHAR(255)
);

SELECT *
FROM pizza;

SELECT SUM(total_price) AS total_revenue
FROM pizza;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza;

SELECT SUM(quantity) AS total_pizza_sold
FROM pizza ;

SELECT COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza;

SELECT ROUND(ROUND(SUM(quantity),2)/ROUND(COUNT(DISTINCT(order_id)),2),2) AS avg_pizza_per_order
FROM pizza;

SELECT TO_CHAR(order_date, 'Day') AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY TO_CHAR(order_date, 'Day');

SELECT TO_CHAR(order_date, 'Month') AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY total_orders DESC;

SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza WHERE EXTRACT(MONTH FROM order_date) = 1) AS pct
FROM pizza
GROUP BY pizza_category
ORDER BY total_sales DESC;

SELECT pizza_size, SUM(total_price) AS total_sales, SUM(total_price) * 100/
(SELECT SUM(total_price) FROM pizza WHERE EXTRACT(MONTH FROM order_date) = 1) AS pct
FROM pizza
GROUP BY pizza_size
ORDER BY pct DESC;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;