-- 2020년 모든 사용자의 최근 로그인만 조회 

SELECT 
    user_id,
    MAX(time_stamp) AS last_stamp
FROM Logins 
WHERE YEAR(time_stamp) = '2020'
GROUP BY user_id