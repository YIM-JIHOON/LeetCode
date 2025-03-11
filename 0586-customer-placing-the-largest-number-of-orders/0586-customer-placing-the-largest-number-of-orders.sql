-- 가장 많은 주문을 한 customer_number을 조회

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1