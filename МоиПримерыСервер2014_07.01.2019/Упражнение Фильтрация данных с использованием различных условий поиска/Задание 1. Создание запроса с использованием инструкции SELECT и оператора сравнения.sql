--Задание 1: Создание запроса с использованием инструкции SELECT и оператора сравнения.
--1.	Создайте новый запрос, нажав на панели инструментов кнопку New Query.
--2.	В окне запроса введите текст запроса, который выбирает поля ProductNumber, Name, ListPrice, Color, Size и Weight из таблицы Production.Product базы данных AdventureWorks2014 для продуктов, цена которых (поле ListPrice) ниже $100.
--3.	Выполните запрос, нажав на панели инструментов кнопку Execute.
--4.	Просмотрите результаты запроса.
Use AdventureWorks2014;
Go
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес' 
	From Production.Product
		Where ListPrice <= 102;
GO