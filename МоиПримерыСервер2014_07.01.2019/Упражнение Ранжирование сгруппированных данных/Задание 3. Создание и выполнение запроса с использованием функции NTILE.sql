--Задание 3. Создание и выполнение запроса с использованием функции NTILE
--1.	Создайте запрос, который возвращает поля SalesYTD и BusinessEntityID из таблицы Sales.SalesPerson.
--2.	Используйте функцию NTILE по полю SalesYTD, чтобы разделить результирующий набор на 4 секции и определите сортировку по убыванию.
--3.	Результирующий набор должен включать только те записи из таблицы Sales.SalesPerson, для которых поле TerritoryID содержит значение, отличное от значения NULL, а значение поля SalesYTD не равно 0.
--4.	Выполните запрос и просмотрите результаты.
Use AdventureWorks2014;
Go

Select *
	From Sales.SalesPerson;
Go
-- Разделяем результирующий набор на 4 секции и определите сортировку по убыванию.
Select NTile(4) Over (Order By SalesYTD) As N'Продажи с начала года', BusinessEntityID As N'Предпринимательская деятельность' 
	From Sales.SalesPerson
		Order By SalesYTD DESC;
Go