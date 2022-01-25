-- Bottom 2 Companies By Mobile Usage
-- Write a query that returns a list of the bottom 2 companies by mobile usage. Company is defined in the customer_id column. Mobile usage is defined as the number of events registered on a client_id == 'mobile'. Order the result by the number of events ascending. 
-- In the case where there are multiple companies tied for the bottom ranks (rank 1 or 2), return all the companies. Output the customer_id and number of events.
-- Table: fact_events

-- filter data on client_id so we only looking at mobile usage
-- count number of events for mobile usage by the customer_id
-- rank records based on count of events
    -- row number, rank(), dense rank()
-- use an uter query to fetch data for 2 bottom ranks from the query above

SELECT 
    customer_id,
    events
FROM (
    SELECT
        customer_id,
        COUNT(*) AS events,
        DENSE_RANK() OVER(ORDER BY COUNT(*)) AS rank
    FROM fact_events
    WHERE client_id = 'mobile'
    GROUP BY customer_id) subquery
WHERE rank <= 2
ORDER BY events ASC



