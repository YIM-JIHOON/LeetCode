-- 각 부서의 상위 3명의 고소득자 조회 (공동 순위 인정)

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS Salary_Rank
      FROM Employee
     ) e
JOIN Department d 
  ON e.departmentId = d.id
WHERE e.Salary_Rank <= 3