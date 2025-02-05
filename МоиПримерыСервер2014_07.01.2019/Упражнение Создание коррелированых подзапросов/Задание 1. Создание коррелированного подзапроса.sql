--Задание 1. Создание коррелированного подзапроса
--1.	Создайте запрос с коррелированным подзапросом, который возвращает фамилии и имена сотрудников (поля LastName и FirstName таблицы Person.Person), 
--      бонус которых (поле Bonus таблицы Sales.SalesPerson) превышает $5000.
--2.	Используйте внутреннее объединение таблицы Person.Person с таблицей HumanResources.Employee для получения необходимых полей.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select LastName, FirstName 
	From Person.Person;
Go
Select Bonus 
	From Sales.SalesPerson 
		Where  Bonus = 5000.0;
Go
-- Запрос через объединение.
Select LastName, FirstName 
	From Person.Person pp
	Inner Join Sales.SalesPerson ss
	On pp.BusinessEntityID = ss.BusinessEntityID
		Where Bonus = 5000.0;
Go

-- Запрос с коррелированным подзапросом.
Select LastName, FirstName 
	From Person.Person As pp
	Inner Join HumanResources.Employee  As hre
	On pp.BusinessEntityID = hre.BusinessEntityID
		Where 5000.0 IN
			(Select Bonus
				From Sales.SalesPerson ss
					Where hre.BusinessEntityID = ss.BusinessEntityID);
		
Go
-- Или так.
Select LastName, FirstName
	From Person.Person pp
	Inner Join HumanResources.Employee hr
	On hr.BusinessEntityID = pp.BusinessEntityID
		Where 5000.0 = 
			(Select Bonus
				From Sales.SalesPerson ss
					Where ss.BusinessEntityID = pp.BusinessEntityID);
Go
Select LastName, FirstName
	From Person.Person pp
	Inner Join HumanResources.Employee hr
	On hr.BusinessEntityID = pp.BusinessEntityID
		Where 5000.0 >= 
			(Select Bonus
				From Sales.SalesPerson ss
					Where ss.BusinessEntityID = pp.BusinessEntityID);
Go



		
