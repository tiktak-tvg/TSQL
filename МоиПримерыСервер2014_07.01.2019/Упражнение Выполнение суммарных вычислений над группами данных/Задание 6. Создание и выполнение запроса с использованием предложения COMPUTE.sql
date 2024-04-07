--������� 6. �������� � ���������� ������� � �������������� ����������� COMPUTE
--1.	�������� ������, ������� �������� ���� SalesOrderID, UnitPrice � UnitPriceDiscount � ��������� ���������� �� ������� Sales.SalesOrderDetail, ��������� ����������� COMPUTE.
--2.	����������� ������� SUM ��� ����� UnitPrice � UnitPriceDiscount � ����������� COMPUTE.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select SalesOrderID, UnitPrice, UnitPriceDiscount
	From Sales.SalesOrderDetail
	Order By SalesOrderID
	Compute sum(UnitPrice), sum(UnitPriceDiscount) by SalesOrderID
Go

SELECT ProductID, LineTotal 
	FROM Sales.SalesOrderDetail 
		WHERE UnitPrice < $5.00
			ORDER BY ProductID, LineTotal 
			COMPUTE SUM(LineTotal) BY ProductID;
Go
-- � MS SQL 2014 �� ��������������, ������ � MS SQL 2008.