--������� 2. �������� � ���������� �������, ������������ ������� �������� ��� ��������������� ������� �������, ��������������� �������
--1.	�������� ������ � ������� Production.Product ���� ������ AdventureWorks2014, ������� ���������� ���� (���� Color) � ������� ���� (���� ListPrice) ��� �������� 'FR-R72R-58' (�������� � ���� ProductNumber).
--2.	����������� ������� AVG � ����������� GROUP BY.
--3.	����������� ����������� WHERE ��� ����������� �������, ��������������� �������.
--4.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select Color, AVG(ListPrice)
	From Production.Product	
		Where ProductNumber Like 'FR-R72R-58%'
	Group By Color;
Go