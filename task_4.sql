SELECT DISTINCT "Фамилия", "Имя", "Отчество", "Телефон" INTO TEMPORARY temp_table
	FROM (
		SELECT APP.ID_statement as "ID заявления", APP.ID_client as "ID клиента", APP.product_name as "Продукт", "Фамилия", "Имя", "Отчество", "Сотовый телефон" as "Телефон"
		FROM APP
		INNER JOIN (
			SELECT *
			FROM CROSSTAB(
			$$
				SELECT QQ.ID_client ID_client, Question.ID_question, QQ.answer answer
				FROM Question
				INNER JOIN QQ ON Question.ID_question = QQ.ID_question
				ORDER BY QQ.ID_client
			$$,
			$$
				SELECT Question.ID_question
				FROM Question
			$$
			) as pivot (
				ID_client INT,
				"Фамилия" TEXT,
				"Имя" TEXT,
				"Отчество" Text,
				"Сотовый телефон" Text,
				"E-mail" Text,
				"Адрес" Text
			)
		) as t1 ON t1.ID_client = APP.ID_client
		ORDER BY "ID заявления"
	) as t2
;
SELECT DISTINCT t3."Фамилия", "Имя", "Отчество", "Телефон"
FROM temp_table
RIGHT JOIN (
	SELECT "Фамилия"
	FROM temp_table
	GROUP BY "Фамилия"
	HAVING COUNT(*) > 1
) as t3 ON t3."Фамилия" = temp_table."Фамилия"
;
