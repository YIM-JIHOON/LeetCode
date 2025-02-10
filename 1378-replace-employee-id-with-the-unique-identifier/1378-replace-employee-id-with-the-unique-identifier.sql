-- 각 사용자의 고유 ID를 조회 (고유ID가 없으면 null만 조회)
SELECT
    U.unique_id,
    E.name
FROM Employees E
LEFT JOIN EmployeeUNI U
       ON E.id = U.id