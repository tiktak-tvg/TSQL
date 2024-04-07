--������� 1. �������� ���������������� ����������
--1.	�������� ������ � ��������������� �����������, ������� ���������� ������� � ����� ����������� (���� LastName � FirstName ������� Person.Person), 
--      ����� ������� (���� Bonus ������� Sales.SalesPerson) ��������� $5000.
--2.	����������� ���������� ����������� ������� Person.Person � �������� HumanResources.Employee ��� ��������� ����������� �����.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select LastName, FirstName 
	From Person.Person;
Go
Select Bonus 
	From Sales.SalesPerson 
		Where  Bonus = 5000.0;
Go
-- ������ ����� �����������.
Select LastName, FirstName 
	From Person.Person pp
	Inner Join Sales.SalesPerson ss
	On pp.BusinessEntityID = ss.BusinessEntityID
		Where Bonus = 5000.0;
Go

-- ������ � ��������������� �����������.
Select LastName, FirstName 
	From Person.Person As pp
	Inner Join HumanResources.Employee  As hre
	On pp.BusinessEntityID = hre.BusinessEntityID
		Where 5000.0 IN
			(Select Bonus
				From Sales.SalesPerson ss
					Where hre.BusinessEntityID = ss.BusinessEntityID);
		
Go
-- ��� ���.
Select LastName, FirstName
	From Person.Person pp
	Inner Join HumanResources.Employee hr
	On hr.BusinessEntityID = pp.BusinessEntityID
		Where 5000.0 = 
			(Select Bonus
				From Sales.SalesPerson ss
					Where ss.BusinessEntityID = pp.BusinessEntityID);
Go
Select LastName, FirstName
	From Person.Person pp
	Inner Join HumanResources.Employee hr
	On hr.BusinessEntityID = pp.BusinessEntityID
		Where 5000.0 >= 
			(Select Bonus
				From Sales.SalesPerson ss
					Where ss.BusinessEntityID = pp.BusinessEntityID);
Go



		