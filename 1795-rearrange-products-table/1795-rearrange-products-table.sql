-- 각 행에 (product_id, store, price)이 있도록 표를 재배치 
-- 매장에서 제품을 구할 수 없는 경우 결과 표에 해당 (product_id, store) 조합을 포함하지말것

SELECT product_id, 'store1' AS store, store1 AS price FROM Products WHERE store1 IS NOT NULL
UNION ALL
SELECT product_id, 'store2' AS store, store2 AS price FROM Products WHERE store2 IS NOT NULL
UNION ALL
SELECT product_id, 'store3' AS store, store3 AS price FROM Products WHERE store3 IS NOT NULL