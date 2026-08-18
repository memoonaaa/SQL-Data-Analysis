-- Project 3: SQL Data Analysis
-- Dataset: E-commerce Sales Dataset
-- Total Records: 1200

-- 1. Which are the 10 highest-value delivered orders?
SELECT order_id, customer_id,order_status, total_price 
from sales
WHERE order_status= 'Delivered'
ORDER BY total_price DESC
LIMIT 10;

--2. Which products have the highest total revenue?
SELECT product,SUM(total_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

--3. Which products have the highest average order value?
SELECT product,AVG(total_price) AS avg_order_value
FROM sales
GROUP BY product
ORDER BY avg_order_value DESC;  

--4. Which order statuses generate the most revenue, and how many orders does each status have?
SELECT order_status, SUM(total_price) AS total_revenue, COUNT(order_id) AS order_count
FROM sales
GROUP BY order_status
ORDER BY total_revenue DESC;

--5. Which referral sources bring in the highest-value orders on average?
SELECT referral_source, AVG(total_price) AS avg_order_value
FROM sales
GROUP BY referral_source
ORDER BY avg_order_value DESC;

--6. How does order value vary across different coupon codes?
SELECT coupon_code, COUNT(order_id) AS order_count,AVG(total_price) AS avg_order_value
FROM sales
GROUP BY coupon_code;

--7. Which payment methods generate the most revenue, and how many orders are made through each method?
SELECT payment_method,COUNT(order_id) AS order_count, SUM(total_price) AS total_revenue
FROM sales
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 8. Which products have the highest total quantity sold, and how much revenue did they generate?
SELECT product,SUM(Quantity) AS quantity_sold,SUM(total_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY quantity_sold DESC;
