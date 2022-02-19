-- SMS Confirmations From Users

-- Meta/Facebook sends SMS texts when users attempt to 2FA (2-factor authenticate) into the platform to log in.
-- In order to successfully 2FA they must confirm they received the SMS text message. Confirmation texts are 
-- only valid on the date they were sent. Unfortunately, there was an ETL problem with the database where friend 
-- requests and invalid confirmation records were inserted into the logs, which are stored in the 'fb_sms_sends' 
-- table. These message types should not be in the table. Fortunately, the 'fb_confirmers' table contains valid 
-- confirmation records so you can use this table to identify SMS text messages that were confirmed by the user.


-- Calculate the percentage of confirmed SMS texts for August 4, 2020.

-- filter out type=confirmation and type=friend_request
-- filter for uds = 08/04/2020
-- LEFT JOIN fb_customers with fb_sms_sends on phone_number and datec
-- count(phone_numbers from fb_customers) / count(phone_number from fb_sms_sends)::float * 100



SELECT (COUNT(b.phone_number) / COUNT(a.phone_number)::FLOAT) * 100 AS percentage
    FROM fb_sms_sends a
LEFT JOIN fb_confirmers b
    ON b.phone_number = a.phone_number AND b.date = a.ds
WHERE type not in ('confirmation', 'friend_request')
    AND ds = '08-04-2020';