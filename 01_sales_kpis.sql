
-- Project: Sales and Customer Analytics Dashboard
-- Dataset: UCI Online Retail
-- KPI definitions: Gross positive sales, before returns

-- 1. Count transaction lines
SELECT COUNT(*) AS total_sales_rows
FROM sales_transactions;

-- 2. Calculate gross positive sales
SELECT ROUND(SUM(Revenue), 2) AS gross_sales_value
FROM sales_transactions;

-- 3. Count unique orders
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM sales_transactions;

-- 4. Calculate average order value
SELECT
    ROUND(
        SUM(Revenue) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS average_order_value
FROM sales_transactions;
