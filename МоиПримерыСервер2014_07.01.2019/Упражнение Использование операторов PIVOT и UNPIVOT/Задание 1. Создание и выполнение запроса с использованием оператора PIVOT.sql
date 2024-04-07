--������� 1. �������� � ���������� ������� � �������������� ��������� PIVOT
--1.	�������� ������, ������� ���������� ��������� �������� �� ������� Production.Product.
--2.	����������� �������� PIVOT.
--3.	�������������� ������� ������ ����� ���� � ������� Name, RED, BLUE � BLACK � ��������� �������� ����� SafetyStockLevel, Color, Name �� ������� Production.Product.
--4.	�������������� ����� ������ �������� ������ �� ������ �� ������� Production.Product, ��� ������� ���� Name �������� ������ 'Helmet'.
--5.	������������� �������� � ���� SafetyStockLevel �� ������ Red, Blue and Black.
--6.	������������ �������������� ����� �� ���� Name.
--7.	��������� ������ � ����������� ����������.

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
 

Select 'SafetyStockLevel' As N'�����',[Black], [Blue], [Red]
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
Select N'������� ���������� ������' As N'�����',[Black],[Blue],[Red]
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

Select Color As N'�����', SafetyStockLevel As N'������� ���������� ������'
			From Production.Product
				Where Name Like '%Helmet%';
Go	
			