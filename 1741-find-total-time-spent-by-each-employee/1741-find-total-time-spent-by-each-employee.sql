-- 각 직원이 사무실에서 보낸 시간을 분 단위로 조회
-- 직원은 하루동안 2번 이상 출퇴근할 수 있음
-- 사무실에서 보낸 시간은 (out_time - in_time)로 계산

SELECT 
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time 
FROM Employees 
GROUP BY event_day, emp_id