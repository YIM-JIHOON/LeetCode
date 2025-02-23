-- 가장 작은 숫자 id를 가진 고유한 이메일 하나만 남기고 모든 중복 이메일을 삭제 (SELECT와 DELETE도 사용)

DELETE P
FROM Person P
JOIN (SELECT MIN(id) AS min_id, email
      FROM Person
      GROUP BY email
     ) AS M 
  ON P.email = M.email
WHERE P.id > M.min_id