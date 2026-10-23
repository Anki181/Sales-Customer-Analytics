
-- PROJECT: Sales and Customer Analytics Dashboard
-- FILE: 03_top_products.sql

-- 1. Top 10 products by gross positive sales value

SELECT
    StockCode,
    Description,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Revenue), 2) AS total_sales
FROM sales_transactions
GROUP BY StockCode, Description
ORDER BY total_sales DESC
LIMIT 10;


-- 2. Top 10 products by quantity sold

SELECT
    StockCode,
    Description,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Revenue), 2) AS total_sales
FROM sales_transactions
GROUP BY StockCode, Description
ORDER BY total_units_sold DESC
LIMIT 10;


-- 3. Top 10 merchandise products by sales value
-- Exclude common non-product stock codes.
-- This is an initial exclusion list, not a
-- complete merchandise classification.

SELECT
    StockCode,
    Description,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Revenue), 2) AS total_sales
FROM sales_transactions
WHERE StockCode NOT IN (
    'DOT',
    'POST',
    'M',
    'D',
    'C2',
    'BANK CHARGES',
    'AMAZONFEE',
    'CRUK',
    'S',
    'PADS'
)
GROUP BY StockCode, Description
ORDER BY total_sales DESC
LIMIT 10;
