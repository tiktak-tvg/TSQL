--������� 3. ����������� ����������� �������� � ������� ��������� INTERSECT 
--1.	�������� ������, ������� ���������� ������ ���� ��������� ��������������� ��������� (���� ProductID) �� ������ Production.Product) � Production.WorkOrder.
--2.	����������� �������� INTERSECT.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select ProductID
	From Production.Product;
Go

Select ProductID
	From Production.WorkOrder;
Go
-- �������� INTERSECT.
Select ProductID
	From Production.Product
InterSect
Select ProductID
	From Production.WorkOrder;
Go