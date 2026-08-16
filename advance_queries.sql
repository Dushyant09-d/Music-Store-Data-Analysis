USE music_store;

-- Q1: Find tracks longer than average
SELECT 
    name AS TrackName,
    milliseconds AS SongLength
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM track
)
ORDER BY milliseconds DESC;

-- Q2: Rank customers by spending
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS TotalSpent
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY 
        c.customer_id,
        c.first_name,
        c.last_name
)
SELECT *,
       RANK() OVER (
           ORDER BY TotalSpent DESC
       ) AS SpendingRank
FROM customer_sales;

-- Q3: Find second-highest spending customer
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS TotalSpent
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY 
        c.customer_id,
        c.first_name,
        c.last_name
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (
               ORDER BY TotalSpent DESC
           ) AS rnk
    FROM customer_sales
)
SELECT *
FROM ranked
WHERE rnk = 2;

-- Q4: Find customers spending above average
WITH customer_sales AS (
    SELECT 
        customer_id,
        SUM(total) AS TotalSpent
    FROM invoice
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE TotalSpent > (
    SELECT AVG(TotalSpent)
    FROM customer_sales
);

-- Q5: Find percentage contribution of each customer
WITH customer_sales AS (
    SELECT 
        customer_id,
        SUM(total) AS TotalSpent
    FROM invoice
    GROUP BY customer_id
)
SELECT 
    customer_id,
    TotalSpent,
    ROUND(
        TotalSpent * 100.0 /
        SUM(TotalSpent) OVER(),
        2
    ) AS SalesPercentage
FROM customer_sales
ORDER BY TotalSpent DESC;
