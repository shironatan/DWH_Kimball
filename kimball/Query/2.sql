use Kimball_DWH;
SELECT Category.Category1_name AS 原作分類, Stories.Term_number AS クール, SUM(Sale_number) AS 作品数, AVG(Sale_number_count) AS 売上数値平均
FROM Sale
INNER JOIN Category ON Sale.Category_key = Category.Category_key
INNER JOIN Stories ON Sale.Stories_key = Stories.Stories_key
GROUP BY 原作分類, クール
ORDER BY 売上数値平均 desc;
