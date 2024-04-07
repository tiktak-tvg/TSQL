--������� 4. �������� � ���������� ������� ��� ���������� ������ � ����������� ��������� ����.
--1.	�������� ������ � ������� Production.ProductInventory ���� ������ AdventureWorks2014, ������� ���������� ���� ProductID, Shelf � ����� ����� �� ���� Quantity ��� ����� ���������.
--2.	����������� ����������� GROUP BY � ���������� ROLLUP ��� �������� ����������� �� ������� � ������ ����������.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select ProductID As N'�����', IsNull(Shelf,N'-') As N'�����', Sum(Quantity) As N'����� ����� �� ����' 
	From Production.ProductInventory		
		Group By RollUP(ProductID,Shelf)		
Go

Select ProductID As N'�����', IsNull(Shelf,N'��� ��������') As N'�����', Sum(Quantity) As N'����� ����� �� ����' From Production.ProductInventory
	Rollup 
	Group By Rollup(ProductID,Shelf);
Go