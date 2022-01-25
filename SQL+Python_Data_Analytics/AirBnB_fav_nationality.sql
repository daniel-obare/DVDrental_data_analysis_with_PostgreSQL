-- For each guest reviewer, find the nationality of the reviewer’s favorite host based on the guest’s highest review score given to a host. Output the user ID of the guest along with their favorite host’s nationality.

-- Both the `from_user` and `to_user` columns are user IDs.
-- Tables: airbnb_reviews, airbnb_hosts


-- filter reviews by guests (from_type="guest")
-- find the max(review_score) by from_user
-- jon the above query to the airbnb_reviews and grab the hst_id that received the (max(review_score))
-- join the above query to airbnb_hosts and grab nationality
-- output user_id and nationality of host

SELECT 
    guest_id,
    nationality fav_nationality
FROM (
    SELECT
        from_user AS guest_id,
        MAX(review_score) AS max_score_given
    FROM airbnb_reviews
    WHERE from_type = 'guest'
    GROUP BY guest_id) ms
INNER JOIN (
    SELECT *
    FROM airbnb_reviews
    WHERE from_type = 'guest') ar
 ON ms.guest_id = ar.from_user AND ms.max_score_given = ar.review_score
 INNER JOIN airbnb_hosts ah
    ON ah.host_id = ar.to_user
GROUP BY guest_id, fav_nationality
ORDER BY guest_id
    
    
    
    
    
    
    




