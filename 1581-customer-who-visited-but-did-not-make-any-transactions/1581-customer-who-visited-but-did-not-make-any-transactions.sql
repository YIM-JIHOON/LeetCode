-- 거래없이 방문한 ID와 횟수 조회
SELECT
    V.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T
       ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY 1