-- divides the rows returned from the SELECT statement into groups. For each group, you can apply an aggregate function e.g.,  SUM() to calculate the sum of items or COUNT() to get the number of items in the groups.
-- GROUP BY with SUM()
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id;

SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;

SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;	

-- GROUP BY with COUNT()
-- group by one column
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;

-- ggroup by multiple columns
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;

-- group by with date column
SELECT 
	DATE(payment_date) paid_date, 
	SUM(amount) sum
FROM 
	payment
GROUP BY
	DATE(payment_date);