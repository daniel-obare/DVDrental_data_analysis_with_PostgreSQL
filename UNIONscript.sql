-- combine result sets of multiple queries into a single result sets,  combines result sets of two or more SELECT statements into a single result set.
-- The UNION operator removes all duplicate rows from the combined data set. To retain the duplicate rows, you use the the UNION ALL instead.
DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO 
   top_rated_films(title,release_year)
VALUES
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);

INSERT INTO 
   most_popular_films(title,release_year)
VALUES
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);

SELECT * FROM top_rated_films;

SELECT * FROM most_popular_films;

-- combine data from both tables:
-- excluding duplicates
SELECT * FROM top_rated_films
UNION
SELECT * FROM most_popular_films;

-- including duplicates
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films;

-- UNIION with ORDER BY
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films;