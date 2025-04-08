-- 다른 날짜에 최소 2번 이상의 같은 과목 시험을 치고, 해당 과목의 최근 점수가 첫번째 점수보다 높은 학생을 조회
-- student_id, subject 기준 오름차순 정렬

WITH FirstScores AS (
    SELECT student_id, subject, score AS first_score
    FROM Scores
    WHERE (student_id, subject, exam_date) IN (
        SELECT student_id, subject, MIN(exam_date)
        FROM Scores
        GROUP BY student_id, subject
    )
),
LatestScores AS (
    SELECT student_id, subject, score AS latest_score
    FROM Scores
    WHERE (student_id, subject, exam_date) IN (
        SELECT student_id, subject, MAX(exam_date)
        FROM Scores
        GROUP BY student_id, subject
    )
)
SELECT f.student_id, f.subject, f.first_score, l.latest_score
FROM FirstScores f
JOIN LatestScores l
ON f.student_id = l.student_id AND f.subject = l.subject
WHERE l.latest_score > f.first_score
ORDER BY f.student_id, f.subject;
