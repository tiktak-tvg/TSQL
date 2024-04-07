--Задание 1. Создание и выполнение запроса, вычисляющего среднее значение для группы данных
--1.	Создайте запрос к таблице Production.Product базы данных AdventureWorks2014, который возвращает идентификатор продукта (поле ProductID) и среднее количество дней, необходимых для изготовления этого продукта (поле DaysToManufacture).
--2.	Используйте функцию AVG и предложение GROUP BY.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select ProductID, AVG(DaysToManufacture)
	From Production.Product
	Group By ProductID;
Go