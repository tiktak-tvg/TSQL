--Задание 2. Форматирование результирующего набора данных с использованием предложения ORDER BY и ключевого слова DESC.
--1.	Измените запрос, созданный в Задании 1 следующим образом:
--a)	Добавьте в выборку поле ListPrice. 
--b)	Отсортируйте результирующий набор по полю Class.
--c)	Отсортируйте результирующий набор по убыванию по полю ListPrice внутри каждого класса.
--2.	Выполните запрос и просмотрите результаты.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, Class, ListPrice
	From Production.Product
		Where Class Is Not Null
		Order By Class, ListPrice DESC;
Go