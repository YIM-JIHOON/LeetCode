-- 매니저보다 많이 버는 직원 조회

SELECT B.name AS Employee 
FROM Employee A
JOIN Employee B
  ON A.id = B.managerId 
 AND A.salary < B.salary