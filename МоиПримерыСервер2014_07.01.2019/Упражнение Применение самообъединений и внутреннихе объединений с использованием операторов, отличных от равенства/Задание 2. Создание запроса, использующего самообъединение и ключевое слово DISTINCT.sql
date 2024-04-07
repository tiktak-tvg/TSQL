--������� 2. �������� �������, ������������� ��������������� � �������� ����� DISTINCT
--1.	�������� ������, ��������� � ������� 1 ���, ����� ��������� �� ��������������� ������ ������������� ������. ����������� ��� ����� ����� DISTINCT
--2.	��������� ������ � ����������� ����������.

-- Purchasing - �������.
-- Product Vendor - �������� ��������. 
Use AdventureWorks2014;
Go

Select *
	From Purchasing.ProductVendor;
Go
-- ��������� �� ��������������� ������ ������������� ������.
-- ��.
Select pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
	Inner Join Purchasing.ProductVendor As pv2
	On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
	Order By pv1.ProductID;
Go
-- �����.
Select Distinct pv1.ProductID, pv1.BusinessEntityID
	From Purchasing.ProductVendor As pv1
	Inner Join Purchasing.ProductVendor As pv2
	On pv1.ProductID = pv2.ProductID And pv1.BusinessEntityID <> pv2.BusinessEntityID
	Order By pv1.ProductID;
Go	 