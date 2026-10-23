
-- ==================================================
-- PROJECT: Sales and Customer Analytics Dashboard
-- FILE: 04_country_sales.sql
-- ==================================================

-- OBJECTIVE:
-- Analyse gross positive sales by country,
-- including order counts and sales contribution.

-- 1. SALES VALUE BY COUNTRY

SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_sales,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM sales_transactions
GROUP BY Country
ORDER BY total_sales DESC;


-- 2. TOP 10 COUNTRIES BY SALES VALUE

SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_sales,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM sales_transactions
GROUP BY Country
ORDER BY total_sales DESC
LIMIT 10;


-- 3. COUNTRY CONTRIBUTION TO TOTAL SALES

SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_sales,
    ROUND(
        100.0 * SUM(Revenue) /
        (SELECT SUM(Revenue)
         FROM sales_transactions),
        2
    ) AS sales_percentage
FROM sales_transactions
GROUP BY Country
ORDER BY sales_percentage DESC;
