--Задание 2. Создание запроса, использующего самообъединение и ключевое слово DISTINCT
--1.	Измените запрос, созданный в Задании 1 так, чтобы исключить из результирующего набора повторяющиеся записи. Используйте для этого слово DISTINCT
--2.	Выполните запрос и просмотрите результаты.

-- Purchasing - покупка.
-- Product Vendor - продавец продукта. 
Use AdventureWorks2014;
Go

Select *
	From Purchasing.ProductVendor;
Go
-- Исключает из результирующего набора повторяющиеся записи.
-- До.
Select pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
	Inner Join Purchasing.ProductVendor As pv2
	On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
	Order By pv1.ProductID;
Go
-- После.
Select Distinct pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
	Inner Join Purchasing.ProductVendor As pv2
	On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
	Order By pv1.ProductID;
Go	 
