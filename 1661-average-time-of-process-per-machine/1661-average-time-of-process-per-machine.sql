-- 각 기계별로 프로세스를 완료하는데 걸리는 평균시간 조회 (소수점 이하 3자리까지 반올림)
-- 소요시간 = 'end' timestamp - 'start' timestamp
-- 평균시간 = 총 소요시간 / 프로세스 수

-- 기계별 프로세스별 소요시간
WITH CTE AS (
    SELECT 
        machine_id,
        process_id,
        MAX(timestamp) - MIN(timestamp) AS taken_timestamp
    FROM Activity 
    GROUP BY machine_id, process_id
)

-- 평균 소요시간 계산
SELECT
    machine_id,
    ROUND(SUM(taken_timestamp) / COUNT(process_id), 3) AS processing_time 
FROM CTE
GROUP BY machine_id