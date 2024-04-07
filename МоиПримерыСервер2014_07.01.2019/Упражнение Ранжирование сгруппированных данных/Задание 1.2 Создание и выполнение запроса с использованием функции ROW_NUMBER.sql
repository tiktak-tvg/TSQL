--������� 1. �������� � ���������� ������� � �������������� ������� ROW_NUMBER
--1.	�������� ������, ������� ���������� ����� ������ �� ���� SalesYTD, � ����� ���� SalesPersonID � SalesYTD �� ������� Sales.SalesPerson. 
--      Create a query that returns numbered rows for the Sales.SalesPerson table.
--2.	����������� ������� ROW_NUMBER.
--3.	�������������� ����� ������ �������� ������ �� ������ �� ������� Sales.SalesPerson, ��� ������� ���� TerritoryID �������� ��������, �������� �� �������� NULL, 
--      � �������� ���� SalesYTD �� ����� 559698.
--4.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select * 
	From Sales.SalesPerson
Go

Select SalesYTD, SalesYTD
	From Sales.SalesPerson
		Where TerritoryID Is Not Null Or Not SalesYTD = '559697.5639'
Go