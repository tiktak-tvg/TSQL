--������� 1: �������� ������� � �������������� ���������� SELECT � ��������� ���������.
--1.	�������� ����� ������, ������� �������� ���� ProductNumber, Name � Weight �� ������� Production.Product ���� ������ AdventureWorks2014 ��� �������, 
--      � ������� ���� ProductLine �������� �������� NULL. ����������� �������� �=� ��� ��������� �������� ���� � NULL.
--2.	��������� ������ � �������� ���������� ������������ �������� �������.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight]
	From Production.Product	
		Where ProductLine = NULL;
Go