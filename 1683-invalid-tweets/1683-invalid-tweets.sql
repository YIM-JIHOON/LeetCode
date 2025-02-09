-- 유효하지 않은 트윗의 ID를 찾기 (트윗의 내용에 사용된 문자수가 15 초과면 트윗이 유효하지 않음)
SELECT tweet_id 
FROM Tweets 
WHERE LENGTH(content) > 15