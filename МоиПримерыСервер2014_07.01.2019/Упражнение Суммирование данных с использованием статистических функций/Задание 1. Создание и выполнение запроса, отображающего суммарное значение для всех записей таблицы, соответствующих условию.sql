--Задание 1. Создание и выполнение запроса, отображающего суммарное значение для всех записей таблицы, соответствующих условию
--1.	Создайте запрос к таблице HumanResources.Employee базы данных AdventureWorks2014, который возвращает среднее количество часов отпуска (поле VacationHours) 
--      и общее количество часов болезней (поле SickLeaveHours) для вице-президентов компании (поле JobTitle содержит строку 'Vice President').
--2.	Используйте статистические функции AVG и SUM.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select VacationHours As N'Количество часов отпуска', SickLeaveHours As N'Количество часов болезней'
	From HumanResources.Employee
		Where JobTitle Like 'Vice President%';
Go		

Select AVG(VacationHours) As N'Среднее количество часов отпуска', Sum(SickLeaveHours) As N'Общее количество часов болезней'
	From HumanResources.Employee
		Where JobTitle Like 'Vice President%';
Go
