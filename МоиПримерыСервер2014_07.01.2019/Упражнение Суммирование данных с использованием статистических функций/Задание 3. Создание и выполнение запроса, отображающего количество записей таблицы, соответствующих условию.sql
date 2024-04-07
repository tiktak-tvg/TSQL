--Задание 3. Создание и выполнение запроса, отображающего количество записей таблицы, соответствующих условию
--1.	Создайте запрос к таблице Person.Address базы данных AdventureWorks2014, который возвращает количество сотрудников, для которых поле AddressLine2 содержит значение NULL. 
--2.	Используйте функцию COUNT и предложение IS NULL.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

-- Всего.
Select Count(*) 
	From Person.Address;
Go

-- Вариант ответа.
Select  Count(AddressID) 
	From Person.Address
		Where AddressLine2 Is Null;
Go

--Select Count(*) - Count(AddressLine2)
--	From Person.Address
--		Where  AddressLine2 Is Null  ;
--Go