-- 중복인 모든 이메일을 조회

SELECT email AS Email
FROM Person 
GROUP BY email
HAVING COUNT(*) >= 2