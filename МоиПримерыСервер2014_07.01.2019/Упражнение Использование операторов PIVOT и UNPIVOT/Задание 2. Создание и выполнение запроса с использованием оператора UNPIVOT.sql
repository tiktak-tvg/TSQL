--Задание 2. Создание и выполнение запроса с использованием оператора UNPIVOT
--1.	Выполните запрос из Задания 1, сохранив результаты запроса во временной таблице с именем #TbPivot. 
--      Для этого в код запроса между командами SELECT… и FROM… добавьте команду INTO #TbPivot:
--SELECT…
--INTO #TbPivot
--FROM…
--…
--2.	Создайте запрос с использованием оператора UNPIVOT, который преобразует столбцы таблицы #TbPivot в значения столбцов.
--3.	Выполните запрос и просмотрите результаты.
--4.	Закройте среду SQL Server Management Studio.

Use AdventureWorks2014;
Go

Select *
	From Production.Product;
Go

Select DaysToManufacture As N'Дней до производства', AVG(StandardCost) As N'Нормативная стоимость'
	From Production.Product
		Group By DaysToManufacture;
Go
-- CostSortedByProductionDays - Стоимость отсортирована по дням производства
--  Пример Pivot
Select N'Нормативная стоимость' As N'Стоимость отсортирована по дням производства',[0], [1], [2], [3], [4]
	From 
		(Select DaysToManufacture, StandardCost
			From Production.Product) As pp
		Pivot
			(AVG(StandardCost) For DaysToManufacture IN  ([0], [1], [2], [3], [4])) As PivotTable;
Go

Use AdventureWorks2014;
Go

Select DaysToManufacture, StandardCost 
 Into #TbPivot
	From Production.Product;
Go

Select DaysToManufacture, AVG(StandardCost) As 'StandardCost'
	From #TbPivot
		Group By DaysToManufacture;
Go

Select 'StandardCost' As 'DaysToManufacture', [0],[1],[2],[4] 
	From
		(Select DaysToManufacture, StandardCost 
			From #TbPivot) As tb
	Pivot
		(
			AVG(StandardCost) For DaysToManufacture In([0],[1],[2],[4])
		) As tbpv;
Go
