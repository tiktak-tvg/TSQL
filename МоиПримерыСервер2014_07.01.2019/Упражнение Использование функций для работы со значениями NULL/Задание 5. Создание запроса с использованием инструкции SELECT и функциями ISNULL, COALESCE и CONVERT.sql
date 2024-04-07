--������� 5. �������� ������� � �������������� ���������� SELECT � ��������� ISNULL, COALESCE � CONVERT.
--1.	�������� ������, ��������� � ������� 4 ���, ����� ������� � �������������� ������ ����� ���� � ������ �Meausurement� ���, �����:
--a)	���� ���� Weight �������� ��������, �������� �� NULL, ��� �������� ������ ������������ � ���� �Meausurement�.
--b)	���� ���� Weight �������� �������� NULL, � ���� Size �������� ��������, �������� �� NULL, � ���� �Meausurement� ������ ������������ �������� ���� Size.
--c)	���� ���� Weight � Size �������� �������� NULL, � ���� �Meausurement� ������ ������������ �������� 'NA'.
--2.	��������� ������.
--3.	����������� ���������� � �������� ����� �������� � ���� �Meausurement� - ���������.
Use AdventureWorks2014;
Go

Select ProductNumber As N'�������', Name As N'������������' , Coalesce(Convert(Char,Weight),Size,'-') As N'���������', ISNULL(ProductLine,'-') As '����� ���������' 
	From Production.Product
	Order By Name ASC;
Go