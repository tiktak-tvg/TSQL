--������� 2. �������� ���������� � �������������� ��������� ����� EXISTS
--1.	�������� ������ � �����������, ������� ���������� �������� ���� ��������� (���� Name ������� Production.Product), 
--  	��� ������� ���������� ������������ (���� ProductSubcategoryID) � ��������� 'Wheels' (���� Name ������� Production.ProductSubcategory �������� �������� 'Wheels').
--2.	����������� �������� ����� EXISTS ��� �������� ������������� ����������� ������� � ������� Production.ProductSubcategory.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select *	
	From Production.Product;
Go
Select *
	From Production.ProductSubcategory;
Go

Select Name
	From Production.Product As pp
		Where Exists	
			(Select * 
				From Production.ProductSubcategory
					Where ProductSubcategoryID = pp.ProductSubcategoryID And
						Name = 'Wheels');
Go
		 