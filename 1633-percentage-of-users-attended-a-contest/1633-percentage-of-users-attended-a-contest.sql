-- 각 대회별로 등록한 사용자의 비율 조회 (소수점 둘째자리까지 반올림, percentage: 내림차순, contest_id: 오름차순)

SELECT
    contest_id,
    ROUND((COUNT(user_id) / (SELECT COUNT(DISTINCT user_id) FROM Users)) * 100,2) AS percentage 
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1 ASC