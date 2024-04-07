--Задание 6. Форматирование результирующего набора данных с использованием функции SUBSTRING
--1.	Измените запрос, созданный в Задании 5 так, чтобы он выбирал записи, в которых фамилия (поле LastName) начинается с 'Mac'.
--2.	Используйте функцию SUBSTRING().
--3.	Выполните запрос и просмотрите результаты.
Use AdventureWorks2014;
Go

 
Select Top 3 LastName + ' ' + FirstName As N'Контакт'
	From Person.Person
		Where LastName Like 'Mac%';
Go

Select Top 3 LastName + ' ' + FirstName As N'Контакт'
	From Person.Person
		Where SUBSTRING(Lastname,1,3) = 'Mac';
Go
Select Top 3 LastName + ' ' + FirstName As N'Контакт'
	From Person.Person
		Where SUBSTRING(FirstName,1,3) = 'Den';
Go