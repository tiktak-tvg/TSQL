--Задание 2. Создание и выполнение запроса, вычисляющего среднее значение для сгруппированных записей таблицы, соответствующих условию
--1.	Создайте запрос к таблице Production.Product базы данных AdventureWorks2014, который возвращает цвет (поле Color) и среднюю цена (поле ListPrice) для продукта 'FR-R72R-58' (значение в поле ProductNumber).
--2.	Используйте функцию AVG и предложение GROUP BY.
--3.	Используйте предложение WHERE для отображения записей, соответствующих условию.
--4.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select Color, AVG(ListPrice)
	From Production.Product	
		Where ProductNumber Like 'FR-R72R-58%'
	Group By Color;
Go