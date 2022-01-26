DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);

    -- ROLLUP clause to find the number of products sold by brand (subtotal) and by all brands and segments (total).

    SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (brand, segment)
ORDER BY
    brand,
    segment

  -- from the output, the third row shows the sales of the ABC brand, the sixth row displays sales of the the XYZ brand. The last row shows the grand total for all brands and segments. In this example, the hierarchy is brand > segment.

  -- change the order of brand and segment

  SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (segment, brand)
ORDER BY
    segment,
    brand;

-- partial roll-up:

    SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment,
    ROLLUP (brand)
ORDER BY
    segment,
    brand;

-- The following statement finds the number of rental per day, month, and year by using the ROLLUP:

  SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );