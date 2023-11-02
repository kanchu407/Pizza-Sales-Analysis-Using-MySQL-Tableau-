use pizza_sales;
select * from pizza_sales;
-- A. KPI
-- 1. Total Revenue
SELECT 
	SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- 2. Average Order Value
SELECT 
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT 
	SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;

-- 4. Total Orders
SELECT 
	COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales;

-- 5. Average Pizzas Per Order
SELECT 
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

-- B. Hourly Trend For Total Orders
SELECT 
	hour(order_time) as order_hours, 
    SUM(quantity) as total_pizzas_sold
from pizza_sales
group by order_hours
order by order_hours;

-- C. % of Sales by Pizza Category
SELECT
	pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- D. % of Sales by Pizza Size
SELECT 
	pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- E. Total Pizzas Sold by Pizza Category
SELECT 
	pizza_category, 
    SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- F. Top 5 Pizzas by Revenue
SELECT
	pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

-- G. Bottom 5 Pizzas by Revenue
SELECT
	pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;

-- H. Top 5 Pizzas by Quantity
SELECT
	pizza_name, 
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC LIMIT 5;

-- I. Bottom 5 Pizzas by Quantity
SELECT
	pizza_name, 
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC LIMIT 5;

-- J. Top 5 Pizzas by Total Orders
SELECT
	pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;

-- K. Bottom 5 Pizzas by Total Orders
SELECT
	pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;

