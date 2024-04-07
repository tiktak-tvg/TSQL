--Задание 2. Создание подзапроса с использованием ключевого слова EXISTS
--1.	Создайте запрос с подзапросом, который возвращает названия всех продуктов (поле Name таблицы Production.Product), 
--  	для которых существует подкатегория (поле ProductSubcategoryID) с названием 'Wheels' (поле Name таблицы Production.ProductSubcategory содержит значение 'Wheels').
--2.	Используйте ключевое слово EXISTS для проверки существования необходимых записей в таблице Production.ProductSubcategory.
--3.	Выполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go

Select *	
	From Production.Product;
Go
Select *
	From Production.ProductSubcategory;
Go

Select Name
	From Production.Product As pp
		Where Exists	
			(Select * 
				From Production.ProductSubcategory
					Where ProductSubcategoryID = pp.ProductSubcategoryID And
						Name = 'Wheels');
Go
		 