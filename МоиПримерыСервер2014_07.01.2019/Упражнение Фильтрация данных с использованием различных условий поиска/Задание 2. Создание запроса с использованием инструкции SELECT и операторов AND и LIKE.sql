--Задание 2: Создание запроса с использованием инструкции SELECT и операторов AND и LIKE.
--1.	Измените запрос, созданный в Задании 1 так, чтобы он выбирал поля ProductNumber, Name, ListPrice, Color, Size и Weight из таблицы Production.Product 
--      базы данных AdventureWorks2014 для продуктов, цена которых (поле ListPrice) ниже $100 и номер продукта (поле ProductNumber) начинается со строки «SO».
--2.	Выполните запрос, нажав на панели инструментов кнопку Execute.
--3.	Просмотрите результаты запроса.
Use AdventureWorks2014;
Go
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес'
	From Production.Product
		Where ListPrice < 100 And ProductNumber Like 'SO%';
Go