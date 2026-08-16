USE music_store;
USE music_store;

-- Q1: Display all customers
SELECT *
FROM customer;

-- Q2: Display customer names and emails
SELECT 
    first_name,
    last_name,
    email
FROM customer;

-- Q3: Display all unique genres
SELECT DISTINCT name
FROM genre;

-- Q4: Display all tracks
SELECT *
FROM track;

-- Q5: Find total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM customer;

-- Q6: Find total number of tracks
SELECT COUNT(*) AS TotalTracks
FROM track;

-- Q7: Find the average song length
SELECT 
    AVG(milliseconds) AS AverageSongLength
FROM track;

-- Q8: Find the longest song
SELECT 
    name AS TrackName,
    milliseconds AS SongLength
FROM track
ORDER BY milliseconds DESC
LIMIT 1;

-- Q9: Find the shortest song
SELECT 
    name AS TrackName,
    milliseconds AS SongLength
FROM track
ORDER BY milliseconds ASC
LIMIT 1;

-- Q10: Find tracks longer than 500000 milliseconds
SELECT 
    name AS TrackName,
    milliseconds AS SongLength
FROM track
WHERE milliseconds > 500000;