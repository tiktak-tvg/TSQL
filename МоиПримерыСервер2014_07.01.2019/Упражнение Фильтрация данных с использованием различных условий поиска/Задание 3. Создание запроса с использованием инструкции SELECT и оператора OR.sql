--������� 3: �������� ������� � �������������� ���������� SELECT � ��������� OR.
--1.	�������� ������, ��������� � ������� 2 ���, ����� �������� � ���� �������� ����� ������� ����� ���������� �� ������ �� ������ �SO�, �� � �� ������ �TG�.
--2.	��������� ������, ����� �� ������ ������������ ������ Execute.
--3.	����������� ���������� ������� � ���������, ��� �� ���������� �������������� ������.
Use AdventureWorks2014;
Go
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���' 
	From Production.Product
		Where ListPrice < 100 And ProductNumber Like 'SO%' Or ProductNumber Like 'TG%';
Go
