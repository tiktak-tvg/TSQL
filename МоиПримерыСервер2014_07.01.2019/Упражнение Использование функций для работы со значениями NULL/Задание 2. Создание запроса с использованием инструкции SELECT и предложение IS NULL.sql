--������� 2. �������� ������� � �������������� ���������� SELECT � ����������� IS NULL.
--1.	�������� ������, ��������� � ������� 1 ���, ����� ������������ ����������� IS NULL ��� ������� �������, ������� �������� NULL � ���� ProductLine.
--2.	��������� ������.
--3.	����������� ���������� ������� � �������� ���������� ������������ �������� ������� � ������, ������� ������������ � ProductLine.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight]
	From Production.Product	
		Where ProductLine Is NULL;
Go