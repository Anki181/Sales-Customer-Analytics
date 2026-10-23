
-- ==================================================
-- PROJECT: Sales and Customer Analytics Dashboard
-- FILE: 05_customer_analysis.sql
-- ==================================================

-- 1. Verify customer transaction data

SELECT
    COUNT(*) AS customer_transaction_rows,
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM customer_transactions;


-- 2. Top 10 customers by gross positive spending

SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_spent
FROM customer_transactions
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;
