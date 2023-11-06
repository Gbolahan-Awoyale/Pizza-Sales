SELECT*
FROM pizza_sales;

--Total Revenue
SELECT CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue
from pizza_sales;

 

--Average order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

 

--Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales

 

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales

 

--Average pizza Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizza_Order
FROM pizza_sales;

 

--Average pizza Per Order in decimal
SELECT CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS Avg_Pizza_Per_Order
FROM pizza_sales

 

--Average pizza Per Order in decimal (cast entire ratio)
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2))  AS Avg_Pizza_Per_Order
FROM pizza_sales;

 

--POWER BI CHART REQUIRED

--Daily Trend for Total Order
SELECT DATENAME(DW, order_date) AS order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_orders DESC;

 

--Monthly Trend for Total Order
SELECT DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC;

 

--Percentage of Sales by Pizza Category
SELECT pizza_category,
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_category;

 

--Percentage of Sales by Pizza Category and Total Sales Column
SELECT pizza_category, SUM(total_price) AS Total_Sales, 
 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_category;

 

--Percentage of Sales by Pizza Category and Total Sales Column (filter by month that is Where Clause)
SELECT pizza_category, SUM(total_price) AS Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS Total_Sales_Percentage
FROM pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

 




--Percentage of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) AS Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY Total_Sales_Percentage DESC;

 

----Percentage of Sales by Pizza Size(ROUND TO 2 DECIMAL PLACE)
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY Total_Sales_Percentage DESC;
 

------Percentage of Sales by Pizza Size(FILTER BY QUARTER)
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(quarter, order_date)=1) AS DECIMAL (10,2)) AS Total_Sales_Percentage
FROM pizza_sales
WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size
ORDER BY Total_Sales_Percentage DESC;

 

--Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC 

 

--Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name,
CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

 



-- Top 5 Pizzas by quantity

SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

 

-- Bottom 5 Pizzas by quantity
SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

 

--Top 5 pizzas by total order

SELECT TOP 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC

 









