-- 각 사람의 이름, 성, 도시, 주를 조회 (personId가 없으면 null 출력)
SELECT
    P.firstName,
    P.lastName,
    A.city,
    A.state
FROM Person P
LEFT JOIN Address A
       ON P.personId = A.personId
