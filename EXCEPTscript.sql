--  returns distinct rows from the first (left) query that are not in the output of the second (right) query.
SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films;

SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films
ORDER BY title;
