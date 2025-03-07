-- 아무것도 주문하지 않은 모든 고객 조회

SELECT C.name AS Customers
FROM Customers C
LEFT JOIN Orders O
       ON C.id = O.customerId 
WHERE O.customerId IS NULL