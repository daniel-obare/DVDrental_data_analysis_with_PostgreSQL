-- Highest Salary In Department
-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.
-- Table: employee

-- section 1: subquery
-- subquery to get department name and corresponding highest salary
-- use max() to find highst salary
-- group records by department
-- use outer query to find employees with matching values of highest salary found in subquery

SELECT
    department,
    first_name,
    salary
FROM employee
WHERE (department, salary) IN (
    SELECT
        department,
        MAX(salary)
    FROM employee
    GROUP BY department
)


-- section 2: self-join
-- define self-join table with department names and corresponding highest salaries
-- use max() function to find highest salary
-- group records by department
-- join tables using the highest salary and department as keys so that we are left with department and highestsalaries
-- select neccesssary columns(first_name, department, salary)

SELECT
    e.first_name,
    e.department,
    e.salary
FROM employee e
JOIN (
    SELECT 
        department, 
        MAX(salary) AS max_salary
    FROM employee
    GROUP BY department) ms
ON e.department = ms.department AND e.salary = ms.max_salary

-- section 3: window function- max()
-- use subquery to create additional column with the highest salary in department
-- use window function using OVER nad PARTITION by department
-- in outer query only select 3 columns(first_name, department, salary)
-- filter results to obtain only the higest salary

SELECT
    department,
    first_name,
    salary
FROM (
    SELECT *,
        MAX(salar) OVER(PARTITION BY department) AS highest_salary
    FROM employee) a
WHERE salary = highest_salary

-- section 4: window function-rank()
-- in subquery select first_name, department, salary
-- using rank function and window function, add a column with rankuing of the salaries in each department
-- use the outer query to only leave rows where rank is 1

SELECT *
FROM (
    SELECT
        first_name,
        department,
        salary,
        RANK() OVER(PARTITON BY department ORDER BY salary DESC) AS rank
    FROM employee) a
    WHERE rank = 1











