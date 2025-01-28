-- 판매된 모든 제품의 첫 해의 제품ID, 연도, 수량, 가격을 조회
-- 1년 동안 동일한 제품의 판매 항목이 여러 개 있을 수 있음
-- 첫 해의 모든 제품 항목을 별도로 반환해야함

SELECT 
    S.product_id,
    S.year AS first_year,
    S.quantity,
    S.price
FROM Sales S
JOIN (SELECT 
        product_id, 
        MIN(year) AS first_year
      FROM Sales
      GROUP BY product_id
      ) SUB 
  ON S.product_id = SUB.product_id 
  AND S.year = SUB.first_year
