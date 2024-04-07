--Задание 3. Форматирование результирующего набора данных с использованием ключевого слова DISTINCT.
--1.	Создайте новый запрос, который выбирает поле Color из таблицы Production.Product базы данных AdventureWorks2014 для записей, 
--      в которых имя продукта (поле Name) содержит слово «helmet». В результирующем наборе для каждого цвета (поле Color) должна отображаться только одна запись.
--2.	Выполните запрос и просмотрите результаты. 
Use AdventureWorks2014;
Go

Select Distinct Color, Name
	From Production.Product
		Where Name Like '%helmet%';
Go
Select Color, Name
	From Production.Product
	Where Name Like '%helmet%';
Go

		
	