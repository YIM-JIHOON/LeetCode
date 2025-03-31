-- 각 직원의 보너스를 계산 (employee_id 기준 정렬)
-- 직원 ID가 홀수이고, 직원 이름이 문자 'M'으로 시작하지 않으면 100%, 그외엔 0

SELECT
    employee_id,
    CASE
     WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary
     ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id 