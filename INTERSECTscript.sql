-- combine result sets of two or more queries into a single result set. The result returns one film that appears on both tables.
SELECT *
FROM most_popular_films 
INTERSECT
SELECT *
FROM top_rated_films;