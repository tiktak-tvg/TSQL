--Задание 5. Создание запроса с использованием инструкции SELECT и функциями ISNULL, COALESCE и CONVERT.
--1.	Измените запрос, созданный в Задании 4 так, чтобы создать в результирующем наборе новое поле с именем «Meausurement» так, чтобы:
--a)	Если поле Weight содержит значение, отличное от NULL, это значение должно отображаться в поле «Meausurement».
--b)	Если поле Weight содержит значение NULL, а поле Size содержит значение, отличное от NULL, в поле «Meausurement» должно отображаться значение поля Size.
--c)	Если поля Weight и Size содержат значение NULL, в поле «Meausurement» должно отображаться значение 'NA'.
--2.	Выполните запрос.
--3.	Просмотрите результаты и отметьте новые значения в поле «Meausurement» - Измерение.
Use AdventureWorks2014;
Go

Select ProductNumber As N'Артикль', Name As N'Наименование' , Coalesce(Convert(Char,Weight),Size,'-') As N'Измерение', ISNULL(ProductLine,'-') As 'Линия продуктов' 
	From Production.Product
	Order By Name ASC;
Go