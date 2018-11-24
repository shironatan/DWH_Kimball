use Kimball_DWH;
SELECT D1.Category1_name AS 原作分類, D2.Term_number AS クール数, SUM(F.Sale_number) AS 作品数, TRUNCATE(SUM(F.Sale_number_count)/SUM(F.Sale_number),0) AS 売上数値平均 
	FROM Sale F
INNER JOIN Category D1
	ON F.Category_key = D1.Category_key
INNER JOIN Stories D2
	ON F.Stories_key = D2.Stories_key
GROUP BY 原作分類,クール数
ORDER BY 売上数値平均 desc;

