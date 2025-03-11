-- 각 플레이어별 첫 로그인한 날짜 조회

SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity 
GROUP BY player_id 