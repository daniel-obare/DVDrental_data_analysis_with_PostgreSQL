-- Number of Comments Per User in Past 30 days
-- Return the total number of comments received for each user in the last 30 days. Don't output users who haven't received any comment in the defined time period. Assume today is 2020-02-10.
-- Table: fb_comments_count

-- filter data from 2020-02-10 to 30 days before
-- calculate the sum of the number of comments
-- group by user_id

-- static method
SELECT * 
FROM fb_comments_count
WHERE created_at BETWEEN '2020-01-10'::DATE AND '2020-02-10'::DATE 


-- dynamic method
SELECT 
    user_id,
    SUM(number_of_comments) AS otal_comments
FROM fb_comments_count
WHERE created_at BETWEEN ('2020-02-10'::DATE - 30 * INTERVAL '1 day') AND '2020-02-10'::DATE
GROUP BY user_id

-- WHERE created_at BETWEEN (CAST('2020-02-10' AS DATE) - 30 * INTERVAL '1 day') AND CAST('2020-02-10' AS DATE)

