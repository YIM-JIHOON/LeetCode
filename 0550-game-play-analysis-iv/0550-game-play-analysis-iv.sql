-- 처음 로그인한 날의 바로 다음날 다시 로그인한 플레이어의 비율 구하기 (소수점 둘째 자리까지 반올림)

-- 첫 로그인 날짜 조회 
WITH First_Login AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY 1
)

-- 최소 이틀 연속 로그인한 플레이어 수 구한 뒤, 전체 플레이어 수로 나누기
SELECT
    ROUND(SUM(CASE WHEN DATE_ADD(F.first_login_date, INTERVAL 1 DAY) = A.event_date THEN 1 ELSE 0 END) 
    / COUNT(DISTINCT A.player_id),2) AS fraction  
FROM Activity A
LEFT JOIN First_Login F
       ON A.player_id = F.player_id
