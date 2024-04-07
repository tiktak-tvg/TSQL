--Задание 5. Создание и выполнение запроса для генерирования суммарных значений
--1.	Создайте запрос к таблице Sales.SalesOrderDetail базы данных AdventureWorks2014, который возвращает поля SalesOrderID, ProductID и 
--      суммирует информацию по продажам (сумма по полю OrderQty).
--2.	Используйте оператор CUBE с полями SalesOrderID и ProductID.
--3.	Результирующий набор должен быть отсортирован по полям SalesOrderID и ProductID.
--4.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select SalesOrderID, ProductID, Sum(OrderQty)
	From Sales.SalesOrderDetail
		Group By Cube(SalesOrderID,ProductID);
Go

Select SalesOrderID As N'НомерПродажи',ProductID As 'Номер',Sum(OrderQty) As N'Сумма' From Sales.SalesOrderDetail
	Group By Cube(SalesOrderID,ProductID);
Go