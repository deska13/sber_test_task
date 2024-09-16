SELECT "ID заявления", "Продукт", "Почтовый индекс"
FROM (
	SELECT APP.ID_statement as "ID заявления", APP.product_name as "Продукт", SUBSTRING("Адрес", 0, 7) as "Почтовый индекс"
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
WHERE 
  "Почтовый индекс" = '355016'
;

