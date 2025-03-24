-- 각 사용자가 이동한 거리를 조회
-- travelled_distance 기준 내림차순, name 기준 오름차순으로 정렬

WITH sum_distance AS (
    SELECT 
        user_id, 
        SUM(distance) AS distance
    FROM Rides 
    GROUP BY user_id
)

SELECT 
    U.name, 
    COALESCE(D.distance, 0) AS travelled_distance 
FROM Users U
LEFT JOIN sum_distance D
       ON U.id = D.user_id
ORDER BY D.distance DESC, U.name ASC