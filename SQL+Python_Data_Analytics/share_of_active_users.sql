-- Share of Active Users
-- Return the share of monthly active users in the United States (US). Active users are the ones with an "open" 
-- status in the table.

-- output ratio (active users / all users)
-- filter out US users only
-- count number of users with status open
-- count the number of total users
-- take the number of status open users and divide by ttal number of users

SELECT
    COUNT(CASE WHEN status = 'open' THEN user_id else null end) / count(*)::FLOAT AS ratio_active_users
FROM fb_active_users
WHERE country = 'USA'
