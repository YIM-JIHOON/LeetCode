-- 각 주식에 대한 자본 이득/손실을 조회

WITH Stocks_total_buy AS (
    SELECT 
        stock_name,
        SUM(price) AS price
    FROM Stocks
    WHERE operation = 'Buy'
    GROUP BY stock_name    
),

Stocks_total_sell AS (
    SELECT 
        stock_name,
        SUM(price) AS price
    FROM Stocks
    WHERE operation = 'Sell'
    GROUP BY stock_name    
)

SELECT 
    B.stock_name,
    - (B.price - S.price) AS capital_gain_loss 
FROM Stocks_total_buy B
JOIN Stocks_total_sell S
  ON B.stock_name = S.stock_name
GROUP BY stock_name    