-- Exploratory Analysis

--total revenue
SELECT 
    SUM(Amount) AS total_revenue
FROM asr
WHERE Status IS NOT 'Cancelled';

--total orders
SELECT
    COUNT(DISTINCT [Order ID]) AS total_orders
FROM asr;

--average order value 
SELECT 
    ROUND(
        SUM(Amount) / COUNT(DISTINCT [Order ID]),
        2
    ) AS average_order_value
FROM asr
WHERE Status <> 'Cancelled';

--best-selling products
SELECT
    ASIN,
    SUM(Qty) AS total_units_sold
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY ASIN
ORDER BY total_units_sold DESC;

--order-status-rate
SELECT 
	COUNT(Status)
FROM asr;

SELECT
    COUNT(Status)
FROM asr
WHERE Status = 'Cancelled';

SELECT
    COUNT(Status)
FROM asr
WHERE Status <> 'Cancelled';

--sales by date
SELECT 
	DATE,
	SUM(Amount) as total_sales
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY DATE 
ORDER BY total_sales DESC;

--sales by month
SELECT
    strftime(
        '%Y-%m',
        '20' || substr(Date, 7, 2) || '-' ||
        substr(Date, 1, 2) || '-' ||
        substr(Date, 4, 2)
    ) AS month,
    ROUND(SUM(Amount), 2) AS total_sales
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY month
ORDER BY month;

--cancellation rate
SELECT
    ROUND(
        SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS cancellation_rate
FROM asr;

--revenue and units_sold by category
SELECT
    Category,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY Category
ORDER BY total_revenue DESC;

--top products by revenue
SELECT
    ASIN,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY ASIN
ORDER BY total_revenue DESC
LIMIT 10;

--sales by fulfillment method
SELECT
    Fulfilment,
    COUNT(DISTINCT [Order ID]) AS total_orders,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY Fulfilment
ORDER BY total_revenue DESC;

--sales by state
SELECT
    [ship-state],
    COUNT(DISTINCT [Order ID]) AS total_orders,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY [ship-state]
ORDER BY total_revenue DESC;

--top cities by revenue
SELECT
    [ship-city],
    COUNT(DISTINCT [Order ID]) AS total_orders,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY [ship-city]
ORDER BY total_revenue DESC
LIMIT 10;

--promotion analysis
SELECT
    CASE
        WHEN [promotion-ids] = 'No Promotion'
        THEN 'No Promotion'
        ELSE 'Promotion Used'
    END AS promotion_status,

    COUNT(DISTINCT [Order ID]) AS total_orders,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue,

    ROUND(
        SUM(Amount) / COUNT(DISTINCT [Order ID]),
        2
    ) AS average_order_value

FROM asr
WHERE Status <> 'Cancelled'

GROUP BY promotion_status
ORDER BY total_revenue DESC;

--B2B vs non-B2B
SELECT
    B2B,
    COUNT(DISTINCT [Order ID]) AS total_orders,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY B2B
ORDER BY total_revenue DESC;

--monthly orders + revenue + units sold
SELECT
    strftime(
        '%Y-%m',
        '20' || substr(Date, 7, 2) || '-' ||
        substr(Date, 1, 2) || '-' ||
        substr(Date, 4, 2)
    ) AS month,

    COUNT(DISTINCT [Order ID]) AS total_orders,
    SUM(Qty) AS units_sold,
    ROUND(SUM(Amount), 2) AS total_revenue

FROM asr
WHERE Status <> 'Cancelled'

GROUP BY month
ORDER BY month;