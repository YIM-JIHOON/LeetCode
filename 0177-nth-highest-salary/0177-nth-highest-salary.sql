-- 가장 높은 n번째 급여 조회 
-- 가장 높은 n번째 급여가 없으면 null을 반환

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (SELECT DISTINCT salary 
          FROM Employee 
          ORDER BY salary DESC 
          LIMIT 1 OFFSET N-1
  );
END