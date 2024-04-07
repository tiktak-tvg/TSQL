--Задание 2. Создание запроса с использованием инструкции SELECT и предложение IS NULL.
--1.	Измените запрос, созданный в Задании 1 так, чтобы использовать предложение IS NULL для выборки записей, имеющих значение NULL в поле ProductLine.
--2.	Выполните запрос.
--3.	Просмотрите результаты запроса и отметьте количество возвращаемых запросом записей и данные, которые отображаются в ProductLine.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight]
	From Production.Product	
		Where ProductLine Is NULL;
Go