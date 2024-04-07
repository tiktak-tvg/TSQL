--«адание 1. ‘орматирование результирующего набора данных с использованием предложени€ ORDER BY, Is not Null.
--1.	—оздайте новый запрос, который выбирает пол€ ProductNumber, Name и Class из таблицы Production.Product базы данных AdventureWorks2014 и сортирует результирующий набор по полю Class.
--2.	¬ыполните запрос и просмотрите результаты.
Use AdventureWorks2014;
Go

Select ProductNumber, Name, Class
	From Production.Product
		Where Class Is not Null
		Order By Class;
Go