-- 모든 관리자들의 ID, 이름, 보고 직원수, 평균 연령 조회 (가장 가까운 정수로 반올림) (employee_id 기준 오름차순)
-- 관리자는 자신에게 보고하는 다른 직원이 최소 1명 있는 직원으로 간주

-- 셀프조인으로 테이블 병합
SELECT 
    B.employee_id,
    B.name,
    COUNT(A.reports_to) AS reports_count,
    ROUND(SUM(A.age)/COUNT(A.reports_to),0) AS average_age 
FROM Employees A
JOIN Employees B
  ON A.reports_to = B.employee_id 
GROUP BY 1, 2 
ORDER BY employee_id