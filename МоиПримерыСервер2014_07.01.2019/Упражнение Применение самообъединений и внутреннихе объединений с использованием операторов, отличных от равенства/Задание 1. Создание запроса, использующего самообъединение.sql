--Задание 1. Создание запроса, использующего самообъединение
--1.	Создайте запрос, который возвращает список всех продуктов (поле ProductID) из таблицы Purchasing.ProductVendor и всех их поставщиков (поле BusinessEntityID).
--2.	Используйте самообъединение для таблицы Purchasing.ProductVendor по полю ProductID.
--3.	Необходимо выбрать все строки из таблицы Purchasing.ProductVendor с одинаковыми значениями ProductID, но разными значениями BusinessEntityID 
--      (используйте оператор, отличный от равенства).
--4.	Отсортируйте результирующий набор по полю ProductID.
--5.	Выполните запрос и просмотрите результаты.

-- Purchasing - покупка.
-- ProductVendor - продавец продукта.

Use AdventureWorks2014;
Go

Select ProductID,BusinessEntityID	
	From Purchasing.ProductVendor;
Go
-- Все строки из таблицы Purchasing.ProductVendor с одинаковыми значениями ProductID, но разными значениями BusinessEntityID 
Select pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
		Inner Join Purchasing.ProductVendor As pv2
		On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
		Order By pv1.ProductID;
Go