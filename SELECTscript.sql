-- Analzye 15 tables in the dvdrental DB using PostgreSQL

-- check current database if multipes exist
SELECT current_database();

-- return a list of all databases available
SELECT datname FROM pg_database
WHERE datistemplate = false;

-- get all tables in your specified schema and current db
SELECT * 
FROM information_schema.tables 
WHERE table_type = 'BASE TABLE' 
    AND table_schema = 'public' 
ORDER BY table_type, table_name

-- SECTION 1. Querying Data
SELECT * 
FROM customer;

SELECT
   first_name,
   last_name,
   email
FROM
   customer;

--  return full names and emails of all customers (|| concatenate operator)
SELECT 
   first_name || ' ' || last_name,
   email
FROM 
   customer;

-- SECTION 2: column aliases: assign names to columns

-- ALTERNATIVE
-- SELECT 
--  first_name || ' ' || last_name  full_name,
--  email
-- FROM 
--  customer;

SELECT 
   first_name || ' ' || last_name AS full_name,
   email
FROM 
   customer;

-- SECTION 3: ORDER BY

-- sort rows ASC is default: sort by one column
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name;


SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name DESC;
  
-- sort by multiple columns
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

-- sort rows by expression
SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;



