--Задание 4. Создание и выполнение запроса для групировки данных и статической обработки сумм.
--1.	Создайте запрос к таблице Production.ProductInventory базы данных AdventureWorks2014, который возвращает поля ProductID, Shelf и общую сумму по полю Quantity для групп продуктов.
--2.	Используйте предложение GROUP BY с оператором ROLLUP для подсчета результатов по группам и общего результата.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select ProductID As N'Номер', IsNull(Shelf,N'-') As N'Полка', Sum(Quantity) As N'Общяя сумма по полю' 
	From Production.ProductInventory		
		Group By RollUP(ProductID,Shelf)		
Go

Select ProductID As N'Номер', IsNull(Shelf,N'Нет значения') As N'Полка', Sum(Quantity) As N'Общая сумма по полю' From Production.ProductInventory
	Rollup 
	Group By Rollup(ProductID,Shelf);
Go