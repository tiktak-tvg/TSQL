--1.	�������� ������ � �����������, ������� �������� �������� ��������� (���� Name) �� ������� Production.Product, ���� ������� (���� ListPrice) 
--      ����� ��������� �������� � ��������� 'Chainring Bolts'.
--2.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go
-- ������ �� ��������� � ����� �� ����� ��� � Chainring Bolts.
Select Name	
	From Production.Product
		Where ListPrice =
			(Select ListPrice	
				From Production.Product
					Where Name = 'Chainring Bolts');
Go