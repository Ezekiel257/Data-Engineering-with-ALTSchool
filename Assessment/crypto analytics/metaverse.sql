
-- Create a user called cryptoverse_admin with CREATEDB and CREATEROLE attributes
CREATE ROLE cryptoverse_admin WITH LOGIN CREATEDB CREATEROLE ENCRYPTED PASSWORD 'admin1234';

-- Using the user from the first step, create a database called metaverse

-- login in with new user
psql -U cryptoverse_admin -d postgres

-- create database metaverse
CREATE DATABASE metaverse;

-- Grant all database priviledge to user
GRANT ALL PRIVILEGES ON DATABASE metaverse TO cryptoverse_admin;

-- Create a schema: raw
CREATE SCHEMA raw;

-- Loaded Data into the raw schema using Data import

-- Task 2 - answering business questions
-- 1. How many buy and sell transactions are there for Bitcoin? - your result should 
--  return two columns - txn_type, transaction_count
SELECT txn_type , count(txn_id) AS "transaction_count"
FROM  raw.transactions t
WHERE ticker = 'BTC'
GROUP BY txn_type;

-- 2. For each year, calculate the following buy and sell metrics for bitcoin:
-- a. Total transaction count
-- b. Total quantity
-- c. Average quantity
-- Kindly note that you are generating a single query to calculate these metrics and you should return exactly 5 columns - txn_year, txn_type, txn_count, total_quantity, average_quantity.

SELECT 
		EXTRACT(YEAR FROM txn_date::date) AS txn_year, 
		txn_type , 
		count(txn_id) AS "txn_count",  
		sum(quantity) AS total_quantity, 
		avg(quantity) AS average_quantity 
FROM raw.transactions t 
GROUP BY txn_type, txn_year
ORDER BY txn_year ASC, txn_type ;

-- Alternatively
SELECT 
		EXTRACT('Year' FROM TO_DATE(txn_date, 'YYYY-MM-DD')) AS txn_year, 
		txn_type , 
		count(txn_id) AS "txn_count",  
		sum(quantity) AS total_quantity, 
		avg(quantity) AS average_quantity 
FROM raw.transactions t 
GROUP BY txn_type, EXTRACT('Year' FROM TO_DATE(txn_date, 'YYYY-MM-DD'))
ORDER BY EXTRACT('Year' FROM TO_DATE(txn_date, 'YYYY-MM-DD')) ASC, txn_type ;

-- 3. What was the monthly total quantity purchased and sold for Ethereum in 2020? Your query 
-- should return exactly three columns - calendar_month, buy_quantity, sell_quantity.
SELECT 
		EXTRACT(MONTH FROM txn_date::date) AS calendar_month,
		sum(CASE WHEN txn_type = 'BUY' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS buy_quantity,
    	sum(CASE WHEN txn_type = 'SELL' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS sell_quantity
FROM raw.transactions t 
WHERE ticker = 'ETH' AND EXTRACT(YEAR FROM txn_date::date) = 2020
GROUP BY calendar_month
ORDER BY calendar_month asc;


-- Alternatively
SELECT 
		EXTRACT('Month' FROM TO_DATE(txn_date, 'YYYY-MM-DD')) AS calendar_month,
		sum(CASE WHEN txn_type = 'BUY' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS buy_quantity,
    	sum(CASE WHEN txn_type = 'SELL' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS sell_quantity
FROM raw.transactions t 
WHERE ticker = 'ETH' AND EXTRACT('Year' FROM TO_DATE(txn_date, 'YYYY-MM-DD')) = 2020
GROUP BY EXTRACT('Month' FROM TO_DATE(txn_date, 'YYYY-MM-DD'))
ORDER BY EXTRACT('Month' FROM TO_DATE(txn_date, 'YYYY-MM-DD')) asc;


-- 4. Who are the top 3 members with the most bitcoin quantity? Your result should return exactly two columns - first_name, total_quantity
SELECT m.first_name , sum(t.quantity) AS total_quantity
FROM raw.members m 
INNER JOIN raw.transactions t ON m.member_id = t.member_id
GROUP BY m.first_name
ORDER BY total_quantity DESC
LIMIT 3;