-- 특정 기간(2013-10-01 ~ 2013-10-03)동안 발생한 택시 호출(Trips 테이블)의 취소율(Cancellation Rate)을 구하는 SQL 쿼리를 조회
-- 취소율을 계산할 때 차단된(banned) 사용자의 요청은 제외

WITH valid_trips AS (
    -- 클라이언트와 드라이버가 모두 차단되지 않은 경우만 필터링
    SELECT t.id, t.request_at, t.status
    FROM Trips t
    JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No'
    JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT 
    request_at AS Day,
    ROUND(
        SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) 
        / COUNT(*), 
        2
    ) AS `Cancellation Rate`
FROM valid_trips
GROUP BY request_at