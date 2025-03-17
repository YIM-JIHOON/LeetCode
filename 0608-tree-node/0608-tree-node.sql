-- 트리의 각 노드 유형을 조회
-- Leaf: 노드가 리프 노드인 경우
-- Root: 노드가 트리의 루트인 경우
-- Inner: 노드가 리프 노드도 아니고 루트 노드도 아닌 경우

SELECT 
    id,
    CASE 
     WHEN p_id IS NULL THEN 'Root'
     WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
     ELSE 'Leaf'
    END AS type
FROM Tree