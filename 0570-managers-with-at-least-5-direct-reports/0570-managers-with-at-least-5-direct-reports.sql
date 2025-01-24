WITH CTE AS (
SELECT managerId
FROM Employee
GROUP BY managerId
HAVING COUNT(managerId) >= 5
)

SELECT name
FROM Employee E
JOIN CTE C
  ON E.id = C.managerId


