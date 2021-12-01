-- create database daniel_obare
CREATE DATABASE daniel_obare;

-- create recipe table, with auto increment
CREATE TABLE recipes (
	recipe_id SERIAL,
	recipe_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (recipe_id),
	UNIQUE (recipe_name)
);


-- insert values into table
INSERT INTO recipes 
    (recipe_id, recipe_name) 
VALUES 
    (1,"Tacos"),
    (2,"Tomato Soup"),
    (3,"Grilled Cheese");

-- view the table
SELECT * 
FROM recipes 

-- ingridients table
CREATE TABLE recipe_ingridients (
	recipe_id INT NOT NULL,
	ingridient_id INT NOT NULL,
	amount INT NOT NULL,
	PRIMARY KEY (recipe_id, ingridient_id)
);

-- insert values in the ngridients table
INSERT INTO recipe_ingridients
	(recipe_id, ingridient_id, amount)
VALUES 
	(1,1,1),
	(1,2,2),
	(1,3,2),
	(1,4,3),
	(1,5,1),
	(2,3,2),
	(2,6,1),
	(3,5,1),
	(3,7,2);

-- ##################################################################
  CREATE TABLE recipes (
	recipe_id BIGSERIAL NOT NULL,
	recipe_name VARCHAR(30) NOT NULL,
	PRIMARY KEY  (recipe_id),
	UNIQUE (recipe_name)
);

INSERT INTO recipes
	(recipe_name)
VALUES
	('Tacos'),
	('Tomato Soup'),
	('Grilled Cheese');

ALTER TABLE recipes 
ADD COLUMN recipe_id BIGSERIAL NOT NULL PRIMARY KEY;
-- ####################################################################