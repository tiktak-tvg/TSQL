--Задание 2. Ограничение результатов запросов с помощью оператора EXCEPT
--1.	Создайте запрос, который возвращает список всех идентификаторов продуктов (поле ProductID) из таблицы Production.Product), которые отсутствуют в таблице Production.WorkOrder.
--2.	Используйте оператор EXCEPT.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select ProductID
	From Production.Product;
Go

Select ProductID
	From Production.WorkOrder;
Go
-- оператор EXCEPT.
Select ProductID
	From Production.Product
Except
Select ProductID
	From Production.WorkOrder;
Go