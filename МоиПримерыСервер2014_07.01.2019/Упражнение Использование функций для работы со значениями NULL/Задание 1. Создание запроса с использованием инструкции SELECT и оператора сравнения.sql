--Задание 1: Создание запроса с использованием инструкции SELECT и оператора сравнения.
--1.	Создайте новый запрос, который выбирает поля ProductNumber, Name и Weight из таблицы Production.Product базы данных AdventureWorks2014 для записей, 
--      в которых поле ProductLine содержит значения NULL. Используйте оператор «=» для сравнения значений поля с NULL.
--2.	Выполните запрос и отметьте количество возвращаемых запросом записей.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight]
	From Production.Product	
		Where ProductLine = NULL;
Go