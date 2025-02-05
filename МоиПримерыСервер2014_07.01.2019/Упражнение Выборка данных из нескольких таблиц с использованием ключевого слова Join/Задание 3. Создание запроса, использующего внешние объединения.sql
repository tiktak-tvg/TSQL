--Задание 3. Создание запроса, использующего внешние объединения
--1.	Создайте запрос, который возвращает название продукта (поле Name таблицы Production.Product) и идентификатор его описания (поле ProductReviewID таблицы Production.ProductReview). 
--      Используйте левое внешнее объединение таблиц Production.Product и Production.ProductReview по полю ProductID для выбора всех продуктов, 
--      вне зависимости от того, существует ли для них описание (запись в таблице Production.ProductReview).
--2.	Создайте запрос, который возвращает название региона (поле Name таблицы Sales.SalesTerritory) и идентификатор продавца (поле BusinessEntityID таблицы Sales.SalesPerson)
--      для всех продавцов. Используйте внешнее правое объединение таблиц Sales.SalesTerritory и Sales.SalesPerson по полю TerritoryID.
--3.	Выполните запрос и просмотрите результаты.

-- ProductReview - обзор продукта.
-- SalesTerritory - территория продаж.
-- SalesPerson - продавец.
-- Sales - продажи.

Use AdventureWorks2014;
Go

Select Name
	From Production.Product;
Go
Select ProductReviewID	
	From Production.ProductReview
Go
Select Top 5 *
	From Sales.SalesTerritory;
Go
Select Top(5) *
	From Sales.SalesPerson;
Go

Select p.Name, pr.ProductReviewID
	From Production.Product As p
	Left Join Production.ProductReview As pr
	On p.ProductID = pr.ProductID
Go
Select st.Name, sp.BusinessEntityID
	From Sales.SalesTerritory As st
	Right Join Sales.SalesPerson As sp
	On st.TerritoryID = sp.TerritoryID
Go
