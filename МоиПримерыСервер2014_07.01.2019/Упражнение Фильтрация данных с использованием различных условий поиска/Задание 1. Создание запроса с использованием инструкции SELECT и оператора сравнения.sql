--������� 1: �������� ������� � �������������� ���������� SELECT � ��������� ���������.
--1.	�������� ����� ������, ����� �� ������ ������������ ������ New Query.
--2.	� ���� ������� ������� ����� �������, ������� �������� ���� ProductNumber, Name, ListPrice, Color, Size � Weight �� ������� Production.Product ���� ������ AdventureWorks2014 ��� ���������, ���� ������� (���� ListPrice) ���� $100.
--3.	��������� ������, ����� �� ������ ������������ ������ Execute.
--4.	����������� ���������� �������.
Use AdventureWorks2014;
Go
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���' 
	From Production.Product
		Where ListPrice <= 102;
GO