--������� 4: �������� ������� � �������������� ���������� SELECT � ��������� BETWEEN.
--1.	�������� ������, ��������� � ������� 3 ���, ����� �� ��������� ������ �� ������� Production.Product ���� ������ AdventureWorks2014, ��� �������:
--o	����� �������� (���� ProductNumber) ���������� �� ������ �SO�
--o	��� ���� ��������� (���� ListPrice) ���������� �� $50 �� $180, ��� ���� ����� ����� ��������� ���������� �� ������ �TG�.
--2.	��������� ������, ����� �� ������ ������������ ������ Execute.
--3.	����������� ���������� ������� � ��������, ��� ���������� �������, ������������ ��������, ���������� � ������������ ������ �������� �������� ������.
Use AdventureWorks2014;
Go
Select ProductNumber As N'�������', Name As N'������������', ListPrice As N'�����', Color As N'����', Size As N'������', [Weight] As N'���' 
	From Production.Product
		Where ProductNumber Like 'SO%' Or ProductNumber Like 'TG%' And ListPrice Between 74 And 180;
Go 