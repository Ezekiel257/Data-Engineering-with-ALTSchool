
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

-- create schema
CREATE SCHEMA raw;


-- Retrieve all data from the Member table.
SELECT * FROM raw.members;



-- Retrieve specific columns from the Price table.
SELECT ticker, price FROM raw.prices;


-- Retrieve transactions from the Transactions table with quantity equal to 50.
SELECT * FROM raw.transactions t  WHERE quantity  = 50;


-- Retrieve member data from the Member table sorted by first_name in alphabetical order.
SELECT  *
FROM raw.members
ORDER BY first_name ASC;



-- Retrieve the top 10 prices from the Price table.
SELECT * 
FROM raw.prices 
ORDER BY price DESC  
LIMIT 10;


-- Calculate the total quantity of all transactions.
SELECT SUM(quantity) FROM raw.transactions;


-- Calculate the total transaction quantity for each member.
SELECT member_id, sum(quantity) 
FROM raw.transactions
GROUP BY member_id;


-- Alias the total transaction quantity in a grouped result.
SELECT member_id, SUM(quantity) AS total_transaction_amount 
FROM raw.transactions
GROUP BY member_id;


-- Find the unique ticker symbols in the Price table.
SELECT DISTINCT ticker FROM raw.prices;


-- Retrieve transactions with quantity greater than 20 in ETH or BTC.
SELECT * 
FROM raw.transactions t  
WHERE (quantity > 20 AND ticker = 'ETH') OR (ticker = 'BTC');


-- Find the total quantity and average quantity for each year.
SELECT 
		EXTRACT(YEAR FROM txn_date::date) AS txn_year, 
		sum(quantity) AS "total_quantity", 
		avg(quantity) AS "average_quantity"
FROM raw.transactions
WHERE  ticker = 'BTC'
GROUP BY txn_type, txn_year;


-- Who are the top 3 members with the most bitcoin quantity? Your result should return exactly two columns - first_name, total_quantity
SELECT m.first_name , sum(t.quantity) AS total_quantity
FROM raw.members m 
INNER JOIN raw.transactions t ON m.member_id = t.member_id
WHERE ticker = 'BTC'
GROUP BY m.first_name
ORDER BY total_quantity DESC
LIMIT 3;


-- Calculate the total transaction amount for each member
SELECT m.member_id, count(t.txn_id) AS transaction_count, SUM(p.price * t.quantity) AS total_transaction_amount
FROM raw.members m 
INNER JOIN raw.transactions t ON m.member_id = t.member_id 
INNER JOIN raw.prices p ON t.ticker = p.ticker 
GROUP BY m.member_id;


-- What was the monthly average quantity purchased and sold for Ethereum in 2020? Your query 
-- should return exactly three columns - calendar_month, buy_quantity, sell_quantity.
SELECT 
		EXTRACT(MONTH FROM txn_date::date) AS calendar_month,
		avg(CASE WHEN txn_type = 'BUY' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS buy_quantity,
    	avg(CASE WHEN txn_type = 'SELL' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS sell_quantity
FROM raw.transactions t 
WHERE ticker = 'ETH' AND EXTRACT(YEAR FROM txn_date::date) = 2020
GROUP BY calendar_month;


-- Find the minimum and maximum prices for each cryptocurrency.
SELECT ticker, MIN(price) AS min_price, MAX(price) AS max_price
FROM raw.prices p 
GROUP BY ticker;


-- Retrieve transactions with member details, joining the Transactions and Member tables on the member_id.
SELECT m.first_name, m.region, t.*
FROM raw.transactions t
INNER JOIN raw.members m ON t.member_id = m.member_id;

-- Find members and their transactions quantity, including members with no transactions.
SELECT m.first_name, t.quantity
FROM raw.members m
LEFT JOIN raw.transactions t ON m.member_id = t.member_id;


-- Retrieve transactions and their associated member details, including transactions with no members.
SELECT m.first_name, m.region, t.*
FROM raw.transactions t
RIGHT JOIN raw.members m ON t.member_id = m.member_id;


-- Combine transactions and members, including unmatched records from both tables.
SELECT m.first_name, m.region, t.*
FROM raw.transactions t
FULL JOIN raw.members m ON t.member_id = m.member_id;


-- Find pairs of members who live in the same region.
SELECT m1.first_name AS member1, m2.first_name AS member2, m1.region 
FROM raw.members m1
JOIN raw.members m2 ON m1.region = m2.region AND m1.member_id < m2.member_id;


-- Create a matrix of all members and currencies to explore potential transactions.
SELECT m.first_name , p.ticker 
FROM raw.members m
CROSS JOIN raw.prices p;


-- How many buy and sell transactions are there for Bitcoin? - your result should return two columns - txn_type, transaction_count
SELECT txn_type , count(txn_id) AS "transaction_count"
FROM  raw.transactions
WHERE ticker = 'BTC'
GROUP BY txn_type;

--For each year, calculate the following buy and sell metrics for bitcoin:
-- a. Total transaction count
-- b. Total quantity
-- c. Average quantity
-- Kindly note that you are generating a single query to calculate these metrics and you should return exactly 5 columns - txn_year, txn_type, txn_count, total_quantity, average_quantity.
SELECT 
		EXTRACT(YEAR FROM txn_date::date) AS txn_year, 
		txn_type, 
		count(txn_id) AS "txn_count",  
		sum(quantity) AS "total_quantity", 
		avg(quantity) AS "average_quantity"
FROM raw.transactions
WHERE  ticker = 'BTC'
GROUP BY txn_type, txn_year;

