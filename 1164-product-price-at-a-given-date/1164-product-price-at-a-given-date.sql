-- 2019-08-16에 모든 제품의 가격 구하기 (변경 전 모든 제품의 가격이 10이라고 가정)
WITH CTE AS (
    SELECT 
        product_id, 
        MAX(change_date) AS latest_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT P1.product_id, 
       COALESCE(P2.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) P1
LEFT JOIN CTE C 
       ON P1.product_id = C.product_id
LEFT JOIN Products P2
       ON C.product_id = P2.product_id 
      AND C.latest_date = P2.change_date