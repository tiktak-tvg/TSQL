--������� 1. �������� � ���������� �������, ������������� ��������� �������� ��� ���� ������� �������, ��������������� �������
--1.	�������� ������ � ������� HumanResources.Employee ���� ������ AdventureWorks2014, ������� ���������� ������� ���������� ����� ������� (���� VacationHours) 
--      � ����� ���������� ����� �������� (���� SickLeaveHours) ��� ����-����������� �������� (���� JobTitle �������� ������ 'Vice President').
--2.	����������� �������������� ������� AVG � SUM.
--3.	��������� ������ � ����������� ����������.

Use AdventureWorks2014;
Go

Select VacationHours As N'���������� ����� �������', SickLeaveHours As N'���������� ����� ��������'
	From HumanResources.Employee
		Where JobTitle Like 'Vice President%';
Go		

Select AVG(VacationHours) As N'������� ���������� ����� �������', Sum(SickLeaveHours) As N'����� ���������� ����� ��������'
	From HumanResources.Employee
		Where JobTitle Like 'Vice President%';
Go
