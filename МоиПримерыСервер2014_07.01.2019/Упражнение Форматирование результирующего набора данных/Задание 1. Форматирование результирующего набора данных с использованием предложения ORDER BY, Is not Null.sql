--������� 1. �������������� ��������������� ������ ������ � �������������� ����������� ORDER BY, Is not Null.
--1.	�������� ����� ������, ������� �������� ���� ProductNumber, Name � Class �� ������� Production.Product ���� ������ AdventureWorks2014 � ��������� �������������� ����� �� ���� Class.
--2.	��������� ������ � ����������� ����������.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, Class
	From Production.Product
		Where Class Is not Null
		Order By Class;
Go