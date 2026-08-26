-- Time Analysis

-- Monthly Revenue
--How does revenue change month by month?
SELECT 
    strftime(
        '%Y-%m',
        '20' || substr(DATE, 7, 2) || '-' ||
        substr(DATE, 1, 2) || '-' ||
        substr(DATE, 4, 2)
    ) AS month,
    SUM(Amount) AS revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY month
ORDER BY month;

-- Monthly Units Sold
--How many units were sold each month?
SELECT 
    strftime(
        '%Y-%m',
        '20' || substr(DATE, 7, 2) || '-' ||
        substr(DATE, 1, 2) || '-' ||
        substr(DATE, 4, 2)
    ) AS month,
    SUM(Qty) AS units_sold
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY month
ORDER BY month;

--Monthly Orders
--How many orders were placed each month?
SELECT 
    strftime(
        '%Y-%m',
        '20' || substr(DATE, 7, 2) || '-' ||
        substr(DATE, 1, 2) || '-' ||
        substr(DATE, 4, 2)
    ) AS month,
    COUNT(DISTINCT "ORDER ID") AS orders
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY month
ORDER BY month;

-- Monthly Average Order Value
--How much revenue does the average order generate each month?
SELECT 
    strftime(
        '%Y-%m',
        '20' || substr(DATE, 7, 2) || '-' ||
        substr(DATE, 1, 2) || '-' ||
        substr(DATE, 4, 2)
    ) AS month,
    SUM(Amount) * 1.0 / COUNT(DISTINCT "ORDER ID") AS avg_order_value
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY month
ORDER BY month;