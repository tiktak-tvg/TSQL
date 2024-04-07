--������� 6. �������� ������� � �������������� ���������� SELECT � ��������� Not, Is Not Null.
--1.	�������� ������, ��������� � ������� 4, ������� � ���� �������, �������������� ������ ���������, ����� ������� ���������� �� ������ �TG�. 
--      ������ ����� ��������� ������ ���� 'M' ��� 'L'.
--2.	��������� ������, ����� �� ������ ������������ ������ Execute.
--3.	����������� ���������� ������� � ���������, ��� ������������ ������ �������� ����� �������� ������.
Use AdventureWorks2014;
Go
--      ������ ��������� 'M', 'S' ��� 'L'.
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���' 
	From Production.Product
		Where ProductNumber Like 'LJ%' And Size Is Not Null;
Go
--      ������ ��������� ������ 'M' ��� 'L'.
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���' 
	From Production.Product
		Where Not Size IN('S','XL') And ProductNumber Like 'LJ%';
Go
