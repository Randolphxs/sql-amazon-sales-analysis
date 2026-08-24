-- Product Analysis


--best-selling products
SELECT 
    SKU AS product,
    SUM(Qty) AS units_sold
FROM asr
WHERE status <> 'Cancelled'
GROUP BY SKU
ORDER BY units_sold DESC
LIMIT 10;

--worst-selling products
SELECT 
    Category,
    SUM(Qty) AS units_sold,
    SUM(Amount) AS revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY Category
ORDER BY 2 DESC;

--category performance by both units_sold and revenue
SELECT 
    Category,
    SUM(Qty) AS units_sold,
    SUM(Amount) AS revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY Category
ORDER BY revenue DESC;

--average selling price by category
SELECT 
    Category,
    AVG(Amount / NULLIF(Qty, 0)) AS avg_unit_price
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY Category
ORDER BY avg_unit_price DESC;


--products generating the most revenue
SELECT 
    SKU AS product,
    SUM(Amount) AS revenue
FROM asr
WHERE Status <> 'Cancelled'
GROUP BY SKU
ORDER BY revenue DESC
LIMIT 10;