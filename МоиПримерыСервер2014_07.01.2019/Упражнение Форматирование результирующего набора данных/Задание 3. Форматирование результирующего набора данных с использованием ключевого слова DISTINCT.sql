--������� 3. �������������� ��������������� ������ ������ � �������������� ��������� ����� DISTINCT.
--1.	�������� ����� ������, ������� �������� ���� Color �� ������� Production.Product ���� ������ AdventureWorks2014 ��� �������, 
--      � ������� ��� �������� (���� Name) �������� ����� �helmet�. � �������������� ������ ��� ������� ����� (���� Color) ������ ������������ ������ ���� ������.
--2.	��������� ������ � ����������� ����������. 
Use AdventureWorks2014;
Go

Select Distinct Color, Name
	From Production.Product
		Where Name Like '%helmet%';
Go
Select Color, Name
	From Production.Product
	Where Name Like '%helmet%';
Go

		
	