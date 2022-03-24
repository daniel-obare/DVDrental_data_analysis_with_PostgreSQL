-- Highest Cost Orders
-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output their first name, total cost of their items, and the date.
 
--  For simplicity, you can assume that every first name in the dataset is unique.



SELECT first_name,
       sum(total_order_cost) AS total_cost,
       order_date
FROM orders AS o,
     customers AS c
WHERE c.id = o.cust_id
  AND o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY first_name,
         order_date
HAVING sum(total_order_cost) =
  (SELECT sum(total_order_cost) AS total_cost
   FROM orders o
   WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
   GROUP BY cust_id,
            order_date
   ORDER BY total_cost DESC
   LIMIT 1
  );