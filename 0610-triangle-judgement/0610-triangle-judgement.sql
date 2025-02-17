-- 세개의 선이 삼각형을 형성할 수 있는지 조회 (두 변의 길이의 합이 다른 한 변의 길이보다 커야함)

SELECT
    x,
    y,
    z,
    CASE
     WHEN (x + y) > z AND (x + z) > y AND (y + z) > x THEN 'Yes'
     ELSE 'No'
    END AS 'triangle'
FROM Triangle