

-- A) Find customers who have at least one payment whose amount is greater than 11.

-- The EXISTS operator is a boolean operator that tests for existence of rows in a subquery.

SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;


-- B) NOT EXISTS example

-- The NOT operator negates the result of the EXISTS operator. The NOT EXISTS is opposite to EXISTS. It means that if the subquery returns no row, the NOT EXISTS returns true. If the subquery returns one or more rows, the NOT EXISTS returns false.

SELECT first_name,
       last_name
FROM customer c
WHERE NOT EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;



-- C) EXISTS and NULL

-- If the subquery returns NULL, EXISTS returns true.

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;