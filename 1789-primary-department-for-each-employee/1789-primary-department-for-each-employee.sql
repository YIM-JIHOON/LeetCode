-- 모든 직원의 주부서를 조회 (직원이 한부서에만 소속된 경우 주부서는 'N')

-- 한부서에만 소속된 직원과 부서
SELECT employee_id, department_id 
FROM Employee 
GROUP BY employee_id 
HAVING COUNT(employee_id) < 2

UNION ALL

-- 여러부서에 소속된 직원과 주부서
SELECT employee_id, department_id 
FROM Employee 
WHERE primary_flag = 'Y'