CREATE TABLE IF NOT EXISTS user_sales (
    userid INT,
    saleid INT
);

INSERT user_sales
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (3, 7),
    (4, 8);

CREATE TABLE IF NOT EXISTS sale_amount (
    saleid INT,
    amount DECIMAL(15, 2)
);

INSERT sale_amount
VALUES
    (1, 4.00),
    (2, 3.50),
    (3, 2.00),
    (4, 3.75),
    (5, 5.25),
    (6, 3.00);


# NOTE: Broken integrity. Missing sale amounts. The output is misleading
SELECT
    userid
FROM user_sales us
    JOIN sale_amount sa ON us.saleid = sa.saleid
GROUP BY userid
HAVING SUM(amount) > 4
   AND SUM(amount) < 6
