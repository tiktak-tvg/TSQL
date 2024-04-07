--������� 3. �������� � ���������� ������� � �������������� ������� NTILE
--1.	�������� ������, ������� ���������� ���� SalesYTD � BusinessEntityID �� ������� Sales.SalesPerson.
--2.	����������� ������� NTILE �� ���� SalesYTD, ����� ��������� �������������� ����� �� 4 ������ � ���������� ���������� �� ��������.
--3.	�������������� ����� ������ �������� ������ �� ������ �� ������� Sales.SalesPerson, ��� ������� ���� TerritoryID �������� ��������, �������� �� �������� NULL, � �������� ���� SalesYTD �� ����� 0.
--4.	��������� ������ � ����������� ����������.
Use AdventureWorks2014;
Go

Select *
	From Sales.SalesPerson;
Go
-- ��������� �������������� ����� �� 4 ������ � ���������� ���������� �� ��������.
Select NTile(4) Over (Order By SalesYTD) As N'������� � ������ ����', BusinessEntityID As N'������������������� ������������' 
	From Sales.SalesPerson
		Order By SalesYTD DESC;
Go