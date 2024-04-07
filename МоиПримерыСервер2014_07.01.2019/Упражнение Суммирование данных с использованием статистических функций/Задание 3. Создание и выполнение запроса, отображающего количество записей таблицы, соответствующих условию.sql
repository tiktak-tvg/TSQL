--������� 3. �������� � ���������� �������, ������������� ���������� ������� �������, ��������������� �������
--1.	�������� ������ � ������� Person.Address ���� ������ AdventureWorks2014, ������� ���������� ���������� �����������, ��� ������� ���� AddressLine2 �������� �������� NULL. 
--2.	����������� ������� COUNT � ����������� IS NULL.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

-- �����.
Select Count(*) 
	From Person.Address;
Go

-- ������� ������.
Select  Count(AddressID) 
	From Person.Address
		Where AddressLine2 Is Null;
Go

--Select Count(*) - Count(AddressLine2)
--	From Person.Address
--		Where  AddressLine2 Is Null  ;
--Go