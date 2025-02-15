-- 대학에서 각 교사가 가르치는 고유한 과목수를 조회

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id