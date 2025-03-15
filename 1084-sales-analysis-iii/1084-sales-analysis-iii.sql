-- 1분기(2019-01-01~2019-03-31)에만 판매된 제품을 조회

WITH q1_sales AS (
    SELECT DISTINCT product_id
    FROM Sales
    WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
),

non_q1_sales AS (
    SELECT DISTINCT product_id
    FROM Sales
    WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
)
SELECT p.product_id, p.product_name
FROM Product p
JOIN q1_sales q1 
  ON p.product_id = q1.product_id
WHERE p.product_id NOT IN (SELECT product_id FROM non_q1_sales)