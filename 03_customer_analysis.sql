-- Customer Analysis

--How many unique customers are there?
SELECT
	COUNT(DISTINCT CUSTOMER) as unique_customers
FROM ISR;

--Which customers generate the most revenue? 
SELECT
	CUSTOMER,
	SUM("GROSS AMT") total_revenue
FROM ISR
GROUP BY CUSTOMER
ORDER BY total_revenue DESC
LIMIT 10;

--What is the average spending per customer?
SELECT
    AVG(total_spending) AS avg_spending_per_customer
FROM (
    SELECT
        CUSTOMER,
        SUM("GROSS AMT") AS total_spending
    FROM ISR
    GROUP BY CUSTOMER
);

--What is the average number of orders per customer?
SELECT 
    AVG(total_orders) AS avg_number_of_orders
FROM (
    SELECT
        CUSTOMER,
        COUNT(*) AS total_orders
    FROM ISR
    GROUP BY CUSTOMER
);

--How is revenue distributed across customers?
--Which customers contribute the most to overall revenue, and how concentrated is revenue among customers?
SELECT
    CUSTOMER,
    SUM("GROSS AMT") AS customer_revenue,
    ROUND(
        SUM("GROSS AMT") * 100.0 /
        (SELECT SUM("GROSS AMT") FROM ISR),
        2
    ) AS revenue_percentage
FROM ISR
GROUP BY CUSTOMER
ORDER BY customer_revenue DESC;