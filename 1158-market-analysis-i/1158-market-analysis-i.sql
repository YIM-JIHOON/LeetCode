-- 모든 2019년도 구매자에 대한 각각의 가입날짜와 주문수를 조회

SELECT 
    U.user_id AS buyer_id,
    U.join_date,
    COALESCE(COUNT(O.order_id), 0) AS orders_in_2019
FROM Users U
LEFT JOIN Orders O
       ON U.user_id = O.buyer_id 
       AND YEAR(O.order_date) = 2019
GROUP BY U.user_id
