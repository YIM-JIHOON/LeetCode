-- query_name별 quality와 poor_query_percentage를 조회 (둘 다 소수점 둘째 자리까지 반올림)

-- (*quality: rating과 position간 비율의 평균)
-- (*poor_query_percentage: 모든 쿼리 중 rating이 3점 미만인 비율)

-- 정수 연산을 방지하기 위해 부동 소수점 사용(.0)
SELECT
    query_name,
    ROUND(SUM(rating * 1.0 / position) / COUNT(*), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries 
GROUP BY query_name