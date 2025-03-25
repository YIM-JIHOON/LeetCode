-- 각각의 date_id와 make_name에 대해 , 고유한 lead_id와 partner_id의 개수를 조회

SELECT 
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners 
FROM DailySales 
GROUP BY date_id, make_name 