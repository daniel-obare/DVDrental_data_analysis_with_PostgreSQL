-- You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

-- The marketing campaign doesn't start until one day after the initial in-app purchase so users that make multiple purchases on the same day do not count, nor do we count users that over time purchase only the products they purchased on the first day.



-- To be considered in the marketing campaign, user needs to buy a product that is'nt the same product as what was bought in their first purchase date.
-- Product needs to be different
-- Product needs to be purchased on a diferent day

-- Scenarios to consider
-- user 28 =  1 item, 1 date of purchase (not eligible for marketing campaign)
-- user 49 = multiple, products, 1 date of purchase (not eligible for marketing campaign)
-- user 50 = 1 product, multiple days, but same products as the 1st day of purchase (not eligible for marketing campaign)
-- user 25 = mutiple products, multiple days, but same products as the 1st day of purchase (not eligible for marketing campaign)
-- user 46 = multiple dates, multiple products (should be in marketing campaign)



SELECT COUNT(DISTINCT user_id)
FROM marketing_campaign
WHERE user_id IN
    (SELECT user_id
     FROM marketing_campaign
     GROUP BY user_id
     HAVING COUNT(DISTINCT product_id) > 1 -- user much purchase multiple different products

     AND COUNT(DISTINCT created_at) > 1) -- user must purchase on different dates
AND CONCAT ((user_id), '_', (product_id)) NOT IN
    (SELECT user_product -- identify user's 1st purchase product
FROM 
       (SELECT *, 
               RANK() OVER(PARTITION BY user_id
                           ORDER BY created_at) AS rn, 
               CONCAT((user_id), '_', (product_id)) AS user_Product
        FROM marketing_campaign) x
     WHERE rn = 1)