-- sale_id별 product_name, year, price를 조회
SELECT 
    P.product_name,
    S.year,
    S.price
FROM Sales S
JOIN Product P
  ON S.product_id = P.product_id