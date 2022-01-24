-- OBJECTIVE

-- write SQL query to count the number of unique users per day who logged in from both iphone and web
-- where iphone lgs and web logs are in different relations

-- 1. JOIN
-- 2. match by day and user id
-- 3. group by day and count num_users


-- CREATE DATA AND INSERT VALUES
CREATE TABLE web (
  ts timestamp,
  userid int,
  web_sessionid int
); 

CREATE TABLE iphone (
  ts timestamp,
  userid int,
  iphone_sessionid int
);

INSERT INTO web (ts, userid, web_sessionid)
VALUES 
  (now(), 1, 100),
  (now(), INTERVAL '1 hour', 1, 101),
  (now(), INTERVAL, '1 day', 2, 103);

  INSERT INTO iphone (ts, userid, ipone_sessionid)
  VALUES 
    (now(), 1, 100),
    (now(), INTERVAL '2 hour', 1, 101),
    (now(), INTERVAL '1 hour', 3, 103);

    SELECT DATE_TRUNC('day', i.ts) AS day,
      COUNT(DISTICT i.userid) AS num_users
    FROM iphone i
    JOIN web w 
      ON i.userid = w.userid
      AND DATE_TRUNC('day', i.ts) = DATE_TRUNC('day', w.ts)
    GROUP BY 1