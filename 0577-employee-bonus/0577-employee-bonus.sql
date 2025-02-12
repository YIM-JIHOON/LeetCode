-- 보너스가 1000 미만인 각 직원의 이름과 보너스 금액을 조회

SELECT 
    E.name,
    B.bonus
FROM Employee E
LEFT JOIN Bonus B
       ON E.empId = B.empId 
WHERE B.bonus < 1000 OR B.bonus IS NULL