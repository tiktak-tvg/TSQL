--������� 4. �������������� ��������������� ������ ������ � �������������� ������������ �����.
--1.	�������� ����� ������, ������� �������� �� ������� Person.Person ���� ������ AdventureWorks2014 ������� (���� LastName) � ��� (���� FirstName), ����������� ������� � ��������.
--2.	��������� ������.
--3.	����������� ���������� � ��������, ��� ����������� ���� �� ����� �����.
Use AdventureWorks2014;
Go

Select Top 3 FirstName + '; ' + LastName
	From Person.Person;
Go	 
Select Top 3 LastName + ' ' + FirstName
	From Person.Person;
Go
Select Top 3 FirstName + ' - ' + LastName
	From Person.Person;
Go
Select Top 3 '"' + LastName + ' ' + FirstName + '"'
	From Person.Person;
Go
Select Top 3 '(' + LastName + ' ' + FirstName + ')'
	From Person.Person;
Go