--������� 1. �������� �������, ������������� ���������������
--1.	�������� ������, ������� ���������� ������ ���� ��������� (���� ProductID) �� ������� Purchasing.ProductVendor � ���� �� ����������� (���� BusinessEntityID).
--2.	����������� ��������������� ��� ������� Purchasing.ProductVendor �� ���� ProductID.
--3.	���������� ������� ��� ������ �� ������� Purchasing.ProductVendor � ����������� ���������� ProductID, �� ������� ���������� BusinessEntityID 
--      (����������� ��������, �������� �� ���������).
--4.	������������ �������������� ����� �� ���� ProductID.
--5.	��������� ������ � ����������� ����������.

-- Purchasing - �������.
-- ProductVendor - �������� ��������.

Use AdventureWorks2014;
Go

Select ProductID,BusinessEntityID	
	From Purchasing.ProductVendor;
Go
-- ��� ������ �� ������� Purchasing.ProductVendor � ����������� ���������� ProductID, �� ������� ���������� BusinessEntityID 
Select pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
		Inner Join Purchasing.ProductVendor As pv2
		On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
		Order By pv1.ProductID;
Go