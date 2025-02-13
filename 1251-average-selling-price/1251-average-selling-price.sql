-- 각 제품의 평균 판매가격을 조회 (소수점 둘째 자리까지 반올림)
-- 제품에 판매된 이력이 없는 경우 평균 판매가격은 0으로 가정

SELECT
    P.product_id,
    ROUND(COALESCE((SUM(P.price * U.units)/SUM(U.units)), 0), 2) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U
       ON P.product_id = U.product_id
      AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY 1