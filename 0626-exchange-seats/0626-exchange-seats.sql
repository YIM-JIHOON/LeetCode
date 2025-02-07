-- 연속된 두 학생의 좌석 ID를 교환하는 쿼리 작성 (id 기준으로 오름차순 나열)
-- 학생의 수가 홀수면 마지막 학생의 ID는 교환되지 않음

SELECT 
    CASE 
     WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
     WHEN id % 2 = 0 THEN id - 1
     ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id