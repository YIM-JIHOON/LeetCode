-- 2020년 2월에 최소 100개 이상 주문된 제품의 이름과 수량 조회

WITH CTE AS (
    SELECT 
        product_id,
        LEFT(order_date,7) AS order_date,
        SUM(unit) AS unit 
    FROM Orders
    WHERE LEFT(order_date,7) = '2020-02'
    GROUP BY 1, 2
    HAVING unit >= 100
)

SELECT P.product_name, C.unit
FROM Products P
JOIN CTE C
  ON P.product_id = C.product_id
