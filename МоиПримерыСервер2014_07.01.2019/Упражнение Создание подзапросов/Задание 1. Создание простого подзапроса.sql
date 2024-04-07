--1.	—оздайте запрос с подзапросом, который выбирает названи€ продуктов (поле Name) из таблицы Production.Product, цена которых (поле ListPrice) 
--      равна стоимости продукта с названием 'Chainring Bolts'.
--2.	¬ыполните запрос и просмотрите результаты.

Use AdventureWorks2014;
Go
-- «апрос по продуктам с такой же ценой как у Chainring Bolts.
Select Name	
	From Production.Product
		Where ListPrice =
			(Select ListPrice	
				From Production.Product
					Where Name = 'Chainring Bolts');
Go