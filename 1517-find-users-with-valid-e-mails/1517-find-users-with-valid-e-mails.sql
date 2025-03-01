-- 접두사와 도메인이 있는 이메일을 가진 사용자 조회
-- 문자로 시작하며, 문자, 숫자, '_', '.', '-' 포함 가능하고, '@leetcode.com'로 끝나는 정규식

SELECT 
    user_id, 
    name, 
    mail
FROM Users 
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'


-- ^ → 문자열 시작
-- [a-zA-Z] → 알파벳으로 시작 (대소문자 포함)
-- [a-zA-Z0-9_.-]* → 알파벳, 숫자, '_', '.', '-' 포함 가능 ('*'는 0개 이상)
-- @leetcode\\.com$ → @leetcode.com으로 끝남 ('\.'는 '.'문자 그대로를 의미)