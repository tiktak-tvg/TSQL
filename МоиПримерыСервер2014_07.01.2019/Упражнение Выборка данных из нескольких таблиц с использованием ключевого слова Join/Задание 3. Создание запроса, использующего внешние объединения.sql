--������� 3. �������� �������, ������������� ������� �����������
--1.	�������� ������, ������� ���������� �������� �������� (���� Name ������� Production.Product) � ������������� ��� �������� (���� ProductReviewID ������� Production.ProductReview). 
--      ����������� ����� ������� ����������� ������ Production.Product � Production.ProductReview �� ���� ProductID ��� ������ ���� ���������, 
--      ��� ����������� �� ����, ���������� �� ��� ��� �������� (������ � ������� Production.ProductReview).
--2.	�������� ������, ������� ���������� �������� ������� (���� Name ������� Sales.SalesTerritory) � ������������� �������� (���� BusinessEntityID ������� Sales.SalesPerson)
--      ��� ���� ���������. ����������� ������� ������ ����������� ������ Sales.SalesTerritory � Sales.SalesPerson �� ���� TerritoryID.
--3.	��������� ������ � ����������� ����������.

-- ProductReview - ����� ��������.
-- SalesTerritory - ���������� ������.
-- SalesPerson - ��������.
-- Sales - �������.

Use AdventureWorks2014;
Go

Select Name
	From Production.Product;
Go
Select ProductReviewID	
	From Production.ProductReview
Go
Select Top 5 *
	From Sales.SalesTerritory;
Go
Select Top(5) *
	From Sales.SalesPerson;
Go

Select p.Name, pr.ProductReviewID
	From Production.Product As p
	Left Join Production.ProductReview As pr
	On p.ProductID = pr.ProductID
Go
Select st.Name, sp.BusinessEntityID
	From Sales.SalesTerritory As st
	Right Join Sales.SalesPerson As sp
	On st.TerritoryID = sp.TerritoryID
Go