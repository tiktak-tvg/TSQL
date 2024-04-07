--Задание 3. Ограничение результатов запросов с помощью оператора INTERSECT 
--1.	Создайте запрос, который возвращает список всех различных идентификаторов продуктов (поле ProductID) из таблиц Production.Product) и Production.WorkOrder.
--2.	Используйте оператор INTERSECT.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select ProductID
	From Production.Product;
Go

Select ProductID
	From Production.WorkOrder;
Go
-- оператор INTERSECT.
Select ProductID
	From Production.Product
InterSect
Select ProductID
	From Production.WorkOrder;
Go