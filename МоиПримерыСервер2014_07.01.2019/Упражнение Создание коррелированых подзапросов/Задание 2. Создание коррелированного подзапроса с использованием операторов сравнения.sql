--«адание 2. —оздание коррелированного подзапроса с использованием операторов сравнени€
--1.	—оздайте запрос с коррелированным подзапросом, который возвращает список идентификаторов продуктов и количества продаж 
--      (пол€ ProductID и OrderQty таблицы Sales.SalesOrderDetail) дл€ продуктов, количество продаж дл€ которых меньше среднего количества продаж дл€ этих продуктов.
--2.	¬ыполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select *
	From Sales.SalesOrderDetail;
Go

Select ProductID,OrderQty
	From Sales.SalesOrderDetail s1
		Where OrderQty <
			(Select AVG(OrderQty)
				From Sales.SalesOrderDetail s2
					Where s2.ProductID = s1.ProductID);
Go
