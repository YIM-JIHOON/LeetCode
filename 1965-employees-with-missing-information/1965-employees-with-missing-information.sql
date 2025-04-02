-- 누락된 정보(name나 salary)가 있는 모든 직원의 ID 조회 (employee_id 기준 오름차순 정렬)

SELECT employee_id
FROM Employees
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)

UNION ALL

SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id