-- 사용자별 팔로워수 조회 (user_id 기준 오름차순)
SELECT 
    user_id,
    COUNT(user_id) AS followers_count
FROM Followers
GROUP BY 1
ORDER BY 1