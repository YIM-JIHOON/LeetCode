-- 각 기계별로 프로세스를 완료하는데 걸리는 평균시간 조회 (소수점 이하 3자리까지 반올림)
-- 소요시간 = 'end' timestamp - 'start' timestamp
-- 평균시간 = 총 소요시간 / 프로세스 수

-- 기계별 소요시간
WITH CTE1 AS (
    SELECT 
        machine_id,
        process_id,
        MAX(timestamp)-MIN(timestamp) AS taken_timestamp
    FROM Activity 
    GROUP BY 1, 2 
),
-- 기계별 프로세스 수
CTE2 AS (
SELECT 
    machine_id,
    COUNT(DISTINCT process_id) AS count_process_id
FROM Activity 
GROUP BY 1
)

SELECT
    A.machine_id,
    ROUND(SUM(A.taken_timestamp) / B.count_process_id, 3) AS processing_time 
FROM CTE1 A
JOIN CTE2 B
  ON A.machine_id = B.machine_id
GROUP BY 1