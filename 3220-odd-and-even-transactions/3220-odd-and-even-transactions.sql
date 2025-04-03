-- 각 날짜별 홀수 및 짝수 거래에 대한 금액 합계를 조회 (transaction_date 기준 오름차순 정렬)
-- 특정 날짜에 거래가 없는 경우 0으로 표시

SELECT 
    transaction_date,
    COALESCE(SUM(CASE WHEN amount % 2 = 1 THEN amount END),0) AS odd_sum,
    COALESCE(SUM(CASE WHEN amount % 2 = 0 THEN amount END),0) AS even_sum
FROM transactions
GROUP BY transaction_date 
ORDER BY transaction_date