--������� 2. ����������� ����������� �������� � ������� ��������� EXCEPT
--1.	�������� ������, ������� ���������� ������ ���� ��������������� ��������� (���� ProductID) �� ������� Production.Product), ������� ����������� � ������� Production.WorkOrder.
--2.	����������� �������� EXCEPT.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select ProductID
	From Production.Product;
Go

Select ProductID
	From Production.WorkOrder;
Go
-- �������� EXCEPT.
Select ProductID
	From Production.Product
Except
Select ProductID
	From Production.WorkOrder;
Go