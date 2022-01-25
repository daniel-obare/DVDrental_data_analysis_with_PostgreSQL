-- Rank Variance Per Country
-- Which countries have risen in the rankings based on the number of comments between Dec 2019 vs Jan 2020? Hint: Avoid gaps between ranks when ranking countries.
-- Tables: fb_comments_count, fb_active_users

-- join the two tables on user_id(LEFT JOIN because not all users may have made comments)
-- filter out table for dec 2019 and jan 2020
-- exclude rows where country is empty
-- sum the number of comments per country
-- create subqueries fro dec and jan
-- use FULL JOIN to compare dec 19 and jan 20 comments
-- rank 2019 comment counts and 2020 comment counts
-- apply final flter to fetch only countries ranking with decline( jank > dec rank)
WITH dec_summary AS (
    SELECT 
        country
        SUM(number_of_comments) AS  number_of_comments_dec,
        DENSE_RANK() OVER(ORDER BY SUM(bumber_of_comments) DESC) AS country_rank
    FROM fb_active_users AS au
    LEFT JOIN fb_comment_cunt AS cc
        ON au.user_id = cc.user_id
    WHERE created_at <= '2019-12-31' AND created_at >= '2019-12-01'
        AND country IS NOT NULL
    GROUP BY country
),
jan_summary AS (
    SELECT 
         country
        SUM(number_of_comments) AS number_of_comments_dec,
        DENSE_RANK() OVER(ORDER BY SUM(bumber_of_comments) DESC) AS country_rank
    FROM fb_active_users AS au
    LEFT JOIN fb_comment_cunt AS cc
        ON au.user_id = cc.user_id
    WHERE created_at <= '2020-01-31' AND created_at >= '2020-01-01'
        AND country IS NOT NULL
    GROUP BY country
)

SELECT j.country
FROM jan_summary j
LEFT JOIN dec_summary d ON d.country = j.country
WHERE (j.country_rank < d.country_rank) OR d.country IS NULL

-- RANK gives the ranking within your ordered partition. Ties are assigned the same rank, with the next ranking(s) skipped. So, if you have 3 items at rank 2, the next rank listed would be ranked 5.

-- DENSE_RANK again gives the ranking within your ordered partition, but the ranks are consecutive. No ranks are skipped if there are ranks with multiple items.

-- A group by normally reduces the number of rows returned by rolling them up and calculating averages or sums for each row. partition by does not affect the number of rows returned, but it changes how a window function's result is calculated. partition by just works on a window function, like row_number: group by modifies the entire query