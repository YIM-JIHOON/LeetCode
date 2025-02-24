-- 각 날짜별로 판매된 다양한 제품의 수와 이름 조회 (sell_date 기준 정렬)
-- 각 날짜에 판매된 제품 이름은 사전순으로 정렬 

WITH SortedProducts AS (
    SELECT 
        sell_date, 
        GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products,
        COUNT(DISTINCT product) AS num_sold
    FROM Activities
    GROUP BY sell_date
)
SELECT sell_date, num_sold, products
FROM SortedProducts
ORDER BY sell_date;
