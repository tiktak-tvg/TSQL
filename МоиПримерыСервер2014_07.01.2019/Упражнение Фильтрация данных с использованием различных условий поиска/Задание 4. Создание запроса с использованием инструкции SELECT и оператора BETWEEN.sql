--Задание 4: Создание запроса с использованием инструкции SELECT и оператора BETWEEN.
--1.	Измените запрос, созданный в Задании 3 так, чтобы он возвращал записи из таблицы Production.Product базы данных AdventureWorks2014, для которых:
--o	номер продукта (поле ProductNumber) начинается со строки «SO»
--o	или цена продуктов (поле ListPrice) составляет от $50 до $180, при этом номер таких продуктов начинается со строки «TG».
--2.	Выполните запрос, нажав на панели инструментов кнопку Execute.
--3.	Просмотрите результаты запроса и заметьте, что количество записей, возвращаемых запросом, изменилось и возвращаемые записи отвечают условиям поиска.
Use AdventureWorks2014;
Go
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес' 
	From Production.Product
		Where ProductNumber Like 'SO%' Or ProductNumber Like 'TG%' And ListPrice Between 74 And 180;
Go 