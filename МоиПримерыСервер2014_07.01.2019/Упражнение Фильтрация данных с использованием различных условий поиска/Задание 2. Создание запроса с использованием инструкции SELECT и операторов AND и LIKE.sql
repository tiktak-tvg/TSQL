--������� 2: �������� ������� � �������������� ���������� SELECT � ���������� AND � LIKE.
--1.	�������� ������, ��������� � ������� 1 ���, ����� �� ������� ���� ProductNumber, Name, ListPrice, Color, Size � Weight �� ������� Production.Product 
--      ���� ������ AdventureWorks2014 ��� ���������, ���� ������� (���� ListPrice) ���� $100 � ����� �������� (���� ProductNumber) ���������� �� ������ �SO�.
--2.	��������� ������, ����� �� ������ ������������ ������ Execute.
--3.	����������� ���������� �������.
Use AdventureWorks2014;
Go
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���'
	From Production.Product
		Where ListPrice < 100 And ProductNumber Like 'SO%';
Go