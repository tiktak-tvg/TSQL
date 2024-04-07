--������� 1. �������� � ���������� �������, ������������ ������� �������� ��� ������ ������
--1.	�������� ������ � ������� Production.Product ���� ������ AdventureWorks2014, ������� ���������� ������������� �������� (���� ProductID) � ������� ���������� ����, ����������� ��� ������������ ����� �������� (���� DaysToManufacture).
--2.	����������� ������� AVG � ����������� GROUP BY.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select ProductID, AVG(DaysToManufacture)
	From Production.Product
	Group By ProductID;
Go