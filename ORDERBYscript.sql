-- create a new table
CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

SELECT num
FROM sort_demo
ORDER BY num;

-- place null in last ption (default)
SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;

-- place null before other values
SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST;

-- srt in descending
SELECT num
FROM sort_demo
ORDER BY num DESC;

-- reverse the order
SELECT num
FROM sort_demo
ORDER BY num DESC NULLS LAST;

