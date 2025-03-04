-- 점수의 순위 조회 (내림차순, 공동순위 인정)

-- DENSE_RANK 사용
SELECT 
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores 
