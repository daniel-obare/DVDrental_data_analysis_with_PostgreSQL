-- query data from two or more tables.creates an implicit join based on the same column names in the joined tables. A natural join can be an inner join, left join, or right join. If you do not specify a join explicitly    e.g., INNER JOIN, LEFT JOIN, RIGHT JOIN, PostgreSQL will use the INNER JOIN by default.
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	category_id serial PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

SELECT * FROM products
NATURAL JOIN categories;

-- equivalently
SELECT * FROM products
NATURAL JOIN categories;