-- 연속해서 3번 이상 나오는 모든 숫자 찾기

SELECT DISTINCT A.num AS ConsecutiveNums
FROM Logs A
JOIN Logs B 
  ON A.id = B.id - 1
JOIN Logs C 
  ON B.id = C.id - 1
WHERE A.num = B.num 
  AND B.num = C.num