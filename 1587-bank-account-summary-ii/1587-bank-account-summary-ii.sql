-- 잔액이 10000원 보다 높은 사용자의 이름과 잔액을 조회 
-- 계정의 잔액은 해당 계정과 관련된 모든 거래 금액의 합계와 같음

WITH Balance AS (
SELECT
    account,
    SUM(amount) AS balance
FROM Transactions
GROUP BY account 
HAVING SUM(amount) > 10000
)

SELECT
    U.name,
    B.balance
FROM Users U
JOIN Balance B
  ON U.account = B.account