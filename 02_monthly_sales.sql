
-- =====================================================
-- PROJECT: Sales and Customer Analytics Dashboard
-- FILE: 02_monthly_sales.sql
-- DATASET: UCI Online Retail
-- =====================================================

-- OBJECTIVE:
-- Analyse monthly gross positive sales and order volume
-- to identify trends and seasonal purchasing patterns.

-- DATA NOTES:
-- Includes positive sales transactions only.
-- Returns and cancellations are excluded.
-- Exact duplicate rows are currently retained.
-- December 2010 and December 2011 are partial months.


-- 1. MONTHLY SALES AND ORDER COUNT

SELECT
    YearMonth,
    ROUND(SUM(Revenue), 2) AS monthly_sales,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM sales_transactions
GROUP BY YearMonth
ORDER BY YearMonth;


-- 2. HIGHEST SALES MONTH

SELECT
    YearMonth,
    ROUND(SUM(Revenue), 2) AS monthly_sales
FROM sales_transactions
GROUP BY YearMonth
ORDER BY monthly_sales DESC
LIMIT 1;


-- 3. LOWEST SALES MONTH

SELECT
    YearMonth,
    ROUND(SUM(Revenue), 2) AS monthly_sales
FROM sales_transactions
GROUP BY YearMonth
ORDER BY monthly_sales ASC
LIMIT 1;

