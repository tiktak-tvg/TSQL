--������� 6. �������������� ��������������� ������ ������ � �������������� ������� SUBSTRING
--1.	�������� ������, ��������� � ������� 5 ���, ����� �� ������� ������, � ������� ������� (���� LastName) ���������� � 'Mac'.
--2.	����������� ������� SUBSTRING().
--3.	��������� ������ � ����������� ����������.
Use AdventureWorks2014;
Go

 
Select Top 3 LastName + ' ' + FirstName As N'�������'
	From Person.Person
		Where LastName Like 'Mac%';
Go

Select Top 3 LastName + ' ' + FirstName As N'�������'
	From Person.Person
		Where SUBSTRING(Lastname,1,3) = 'Mac';
Go
Select Top 3 LastName + ' ' + FirstName As N'�������'
	From Person.Person
		Where SUBSTRING(FirstName,1,3) = 'Den';
Go