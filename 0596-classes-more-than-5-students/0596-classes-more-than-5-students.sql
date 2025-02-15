-- 최소 5명의 학생이 있는 모든 학급을 조회
SELECT class
FROM Courses 
GROUP BY class
HAVING COUNT(class) >= 5