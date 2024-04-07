--������� 2. �������� � ���������� ������� � �������������� ��������� UNPIVOT
--1.	��������� ������ �� ������� 1, �������� ���������� ������� �� ��������� ������� � ������ #TbPivot. 
--      ��� ����� � ��� ������� ����� ��������� SELECT� � FROM� �������� ������� INTO #TbPivot:
--SELECT�
--INTO #TbPivot
--FROM�
--�
--2.	�������� ������ � �������������� ��������� UNPIVOT, ������� ����������� ������� ������� #TbPivot � �������� ��������.
--3.	��������� ������ � ����������� ����������.
--4.	�������� ����� SQL Server Management Studio.

Use AdventureWorks2014;
Go

Select *
	From Production.Product;
Go

Select DaysToManufacture As N'���� �� ������������', AVG(StandardCost) As N'����������� ���������'
	From Production.Product
		Group By DaysToManufacture;
Go
-- CostSortedByProductionDays - ��������� ������������� �� ���� ������������
--  ������ Pivot
Select N'����������� ���������' As N'��������� ������������� �� ���� ������������',[0], [1], [2], [3], [4]
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
