--Задание 6. Создание запроса с использованием инструкции SELECT и оператора Not, Is Not Null.
--1.	Измените запрос, созданный в Задании 4, добавив в него условие, ограничивающее размер продуктов, номер которых начинается со строки «TG». 
--      Размер таких продуктов должен быть 'M' или 'L'.
--2.	Выполните запрос, нажав на панели инструментов кнопку Execute.
--3.	Просмотрите результаты запроса и убедитесь, что возвращаемые записи отвечают новым условиям поиска.
Use AdventureWorks2014;
Go
--      Размер продуктов 'M', 'S' или 'L'.
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес' 
	From Production.Product
		Where ProductNumber Like 'LJ%' And Size Is Not Null;
Go
--      Размер продуктов только 'M' или 'L'.
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес' 
	From Production.Product
		Where Not Size IN('S','XL') And ProductNumber Like 'LJ%';
Go
