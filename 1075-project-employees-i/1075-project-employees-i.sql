-- 각 프로젝트별 참여 직원의 평균 근속연수 조회 (소수 둘째자리까지 반올림)

SELECT
    P.project_id,
    ROUND(AVG(E.experience_years),2) AS average_years 
FROM Project P
LEFT JOIN Employee E
       ON P.employee_id = E.employee_id
GROUP BY 1