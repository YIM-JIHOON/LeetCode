-- 고객 id=2가 추천하지 않은 고객의 이름 찾기
SELECT name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL