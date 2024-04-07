--������� 3. �������� ������� � �������������� ���������� SELECT � ������� ISNULL.
--1.	�������� ����� ������, ������� �������� ���� ProductNumber, Name, Weight � ProductLine �� ������� Production.Product ���� ������ AdventureWorks2008. 
--      ����������� ������� ISNULL() ��� ����������� �������� 'NA' � ���� ProductLine ��� �������, ���������� NULL.
--2.	��������� ������ � ����������� ����������.
--3.	�������� �������� ���� � �������������� ������, ��� �������� ������������ ������� ISNULL().
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight],
	 ISNULL(ProductLine,N'No') As 'ProductLine', ISNULL(Color,'No')
		From Production.Product;
Go
