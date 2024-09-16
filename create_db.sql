DROP TABLE APP, Question, QQ;

CREATE TABLE IF NOT EXISTS APP
(
    ID_statement INTEGER NOT NULL,
    ID_client INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Question
(
    ID_question INTEGER PRIMARY KEY,
    quest TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS QQ
(
    ID_customer_survey INTEGER PRIMARY KEY,
    ID_question INTEGER,
    FOREIGN KEY (ID_question) REFERENCES Question (ID_question),
    ID_client INTEGER,
	FOREIGN KEY (ID_client) REFERENCES APP (ID_client),
	answer TEXT NOT NULL
);

INSERT INTO APP (ID_statement, ID_client, product_name)
VALUES
(4701999, 3385358, 'Страхование недвижемости'),
(4702006, 3385366, 'Страхование недвижемости'),
(4702103, 3385318, 'Страхование недвижемости'),
(4702105, 3385320, 'Страхование недвижемости');

INSERT INTO Question (ID_question, quest)
VALUES
(2351, 'Фамилия'),
(2384, 'Имя'),
(2385, 'Отчество'),
(2449, 'Сотовый телефон'),
(2451, 'E-mail'),
(2970, 'Адрес');

INSERT INTO QQ (ID_customer_survey, ID_question, ID_client, answer)
VALUES
(801620538, 2351, 3385358, 'РОМАШКИНА'),
(801620540, 2384, 3385358, 'РОЗА'),
(801620541, 2385, 3385358, 'РЕДИСКОВНА'),
(801620545, 2449, 3385358, '999-1000003'),
(801620546, 2451, 3385358, 'romashkina@poctapochta.ru'),
(801620547, 2970, 3385358, '183038, Мурманская обл, , Мерманск г, Володарского ул, 5674, ААА, БББ, 5689, , 39'),

(801621663, 2351, 3385366, 'КЛЮКОВКИНА'),
(801621665, 2384, 3385366, 'БРУСНИКА'),
(801621666, 2385, 3385366, 'МАЛИНОВНА'),
(801621670, 2449, 3385366, '999-1000005'),
(801621671, 2451, 3385366, 'klukovkinabrusnikamalinovna@pochta.net'),
(801621672, 2970, 3385366, '355016, Ставропольский край, , Ставрополь г, СТ Чапаевец тер, Дружная ул, 1098, ИИИ, РРР, 4530, , 39'),

(801636758, 2351, 3385318, 'РОМАШКИНА'),
(801636760, 2384, 3385318, 'ЛИЛИЯ'),
(801636761, 2385, 3385318, 'РЕДИСКОВНА'),
(801636767, 2970, 3385318, '410001, Саратовская обл, , Саратов г, , 11-15 (общ) (Эксперементальное х-во СГАУ стр, 6785, ААА, ВВВ, 4569, , 39)'),
(801636772, 2449, 3385318, '999-1000013'),
(801636773, 2451, 3385318, 'romashkinalilia@poctapochta.ru'),

(801636976, 2351, 3385320, 'РЕДИСКОВНА'),
(801636977, 2451, 3385320, 'romashkinalilia@poctapochta.ru'),
(801636980, 2384, 3385320, 'ЛИЛИЯ'),
(801636982, 2449, 3385320, '999-1000013'),
(801637017, 2351, 3385320, 'РОМАШКИНА'),
(801637086, 2970, 3385320, '410001, Саратовская обл, , Саратов г, , 11-15 (общ) (Эксперементальное х-во СГАУ стр, 6785, ААА, ВВВ, 4569, , 39)');

CREATE EXTENSION tablefunc;
