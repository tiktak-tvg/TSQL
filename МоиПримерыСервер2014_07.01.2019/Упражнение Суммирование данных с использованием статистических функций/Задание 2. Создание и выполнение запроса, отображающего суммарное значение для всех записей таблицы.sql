--Задание 2. Создание и выполнение запроса, отображающего суммарное значение для всех записей таблицы
--1.	Создайте запрос к таблице HumanResources.Employee базы данных AdventureWorks2014, который возвращает количество сотрудников (количество записей в таблице HumanResources.Employee).
--2.	Используйте статистическую функцию COUNT.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select JobTitle As N'Должность'
	From HumanResources.Employee
Go

Select Count(JobTitle) As N'Количество сотрудников'
	From HumanResources.Employee
Go