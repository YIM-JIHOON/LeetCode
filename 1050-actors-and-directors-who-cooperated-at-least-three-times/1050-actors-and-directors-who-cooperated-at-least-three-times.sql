-- 배우가 감독과 최소 3번 이상 협력한 모든 쌍을 조회

SELECT actor_id, director_id 
FROM ActorDirector 
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3