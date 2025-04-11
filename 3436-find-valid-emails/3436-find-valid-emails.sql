-- 유효한 모든 이메일 주소를 조회
-- 정확히 하나의 '@'가 포함되어 있고, '.com'으로 끝나야함
-- '@' 앞부분 에는 영숫자와 밑줄만 포함되어야 함
-- '@' 뒤와 앞부분 에는 문자만 포함된 '.com' 도메인 이름이 포함되어야 함
-- user_id 기준 오름차순 정렬

SELECT user_id, email
FROM Users
WHERE email REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z]+\\.com$'
ORDER BY user_id