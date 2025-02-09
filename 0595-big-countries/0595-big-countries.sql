-- 큰 나라의 이름, 인구, 면적 조회
-- 면적이 최소 3000000km2 이상이거나, 인구가 적어도 25000000명
SELECT
    name, 
    population,
    area
FROM World
WHERE area >= 3000000 OR population >= 25000000