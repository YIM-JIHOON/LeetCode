-- 이름의 첫 글자만 대문자로, 나머지는 소문자로 만들기 (user_id 기준 오름차순 정렬)

SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name FROM 2))) AS name
FROM Users 