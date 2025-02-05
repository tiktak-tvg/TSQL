--Задание 1. Создание и выполнение запроса с использованием оператора PIVOT
--1.	Создайте запрос, который возвращает табличное значение из таблицы Production.Product.
--2.	Используйте оператор PIVOT.
--3.	Результирующая таблица должна иметь поля с именами Name, RED, BLUE и BLACK и содержать значения полей SafetyStockLevel, Color, Name из таблицы Production.Product.
--4.	Результирующий набор должен включать только те записи из таблицы Production.Product, для которых поле Name содержит строку 'Helmet'.
--5.	Просуммируйте значения в поле SafetyStockLevel по цветам Red, Blue and Black.
--6.	Отсортируйте результирующий набор по полю Name.
--7.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select * 
	From Production.Product;
Go

Select Name, Sum(SafetyStockLevel) As N'SafetyStockLevel', Color As N'Color'
	From Production.Product
		Where Name Like '%Helmet%'
			Group By Name,Color;
Go
 

Select 'SafetyStockLevel' As N'Цвета',[Black], [Blue], [Red]
	From 
		(Select SafetyStockLevel,Color
			From Production.Product
			Where Name Like '%Helmet%'
			) As pp
		Pivot
			(Sum(SafetyStockLevel)  
				For Color  IN  ([Black], [Blue], [Red])) As PivotTable

Go


SELECT VendorID, [250] AS Emp1, [251] AS Emp2, [256] AS Emp3, [257] AS Emp4, [260] AS Emp5  
FROM   
(SELECT PurchaseOrderID, EmployeeID, VendorID  
FROM Purchasing.PurchaseOrderHeader Where PurchaseOrderID < 4) p  
PIVOT  
(  
COUNT (PurchaseOrderID)  
FOR EmployeeID IN  
( [250], [251], [256], [257], [260] )  
) AS pvt  
ORDER BY pvt.VendorID; 	

SELECT PurchaseOrderID, EmployeeID, VendorID  
FROM Purchasing.PurchaseOrderHeader
Where PurchaseOrderID < 4;
Go


Select  Color As N'Color',  Sum(SafetyStockLevel) As N'SafetyStockLevel'
	From Production.Product
		Where Name Like '%Helmet%'
			Group By Name,Color;
Go	

-- Pivot
Select N'Уровень страхового запаса' As N'Цвета',[Black],[Blue],[Red]
	From	
		(Select Color, SafetyStockLevel
			From Production.Product
				Where Name Like '%Helmet%'
		) As tb
	Pivot
		(
			Sum(SafetyStockLevel) For Color In([Black],[Blue],[Red])
		) As tbpv
Go

Select Color As N'Цвета', SafetyStockLevel As N'Уровень страхового запаса'
			From Production.Product
				Where Name Like '%Helmet%';
Go	
			
