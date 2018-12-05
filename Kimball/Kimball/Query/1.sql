use Kimball_DWH;
SELECT Date.Day_week AS 曜日, SUM(Sale_number) AS 作品数, AVG(Sale_number_count) AS 売上数値平均
FROM Sale
INNER JOIN Date ON Sale.Date_key = Date.Date_key
GROUP BY 曜日
ORDER BY 売上数値平均 desc;
