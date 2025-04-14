-- 유효한 일련번호 패턴이 포함된 모든 제품을 조회
-- 일련번호는 설명 내에 있어야 하며, 반드시 처음부터 시작할 필요는 없음
-- SN으로 시작하며, 하이픈 뒤에 정확히 4숫자가 나와야 함
-- product_id 기준 오름차순 정렬

SELECT *
FROM products
WHERE description REGEXP 'SN[0-9]{4}-[0-9]{4}([^0-9]|$)'
ORDER BY product_id