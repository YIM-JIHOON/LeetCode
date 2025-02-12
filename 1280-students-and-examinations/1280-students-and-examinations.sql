-- 각 학생이 각 시험에 참가한 횟수 조회 (student_id, subject_name 기준으로 정렬)
-- 학생과 과목의 전체 조합 만들고, 시험 테이블과 조인
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name