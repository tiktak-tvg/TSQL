--Задание 6. Создание и выполнение запроса с использованием предложения COMPUTE
--1.	Создайте запрос, который выбирает поля SalesOrderID, UnitPrice и UnitPriceDiscount и суммирует информацию из таблицы Sales.SalesOrderDetail, используя предложение COMPUTE.
--2.	Используйте функцию SUM для полей UnitPrice и UnitPriceDiscount в предложении COMPUTE.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select SalesOrderID, UnitPrice, UnitPriceDiscount
	From Sales.SalesOrderDetail
	Order By SalesOrderID
	Compute sum(UnitPrice), sum(UnitPriceDiscount) by SalesOrderID
Go

SELECT ProductID, LineTotal 
	FROM Sales.SalesOrderDetail 
		WHERE UnitPrice < $5.00
			ORDER BY ProductID, LineTotal 
			COMPUTE SUM(LineTotal) BY ProductID;
Go
-- В MS SQL 2014 не поддерживается, только в MS SQL 2008.