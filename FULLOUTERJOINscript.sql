-- combines the results of both left join and right join.
-- create two new tables for the demonstration: employees and departments:
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments (
	department_id serial PRIMARY KEY,
	department_name VARCHAR (255) NOT NULL
);

CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	employee_name VARCHAR (255),
	department_id INTEGER
);


INSERT INTO departments (department_name)
VALUES
	('Sales'),
	('Marketing'),
	('HR'),
	('IT'),
	('Production');

INSERT INTO employees (
	employee_name,
	department_id
)
VALUES
	('Bette Nicholson', 1),
	('Christian Gable', 1),
	('Joe Swank', 2),
	('Fred Costner', 3),
	('Sandra Kilmer', 4),
	('Julia Mcqueen', NULL);

  SELECT * FROM departments;

  SELECT * FROM employees;

-- The result set includes every employee who belongs to a department and every department which have an employee. In addition, it includes every employee who does not belong to a department and every department that does not have an employee.

  SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d 
        ON d.department_id = e.department_id;

-- WHERE is used to find department that does not have any employees and vice versa
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d 
        ON d.department_id = e.department_id
WHERE
	employee_name IS NULL;

SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d ON d.department_id = e.department_id
WHERE
	department_name IS NULL;