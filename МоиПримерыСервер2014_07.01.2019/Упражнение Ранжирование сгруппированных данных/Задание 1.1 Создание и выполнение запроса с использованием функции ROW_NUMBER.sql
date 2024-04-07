--Задание 1. Создание и выполнение запроса с использованием функции ROW_NUMBER
--1.	Создайте запрос, который возвращает номер строки по полю SalesYTD, а также поля SalesPersonID и SalesYTD из таблицы Sales.SalesPerson. 
--      Create a query that returns numbered rows for the Sales.SalesPerson table.
--2.	Используйте функцию ROW_NUMBER.
--3.	Результирующий набор должен включать только те записи из таблицы Sales.SalesPerson, для которых поле TerritoryID содержит значение, отличное от значения NULL, 
--      а значение поля SalesLastYear не равно 0.
--4.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select *
	From Sales.SalesPerson;
Go

Select Row_Number() Over (Order By SalesYTD) As N'Продажи за год', BusinessEntityID As N'Номер предпринимателя', SalesYTD, SalesLastYear 
	From Sales.SalesPerson
		Where TerritoryID Is Not Null And  SalesLastYear <> 0;
Go