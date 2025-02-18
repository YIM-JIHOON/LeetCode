-- 급여가 $30000 미만이면서, 관리자가 회사를 떠난 직원ID 조회 (employee_id 기준 정렬)
-- (관리자가 회사를 떠나면 employee_id는 삭제되지만, manager_id는 그대로 남음)

SELECT employee_id 
FROM Employees
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
  AND salary < 30000
ORDER BY employee_id