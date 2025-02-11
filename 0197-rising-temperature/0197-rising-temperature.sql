-- 어제보다 온도가 더 높은 모든 날짜의 id를 조회
SELECT A.id
FROM Weather A
LEFT JOIN Weather B 
       ON DATEDIFF(A.recordDate, B.recordDate) = 1
WHERE A.temperature > B.temperature