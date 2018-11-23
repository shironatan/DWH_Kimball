SELECT
	table_schema, ROUND(SUM(data_length + index_length) / 1024, 1) AS 'size(KB)'
	FROM
		information_schema.tables
	WHERE
		table_schema = 'Kimball_DWH'
	GROUP BY
		table_schema;
