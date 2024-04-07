--Задание 4. Форматирование результирующего набора данных с использованием конкатенации строк.
--1.	Создайте новый запрос, который выбирает из таблицы Person.Person базы данных AdventureWorks2014 фамилию (поле LastName) и имя (поле FirstName), разделенных запятой и пробелом.
--2.	Выполните запрос.
--3.	Просмотрите результаты и отметьте, что вычисляемое поле не имеет имени.
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