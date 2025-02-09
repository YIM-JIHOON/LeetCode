-- 자신의 기사를 하나라도 본적이 있는 저자를 모두 조회 (id 기준 오름차순)
SELECT DISTINCT author_id AS id
FROM Views 
WHERE author_id = viewer_id 