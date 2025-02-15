-- 2019-07-27에 끝낸 30일동안의 일일 활성 유저수 조회
-- (한 유저가 어느날 적어도 하나의 활동을 했다면 그 날은 활성 상태로 간주)

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date <= '2019-07-27' AND activity_date > '2019-06-27')
GROUP BY 1