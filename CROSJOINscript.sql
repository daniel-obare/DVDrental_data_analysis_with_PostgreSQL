-- allows to produce a Cartesian Product of rows in two or more tables.
-- alternatives for cross join
SELECT select_list
FROM T1
CROSS JOIN T2;

SELECT select_list
FROM T1
CROSS JOIN T2;

SELECT *
FROM T1
INNER JOIN T2 ON true;


-- create T1 and T2 tables and insert some sample data for the cross demonstration.
DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES
	('A'),
	('B');

INSERT INTO T2 (score)
VALUES
	(1),
	(2),
	(3);

SELECT *
FROM T1
CROSS JOIN T2;