--Задание 2.Создание запроса, использующего внутреннее объединение
--1.	Создайте запрос, который возвращает регистрационные номера сотрудников (поле LoginID таблицы HumanResources.Employee), являющихся продавцами.
--2.	Используйте внутреннее объединение таблиц HumanResources.Employee и Sales.SalesPerson базы данных AdventureWorks2008 по полю BusinessEntityID.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select Top 5 *
	From HumanResources.Employee;
Go
Select Top 5 *
	From Sales.SalesPerson;
Go

Select e.LoginID
	From HumanResources.Employee As e
	Inner Join Sales.SalesPerson As sp
	On e.BusinessEntityID = sp.BusinessEntityID;
Go