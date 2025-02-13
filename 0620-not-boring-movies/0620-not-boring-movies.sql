-- ID가 홀수이면서, description이 boring이 아닌 영화를 조회 (rating 내림차순으로 정렬)
SELECT 
    id,
    movie,
    description,
    rating
FROM Cinema 
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC