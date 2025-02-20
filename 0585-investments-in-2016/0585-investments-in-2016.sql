-- 2016년 모든 보험 계약자에 대한 총 투자가치의 합계 조회 (소수 둘째 자리까지 반올림)
-- 다른 1명 이상의 보험 계약자와 동일한 tiv_2015를 갖고 있으며, lat과 lon 속성은 고유해야함

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) IN (SELECT lat, lon
                     FROM Insurance
                     GROUP BY lat, lon
                     HAVING COUNT(*) = 1
                    )
  AND tiv_2015 IN (SELECT tiv_2015
                   FROM Insurance
                   GROUP BY tiv_2015
                   HAVING COUNT(*) > 1
                  )