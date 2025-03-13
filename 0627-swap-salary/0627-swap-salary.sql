-- 임시 테이블 없이 성별의 모든 'f'를 'm'으로, 'm'을 'f'로 변경

UPDATE Salary
SET sex = CASE 
            WHEN sex = 'f' THEN 'm'
            WHEN sex = 'm' THEN 'f'
          END