-- 100명 이상 방문한 연속된 id 3개 이상의 구간을 찾아서 해당 레코드를 모두 출력
-- id는 날짜 순서대로 증가
-- people >= 100인 연속된 id가 3개 이상인 구간만 추출.
-- visit_date 오름차순으로 정렬.

WITH Filtered AS (
    SELECT *
    FROM Stadium
    WHERE people >= 100
),
ConsecutiveGroups AS (
    SELECT *,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Filtered
),
ValidGroups AS (
    SELECT grp
    FROM ConsecutiveGroups
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
SELECT id, visit_date, people
FROM ConsecutiveGroups
WHERE grp IN (SELECT grp FROM ValidGroups)
ORDER BY visit_date;
