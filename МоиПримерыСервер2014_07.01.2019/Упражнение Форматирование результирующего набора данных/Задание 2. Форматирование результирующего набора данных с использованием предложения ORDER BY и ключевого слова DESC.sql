--������� 2. �������������� ��������������� ������ ������ � �������������� ����������� ORDER BY � ��������� ����� DESC.
--1.	�������� ������, ��������� � ������� 1 ��������� �������:
--a)	�������� � ������� ���� ListPrice. 
--b)	������������ �������������� ����� �� ���� Class.
--c)	������������ �������������� ����� �� �������� �� ���� ListPrice ������ ������� ������.
--2.	��������� ������ � ����������� ����������.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, Class, ListPrice
	From Production.Product
		Where Class Is Not Null
		Order By Class, ListPrice DESC;
Go