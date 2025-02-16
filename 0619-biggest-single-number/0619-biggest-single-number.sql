-- 가장 큰 단일값 조회 (단일 숫자가 없으면 null을 출력)

SELECT MAX(num) AS num  -- 가장 큰 단일값 조회
FROM MyNumbers
WHERE num IN (  -- 단일값만 필터 
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    )