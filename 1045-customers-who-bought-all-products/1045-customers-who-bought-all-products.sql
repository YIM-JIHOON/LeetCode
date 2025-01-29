-- 모든 제품을 구매한 고객ID 조회 

SELECT 
    customer_id
FROM Customer
GROUP BY 1
HAVING COUNT(product_key) >= (SELECT COUNT(DISTINCT product_key) FROM Product)