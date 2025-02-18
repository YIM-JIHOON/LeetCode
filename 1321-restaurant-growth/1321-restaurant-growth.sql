-- 고객이 7일동안(현재 날짜 + 6일 전) 지불한 금액의 이동평균 계산 (소수점 둘째자리, visited_on 오름차순)
WITH DailyRevenue AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT 
    A.visited_on, 
    SUM(B.amount) AS amount,
    ROUND(AVG(B.amount), 2) AS average_amount
FROM DailyRevenue A
JOIN DailyRevenue B 
    ON A.visited_on BETWEEN B.visited_on AND B.visited_on + INTERVAL 6 DAY
GROUP BY A.visited_on
HAVING COUNT(B.visited_on) = 7  -- 7일 데이터를 모두 포함하는 경우만 출력
ORDER BY A.visited_on