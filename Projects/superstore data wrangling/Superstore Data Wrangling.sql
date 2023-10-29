
-- create a schema
CREATE SCHEMA superstore;


-- superstore.customers definition

CREATE TABLE superstore.customers (
	"Customer ID" varchar(50) NULL,
	"Customer Name" varchar(50) NULL,
	segment varchar(50) NULL,
	"Country/Region" varchar(50) NULL,
	city varchar(50) NULL,
	"State/Province" varchar(50) NULL,
	"Postal Code" varchar(50) NULL,
	region varchar(50) NULL
);


-- superstore.products definition

CREATE TABLE superstore.products (
	"Product ID" varchar(50) NULL,
	category varchar(50) NULL,
	"Sub-Category" varchar(50) NULL,
	"Product Name" varchar(128) NULL
);


-- superstore.orders definition

CREATE TABLE superstore.orders (
	order_id varchar(50) NULL,
	order_date varchar(50) NULL,
	ship_date varchar(50) NULL,
	ship_mode varchar(50) NULL,
	customer_id varchar(50) NULL,
	product_id varchar(50) NULL,
	sales float4 NULL,
	quantity int4 NULL,
	discount float4 NULL,
	profit float4 NULL
);


-- superstore.archived_orders definition

CREATE TABLE superstore.archived_orders (
	"Order ID" varchar(50) NULL,
	"Order Date" varchar(50) NULL,
	"Ship Date" varchar(50) NULL,
	"Ship Mode" varchar(50) NULL,
	"Customer ID" varchar(50) NULL,
	"Product ID" varchar(50) NULL,
	sales float4 NULL,
	quantity int4 NULL,
	discount float4 NULL,
	profit float4 NULL
);


-- Alter Tables to Add Constrainst



