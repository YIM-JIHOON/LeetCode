-- 각 사용자의 확인율을 구하기 (확인률: 'confirmed' 메시지를 총 메세지 수로 나눈 비율)
-- 확인 메시지를 요청하지 않은 사용자의 확인율은 0 
-- Signups 테이블에서 로그인만한 사용자도 존재!
-- 확인율은 소수점 두 자리까지 반올림

-- ID 별 'confirmed' 메세지 수 구하기
WITH confirmed AS (
SELECT S.user_id, COUNT(*) AS confirmed_message
FROM Confirmations C
LEFT JOIN Signups S
       ON C.user_id = S.user_id 
WHERE C.action = 'confirmed'
GROUP BY S.user_id
),
-- ID 별 전체 메세지 수 구하기 (NULL 포함)
total AS (
SELECT S.user_id, COUNT(*) AS total_message
FROM Confirmations C
LEFT JOIN Signups S
       ON  C.user_id = S.user_id 
GROUP BY S.user_id
)

-- 계산하여 조회
SELECT S.user_id,
       ROUND(COALESCE(C.confirmed_message, 0)*1.0 / COALESCE(T.total_message, 1), 2) AS confirmation_rate
FROM Signups S
LEFT JOIN confirmed C
       ON S.user_id = C.user_id
LEFT JOIN total T
       ON S.user_id = T.user_id