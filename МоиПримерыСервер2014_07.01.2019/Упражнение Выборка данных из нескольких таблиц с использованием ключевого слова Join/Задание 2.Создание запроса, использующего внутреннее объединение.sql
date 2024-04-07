--������� 2.�������� �������, ������������� ���������� �����������
--1.	�������� ������, ������� ���������� ��������������� ������ ����������� (���� LoginID ������� HumanResources.Employee), ���������� ����������.
--2.	����������� ���������� ����������� ������ HumanResources.Employee � Sales.SalesPerson ���� ������ AdventureWorks2008 �� ���� BusinessEntityID.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select Top 5 *
	From HumanResources.Employee;
Go
Select Top 5 *
	From Sales.SalesPerson;
Go

Select e.LoginID
	From HumanResources.Employee As e
	Inner Join Sales.SalesPerson As sp
	On e.BusinessEntityID = sp.BusinessEntityID;
Go