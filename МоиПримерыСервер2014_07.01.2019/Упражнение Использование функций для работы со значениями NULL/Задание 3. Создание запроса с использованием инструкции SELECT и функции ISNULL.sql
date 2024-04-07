--Задание 3. Создание запроса с использованием инструкции SELECT и функции ISNULL.
--1.	Создайте новый запрос, который выбирает поля ProductNumber, Name, Weight и ProductLine из таблицы Production.Product базы данных AdventureWorks2008. 
--      Используйте функцию ISNULL() для отображения значения 'NA' в поле ProductLine для записей, содержащих NULL.
--2.	Выполните запрос и просмотрите результаты.
--3.	Заметьте название поля в результирующем наборе, для которого используется функция ISNULL().
Use AdventureWorks2014;
Go

Select ProductNumber, Name, [Weight],
	 ISNULL(ProductLine,N'No') As 'ProductLine', ISNULL(Color,'No')
		From Production.Product;
Go
