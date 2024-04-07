--������� 3. �������� �������, ������������� ���������� ����������� � �������������� ����������, �������� �� ���������
--1.	�������� ������, ������� ���������� ������ ���� ������������ ��������� (���� ProductSubcategoryID ������� Production.Product), ������� �� ������� ���� ��� ��������� ���� ����� $15.
--2.	����������� ��������������� ��� Production.Product �� ���� ProductSubcategoryID. 
--3.	���������� ������� ��� ������ �� ������� Production.Product � ����������� ���������� ProductID, �� ������� ���������� ListPrice (����������� ��������, �������� �� ���������).
--4.	����������� ����������� WHERE, ����� ������� ��� ��������� ������� ��������� (����������� �������� ��������� ��� ���� ListPrice � ������������ ������� Production.Product).
--5.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select *
	From Production.Product;
Go
Select Distinct pv1.ProductSubcategoryID,pv1.ListPrice
	From Production.Product As pv1
		Inner Join Production.Product As pv2
		On pv1.ProductSubcategoryID = pv2.ProductSubcategoryID And pv1.ListPrice <> pv2.ListPrice
		Where pv1.ListPrice < 15 And pv2.ListPrice < 15;
Go