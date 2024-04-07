--������� 5. �������� � ���������� ������� ��� ������������� ��������� ��������
--1.	�������� ������ � ������� Sales.SalesOrderDetail ���� ������ AdventureWorks2014, ������� ���������� ���� SalesOrderID, ProductID � 
--      ��������� ���������� �� �������� (����� �� ���� OrderQty).
--2.	����������� �������� CUBE � ������ SalesOrderID � ProductID.
--3.	�������������� ����� ������ ���� ������������ �� ����� SalesOrderID � ProductID.
--4.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select SalesOrderID, ProductID, Sum(OrderQty)
	From Sales.SalesOrderDetail
		Group By Cube(SalesOrderID,ProductID);
Go

Select SalesOrderID As N'������������',ProductID As '�����',Sum(OrderQty) As N'�����' From Sales.SalesOrderDetail
	Group By Cube(SalesOrderID,ProductID);
Go