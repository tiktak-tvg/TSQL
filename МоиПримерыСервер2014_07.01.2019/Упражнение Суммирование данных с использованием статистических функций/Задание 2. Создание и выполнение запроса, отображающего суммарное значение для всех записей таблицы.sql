--������� 2. �������� � ���������� �������, ������������� ��������� �������� ��� ���� ������� �������
--1.	�������� ������ � ������� HumanResources.Employee ���� ������ AdventureWorks2014, ������� ���������� ���������� ����������� (���������� ������� � ������� HumanResources.Employee).
--2.	����������� �������������� ������� COUNT.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select JobTitle As N'���������'
	From HumanResources.Employee
Go

Select Count(JobTitle) As N'���������� �����������'
	From HumanResources.Employee
Go