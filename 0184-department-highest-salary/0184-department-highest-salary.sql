-- 각 부서에서 가장 높은 급여를 받는 직원 조회

SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary AS Salary
FROM Employee E
JOIN Department D
  ON E.departmentId = D.id
WHERE (E.salary, E.departmentId) IN (SELECT MAX(salary), departmentId
                                     FROM Employee
                                     GROUP BY departmentId
                                     )