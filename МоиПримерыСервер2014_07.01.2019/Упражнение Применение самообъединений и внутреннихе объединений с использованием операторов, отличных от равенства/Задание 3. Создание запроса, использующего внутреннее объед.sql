--Задание 3. Создание запроса, использующего внутреннее объединение с использованием операторов, отличных от равенства
--1.	Создайте запрос, который возвращает список всех подкатегорий продуктов (поле ProductSubcategoryID таблицы Production.Product), имеющих по крайней мере две различные цены менее $15.
--2.	Используйте самообъединение для Production.Product по полю ProductSubcategoryID. 
--3.	Необходимо выбрать все строки из таблицы Production.Product с одинаковыми значениями ProductID, но разными значениями ListPrice (используйте оператор, отличный от равенства).
--4.	Используйте предложение WHERE, чтобы выбрать два различных зачения стоимости (используйте оператор сравнения для поля ListPrice с псевдонимами таблицы Production.Product).
--5.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select *
	From Production.Product;
Go
Select Distinct pv1.ProductSubcategoryID,pv1.ListPrice
	From Production.Product As pv1
		Inner Join Production.Product As pv2
		On pv1.ProductSubcategoryID = pv2.ProductSubcategoryID And pv1.ListPrice <> pv2.ListPrice
		Where pv1.ListPrice < 15 And pv2.ListPrice < 15;
Go