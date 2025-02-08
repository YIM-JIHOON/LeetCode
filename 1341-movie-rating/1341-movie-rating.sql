(
    -- 가장 많은 영화를 평가한 사용자의 이름 찾기
    SELECT U.name AS results
    FROM MovieRating R
    JOIN Users U ON R.user_id = U.user_id
    GROUP BY U.user_id, U.name
    ORDER BY COUNT(R.movie_id) DESC, U.name ASC
    LIMIT 1
)
UNION ALL
(
    -- 2020년 2월에서 가장 높은 평균 평점을 가진 영화 찾기
    SELECT M.title AS results
    FROM MovieRating R
    JOIN Movies M ON R.movie_id = M.movie_id
    WHERE YEAR(R.created_at) = 2020 AND MONTH(R.created_at) = 2
    GROUP BY M.movie_id, M.title
    ORDER BY AVG(R.rating) DESC, M.title ASC
    LIMIT 1
)