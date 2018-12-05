use Kimball_DWH;
SELECT Category.Category1_name AS 原作分類, Date.Term AS クール, Official_tweet.Tweet AS ツイート数, SUM(Sale_number) AS 作品数, AVG(Sale_number_count) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Date ON Sale.Date_key = Date.Date_key
INNER JOIN Official_tweet ON Sale.Official_tweet_key = Official_tweet.Official_tweet_key
GROUP BY 原作分類, クール, ツイート数
ORDER BY 売上数値平均 desc;
