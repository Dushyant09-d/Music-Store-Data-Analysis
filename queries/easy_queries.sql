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

-- Q4: Find total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM customer;
