-- WHERE filters rows returned by a SELECT

-- EQUAL (=) operator
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';

-- AND operator
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie' AND 
        last_name = 'Rice';

-- OR operator
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Rodriguez' OR 
	first_name = 'Adam';

-- IN match string with any string in a list
SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name IN ('Ann','Anne','Annie');

-- LIKE match a string with a specified pattern 
SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name LIKE 'Ann%'

-- BETWEEN operator
-- first name has pattern A and the name length is between 3 and 5
SELECT
	first_name,
	LENGTH(first_name) name_length
FROM
	customer
WHERE 
	first_name LIKE 'A%' AND
	LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
	name_length;

-- NOT EQUAL (!= or <>) operator
SELECT 
	first_name, 
	last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%' AND 
	last_name <> 'Motley';