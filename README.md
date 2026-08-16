# Music-Store-Data-Analysis
A MySQL-based Music Store Data Analysis project demonstrating Easy, Moderate, and Advanced SQL queries, including JOINs, aggregations, subqueries, CTEs, and window functions.
# 🎵 Music Store Data Analysis

## 📌 Project Overview

This project analyzes a Music Store database using **SQL and MySQL**.

The project contains SQL queries ranging from **basic data retrieval to advanced data analysis**. It demonstrates how SQL can be used to analyze customers, invoices, tracks, artists, albums, and genres.

The queries are organized into three levels:

- 🟢 **Easy** – Basic data retrieval and filtering
- 🟡 **Moderate** – Aggregations, JOINs, GROUP BY, and HAVING
- 🔴 **Advanced** – Subqueries, CTEs, Window Functions, and ranking

---

## 🎯 Objectives

The main objectives of this project are:

- Analyze customer purchasing behavior
- Analyze music genres and tracks
- Identify popular artists and songs
- Calculate customer spending
- Analyze sales data
- Practice SQL JOINs and aggregations
- Use subqueries and CTEs
- Apply Window Functions for ranking
- Extract useful insights from the database

---

## 🗄️ Database Schema

The database contains the following tables:

```text
music_store
│
├── customer
├── invoice
├── invoice_line
├── track
├── album2
├── artist
└── genre

#TABLE REALTIONSHIP
Customer
    │
    │ customer_id
    ▼
Invoice
    │
    │ invoice_id
    ▼
Invoice_Line
    │
    │ track_id
    ▼
Track
    │
    ├──────────────► Genre
    │
    │ album_id

📊 Database Tables
Customer

Stores customer information.

Column	Description
customer_id	Unique customer ID
first_name	Customer first name
last_name	Customer last name
email	Customer email
    ▼
Album
    │
    │ artist_id
    ▼
Artist

Invoice

Stores purchase/invoice information.

Column	Description
invoice_id	Unique invoice ID
customer_id	Customer reference
invoice_date	Date of purchase
total	Invoice total
