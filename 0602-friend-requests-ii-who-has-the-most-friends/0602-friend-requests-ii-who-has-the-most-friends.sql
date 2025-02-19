-- 가장 많은 친구를 가진 사람과 가장 많은 친구 번호 조회

WITH FRIENDS AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)

SELECT id, COUNT(*) AS num
FROM FRIENDS
GROUP BY id
ORDER BY num DESC
LIMIT 1