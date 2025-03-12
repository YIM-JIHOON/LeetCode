-- RED 회사와 관련된 주문이 없는 모든 영업사원 이름을 조회

SELECT S.name
FROM SalesPerson S
WHERE S.sales_id NOT IN (SELECT O.sales_id
                         FROM Orders O
                         JOIN Company C 
                           ON O.com_id = C.com_id
                         WHERE C.name = 'RED'
                         )