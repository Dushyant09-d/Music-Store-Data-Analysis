USE music_store;

-- Q1: Count customers by country
SELECT 
    country,
    COUNT(*) AS CustomerCount
FROM customer
GROUP BY country;

-- Q2: Find total sales
SELECT 
    SUM(total) AS TotalSales
FROM invoice;

-- Q3: Find average invoice amount
SELECT 
    AVG(total) AS AverageInvoice
FROM invoice;

-- Q4: Find maximum invoice amount
SELECT 
    MAX(total) AS HighestInvoice
FROM invoice;

-- Q5: Find total spending of each customer
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
ORDER BY TotalSpent DESC;

-- Q6: Find top 3 customers by spending
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
ORDER BY TotalSpent DESC
LIMIT 3;

-- Q7: Find number of tracks sold
SELECT 
    SUM(quantity) AS TotalTracksSold
FROM invoice_line;

-- Q8: Find the most purchased tracks
SELECT 
    t.name AS TrackName,
    SUM(il.quantity) AS QuantitySold
FROM track t
JOIN invoice_line il
    ON t.track_id = il.track_id
GROUP BY 
    t.track_id,
    t.name
ORDER BY QuantitySold DESC;

-- Q9: Count tracks in each genre
SELECT 
    g.name AS Genre,
    COUNT(t.track_id) AS TrackCount
FROM genre g
JOIN track t
    ON g.genre_id = t.genre_id
GROUP BY 
    g.genre_id,
    g.name
ORDER BY TrackCount DESC;

-- Q10: Find the top 10 Rock artists
SELECT 
    a.artist_id,
    a.name AS ArtistName,
    COUNT(t.track_id) AS NumberOfSongs
FROM track t
JOIN album2 al
    ON al.album_id = t.album_id
JOIN artist a
    ON a.artist_id = al.artist_id
JOIN genre g
    ON g.genre_id = t.genre_id
WHERE g.name = 'Rock'
GROUP BY 
    a.artist_id,
    a.name
ORDER BY NumberOfSongs DESC
LIMIT 10;
