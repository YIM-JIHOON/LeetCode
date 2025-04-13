-- IP 주소의 유효성을 검사하고, 잘못된 IP의 발생 횟수를 조회

-- 옥텟(octet) 수가 4개가 아님
-- 옥텟 중 1개라도 255보다 큰 값이 있음
-- 옥텟 중 2자리 이상이고 '0'으로 시작하는 경우

SELECT
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE
    -- 옥텟 개수가 4개가 아님
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3

    -- 또는: 옥텟 중 하나라도 255 초과
    OR CAST(SUBSTRING_INDEX(ip, '.', 1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(ip, '.', -1) AS UNSIGNED) > 255

    -- 또는: 옥텟 중에 '01', '001' 등과 같이 leading zero가 있음
    OR SUBSTRING_INDEX(ip, '.', 1) REGEXP '^0[0-9]+'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) REGEXP '^0[0-9]+'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) REGEXP '^0[0-9]+'
    OR SUBSTRING_INDEX(ip, '.', -1) REGEXP '^0[0-9]+'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC