-- 모든 고객의 첫번째 주문 중 즉시 주문의 비율 구하기 (소수 둘째 자리까지 반올림)
-- 고객 선호 배송 날짜가 주문 날짜와 같으면 해당 건은 즉시 주문, 그렇지 않으면 예약 주문임
-- 고객의 첫 번째 주문은 고객이 한 가장 빠른 주문일이며, 한 고객은 정확히 하나의 첫번째 주문을 가짐

-- 고객별 첫번째 주문 조회
WITH first_orders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS order_date
    FROM Delivery
    GROUP BY customer_id
),
-- 첫번째 주문 중 즉시 주문 조회
immediate_first_orders AS (
    SELECT 
        F.customer_id
    FROM first_orders F
    JOIN Delivery D
      ON F.customer_id = D.customer_id 
     AND F.order_date = D.order_date
    WHERE D.order_date = D.customer_pref_delivery_date
)
-- 비율 계산
SELECT 
    ROUND(COUNT(I.customer_id) * 100.0 / COUNT(F.customer_id), 2) AS immediate_percentage
FROM first_orders F
LEFT JOIN immediate_first_orders I
       ON F.customer_id = I.customer_id