-- temporarily assign tables new names during the execution of a query
SELECT
	c.customer_id,
	first_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p 
    ON p.customer_id = c.customer_id
ORDER BY 
   payment_date DESC;

--  to join a table to itself (a.k.a self-join), you need to use table aliases. This is because referencing the same table multiple times within a query results in an error.

SELECT
    e.first_name employee,
    m .first_name manager
FROM
    employee e
INNER JOIN employee m 
    ON m.employee_id = e.manager_id
ORDER BY manager;