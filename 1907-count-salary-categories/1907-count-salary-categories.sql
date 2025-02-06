-- Low Salary는 $20000 미만
-- Average Salary는 모든 급여는 $20000 이상 $50000 이하
-- High Salary는 $50000 초과
-- 결과 테이블에는 세 가지 범주가 모두 포함 되어야함
-- 범주에 계정이 없으면 0을 반환합니다

-- CTE로 임시의 가상 테이블 만들기
WITH SalaryTable AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),

-- 각 카테고리별 계정을 먼저 집계
AccountCount AS (
SELECT 
    CASE
     WHEN income > 50000 THEN 'High Salary'
     WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
     WHEN income < 20000 THEN 'Low Salary'
    END AS category,
    COUNT(account_id) AS accounts_count 
FROM Accounts 
GROUP BY category
)

-- 테이블 조인
SELECT
    S.category,
    COALESCE(A.accounts_count,0) AS accounts_count
FROM SalaryTable S
LEFT JOIN AccountCount A
       ON S.category = A.category