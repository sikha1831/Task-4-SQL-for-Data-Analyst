 CREATE DATABASE ECOMMERCE_DB;
 USE ECOMMERCE_DB;
 
CREATE TABLE ecommerce_raw (
  customer_id VARCHAR(50),
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  gender VARCHAR(20),
  age_group VARCHAR(50),
  signup_date DATE,
  country VARCHAR(100),
  product_id VARCHAR(50),
  product_name VARCHAR(255),
  category VARCHAR(100),
  quantity INT,
  unit_price DECIMAL(10,2),
  order_id VARCHAR(50),
  order_date DATE,
  order_status VARCHAR(50),
  payment_method VARCHAR(100),
  rating INT,
  review_text TEXT,
  review_id VARCHAR(50),
  review_date DATE
);
 
select count(*) from ecommerce_db.ecommerce_raw;
 select * from ecommerce_db.ecommerce_raw;

-- Top products by TOTAL  REVENUE;
select
order_id,
sum(quantity * unit_price) AS TOTAL_REVENUE
FROM ecommerce_db.ecommerce_raw
group by order_id;
 
-- Revenue by Country

SELECT 
    country,
    SUM(quantity * unit_price) AS revenue
FROM  ecommerce_db.ecommerce_raw
GROUP BY country
ORDER BY revenue DESC
LIMIT 10;

-- Customer Count by Age Group

SELECT 
    age_group,
    COUNT(DISTINCT customer_id) AS total_customers
FROM   ecommerce_db.ecommerce_raw
GROUP BY age_group;

--   Top 5 Selling Products

SELECT 
    product_name,
    SUM(quantity) AS total_sold
FROM  ecommerce_db.ecommerce_raw
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 10;

--  Average Rating by Product Category
SELECT 
    category,
    ROUND(AVG(rating), 2) AS avg_rating
FROM ecommerce_db.ecommerce_raw
GROUP BY category
ORDER BY avg_rating DESC;

-- Payment Method Usage
SELECT 
    payment_method,
    COUNT(order_id) AS total_orders
FROM ecommerce_db.ecommerce_raw
GROUP BY payment_method
ORDER BY total_orders DESC;

-- Order Status Summary

SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce_db.ecommerce_raw
GROUP BY order_status;


--  Top Customers by Spending

SELECT 
    customer_id,
    first_name,
    last_name,
    SUM(quantity * unit_price) AS total_spent
FROM ecommerce_db.ecommerce_raw
GROUP BY customer_id, first_name, last_name
ORDER BY total_spent DESC
LIMIT 10;

