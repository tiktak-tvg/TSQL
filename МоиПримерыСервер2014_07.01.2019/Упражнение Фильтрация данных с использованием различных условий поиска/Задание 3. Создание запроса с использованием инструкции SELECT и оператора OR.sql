--Задание 3: Создание запроса с использованием инструкции SELECT и оператора OR.
--1.	Измените запрос, созданный в Задании 2 так, чтобы добавить в него продукты номер которых может начинаться не только со строки «SO», но и со строки «TG».
--2.	Выполните запрос, нажав на панели инструментов кнопку Execute.
--3.	Просмотрите результаты запроса и убедитесь, что он возвращает дополнительные записи.
Use AdventureWorks2014;
Go
Select ProductNumber As N'Артикль', Name As N'Наименование', ListPrice As N'Прайс', Color As N'Цвет', Size As N'Размер', [Weight] As N'Вес' 
	From Production.Product
		Where ListPrice < 100 And ProductNumber Like 'SO%' Or ProductNumber Like 'TG%';
Go
