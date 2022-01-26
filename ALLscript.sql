--  ALL operator allows you to query data by comparing a value with a list of values returned by a subquery.

-- column_name > ALL (subquery) the expression evaluates to true if a value is greater than the biggest value returned by the subquery.

-- column_name >= ALL (subquery) the expression evaluates to true if a value is greater than or equal to the biggest value returned by the subquery.

-- column_name < ALL (subquery) the expression evaluates to true if a value is less than the smallest value returned by the subquery.

-- column_name <= ALL (subquery) the expression evaluates to true if a value is less than or equal to the smallest value returned by the subquery.

-- column_name = ALL (subquery) the expression evaluates to true if a value is equal to any value returned by the subquery.

-- column_name != ALL (subquery) the expression evaluates to true if a value is not equal to any value returned by the subquery.

SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;


-- the query return all films whose lengths are greater than the biggest value in the average length list returned by the subquery.
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length),2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length;