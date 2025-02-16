-- 가장 큰 단일 숫자 조회 (단일 숫자가 없으면 null을 출력)

-- 단일 숫자만 조회
WITH CTE AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1 
)

SELECT MAX(num) AS num
FROM CTE