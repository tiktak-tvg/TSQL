--������� 5. �������������� ��������������� ������ ������ � �������������� ������������ ����� � ���������� ����.
--1.	�������� ������, ��������� � ������� 4 ���, ����� ����������� ���� ����� ��������� 'Contacts'.
--2.	��������� ������ � ����������� ����������. 
Use AdventureWorks2014;
Go

Select Top 3 FirstName + '; ' + LastName As 'Contacts'
	From Person.Person;
Go	 
Select Top 3 LastName + ' ' + FirstName As N'�������'
	From Person.Person;
Go
Select Top 3 FirstName + ' - ' + LastName As 'Contacts'
	From Person.Person;
Go
Select Top 3 '"' + LastName + ' ' + FirstName + '"' As N'�������'
	From Person.Person;
Go
Select Top 3 '(' + LastName + ' ' + FirstName + ')' As 'Contacts'
	From Person.Person;
Go