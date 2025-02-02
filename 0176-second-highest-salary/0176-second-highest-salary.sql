-- 두번째로 높은 급여를 받는 Employee 찾기 (중복X) (두번째로 높은 급여가 없으면 null을 반환)

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee)