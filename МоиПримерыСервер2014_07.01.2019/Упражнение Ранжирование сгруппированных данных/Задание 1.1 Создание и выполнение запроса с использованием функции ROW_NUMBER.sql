--������� 1. �������� � ���������� ������� � �������������� ������� ROW_NUMBER
--1.	�������� ������, ������� ���������� ����� ������ �� ���� SalesYTD, � ����� ���� SalesPersonID � SalesYTD �� ������� Sales.SalesPerson. 
--      Create a query that returns numbered rows for the Sales.SalesPerson table.
--2.	����������� ������� ROW_NUMBER.
--3.	�������������� ����� ������ �������� ������ �� ������ �� ������� Sales.SalesPerson, ��� ������� ���� TerritoryID �������� ��������, �������� �� �������� NULL, 
--      � �������� ���� SalesLastYear �� ����� 0.
--4.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select *
	From Sales.SalesPerson;
Go

Select Row_Number() Over (Order By SalesYTD) As N'������� �� ���', BusinessEntityID As N'����� ���������������', SalesYTD, SalesLastYear 
	From Sales.SalesPerson
		Where TerritoryID Is Not Null And  SalesLastYear <> 0;
Go