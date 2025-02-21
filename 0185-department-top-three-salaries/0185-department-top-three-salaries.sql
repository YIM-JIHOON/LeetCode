-- 각 부서의 상위 3명의 고소득자 조회 (공동 순위 인정)

-- 직원 테이블에서 부서별 소득 높은 순으로 나열
WITH SALARY_RANK AS (
    SELECT
        id,
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
    FROM Employee
)
-- 부서 테이블과 조인하고, 그룹별 갯수제한
SELECT 
    D.name AS Department,
    R.name AS Employee,
    R.salary AS Salary 
FROM SALARY_RANK R
JOIN Department D
  ON R.departmentId = D.id
WHERE R.salary_rank <= 3
