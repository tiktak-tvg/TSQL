--Задание 5. Форматирование результирующего набора данных с использованием конкатенации строк и псевдонима поля.
--1.	Измените запрос, созданный в Задании 4 так, чтобы вычисляемое поле имело заголовок 'Contacts'.
--2.	Выполните запрос и просмотрите результаты. 
Use AdventureWorks2014;
Go

Select Top 3 FirstName + '; ' + LastName As 'Contacts'
	From Person.Person;
Go	 
Select Top 3 LastName + ' ' + FirstName As N'Контакт'
	From Person.Person;
Go
Select Top 3 FirstName + ' - ' + LastName As 'Contacts'
	From Person.Person;
Go
Select Top 3 '"' + LastName + ' ' + FirstName + '"' As N'Контакт'
	From Person.Person;
Go
Select Top 3 '(' + LastName + ' ' + FirstName + ')' As 'Contacts'
	From Person.Person;
Go