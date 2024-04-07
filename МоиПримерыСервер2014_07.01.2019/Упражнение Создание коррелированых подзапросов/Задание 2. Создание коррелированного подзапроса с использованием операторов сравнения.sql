--������� 2. �������� ���������������� ���������� � �������������� ���������� ���������
--1.	�������� ������ � ��������������� �����������, ������� ���������� ������ ��������������� ��������� � ���������� ������ 
--      (���� ProductID � OrderQty ������� Sales.SalesOrderDetail) ��� ���������, ���������� ������ ��� ������� ������ �������� ���������� ������ ��� ���� ���������.
--2.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select *
	From Sales.SalesOrderDetail;
Go

Select ProductID,OrderQty
	From Sales.SalesOrderDetail s1
		Where OrderQty <
			(Select AVG(OrderQty)
				From Sales.SalesOrderDetail s2
					Where s2.ProductID = s1.ProductID);
Go
