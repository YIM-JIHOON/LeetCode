-- 각 사람의 이름, 성, 도시, 주를 조회 (Address 테이블에 personId가 없으면 주소는 null로 출력)

SELECT 
    P.firstName,
    P.lastName,
    A.city,
    A.state
FROM Person P
LEFT JOIN Address A
       ON A.personId = P.personId