# Запрос MS SQL Server. Начало

Для практики приведенных Запросов необходимо в MS SQL Server исполнить следующий код, который создаст все необходимые таблицы и заполнит их образцами данных (необходимо предварительно создать базу данных TestDB):
<pre>
CREATE DATABASE TestDB
ON
(
NAME = Sbase_data,
FILENAME = 'E:\sqlDataBase\TestDB.mdf',
SIZE = 10,
MAXSIZE = 100,
FILEGROWTH = 5
)

LOG ON
(
NAME = Sbase_log,
FILENAME = 'E:\sqlDataBase\TestDB.ldf',
SIZE = 10,
MAXSIZE = 100,
FILEGROWTH = 5
) 
</pre>
Создаем таблицу 
<pre>
USE [TestDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_unit](
	[title] [nvarchar](10) NOT NULL,
	[description] [nvarchar](30) NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>	
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'кг', N'Килограмм')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'л', N'Литр')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'м', N'Метр')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'шт', N'Штука')
SET ANSI_NULLS ON
GO
	
SET QUOTED_IDENTIFIER ON
GO
</pre>
Создаем таблицу 
<pre>	
CREATE TABLE [dbo].[m_supplier](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>	
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (1, N'ЗАО Комбинат "Огого"', N'1212', NULL)
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (2, N'ООО "Сладкое"', N'1213', NULL)
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (3, N'ИП Каримов А.Б.', N'12345', NULL)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
</pre>
Создаем таблицу 
<pre>	
CREATE TABLE [dbo].[m_product](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[supplier_id] [int] NULL,
	[ctgry_id] [int] NOT NULL,
	[unit] [nvarchar](255) NULL,
	[lifedays] [int] NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (1, N'Шоколад плиточный', 1, 4, N'шт', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (2, N'Конфеты Карамель', 3, 4, N'кг', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (3, N'Молоко', 2, 1, N'л', 2)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (4, N'Масло сливочное, упаковка', 2, 2, N'шт', 30)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (5, N'Масло растительное, бутылка', 3, 2, N'шт', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (6, N'Масло сливочное, развесное', 1, 2, N'кг', 10)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (7, N'Мясо говяжье', 1, 3, N'кг', 5)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (8, N'кефир, упаковка', 1, 1, N'шт', 2)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (9, N'Хлеб', 2, 5, N'шт', 1)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (10, N'Батон', 3, 5, N'шт', 1)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (11, N'Сметана', 1, 1, N'шт', 2)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
</pre>
Создаем таблицу 
<pre>	
CREATE TABLE [dbo].[m_outcome](
	[id] [int] NOT NULL,
	[dt] [datetime] NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>	
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (1, CAST(0x00009F0000000000 AS DateTime), 1, 10, 12.7)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (3, CAST(0x00009F0000000000 AS DateTime), 3, 23, 3.7)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (4, CAST(0x00009F0000000000 AS DateTime), 3, 34, 3.8)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (5, CAST(0x00009F0000000000 AS DateTime), 4, 30, 11)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (6, CAST(0x00009F0000000000 AS DateTime), 7, 20, 20.4)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (7, CAST(0x00009F0000000000 AS DateTime), 4, 1, 12)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (8, CAST(0x00009F0000000000 AS DateTime), 5, 20, 13)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (10, CAST(0x00009F0100000000 AS DateTime), 6, 25, 18.2)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (11, CAST(0x00009F0600000000 AS DateTime), 8, 20, 3.4)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (12, CAST(0x00009F1300000000 AS DateTime), 11, 4, 5.5)
INSERT [dbo].[m_outcome] ([id], [dt], [product_id], [amount], [price]) 
VALUES (14, CAST(0x00009F0000000000 AS DateTime), 4, 23, 11.2)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
</pre>
Создаем таблицу 
<pre>	
CREATE TABLE [dbo].[m_income](
	[id] [int] NOT NULL,
	[dt] [datetime] NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>	
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (26, CAST(0x00009E5E00000000 AS DateTime), 1, 1000, 12.5)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (27, CAST(0x00009E7E00000000 AS DateTime), 3, 200, 3.74)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (28, CAST(0x00009EA300000000 AS DateTime), 4, 100, 10)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (29, CAST(0x00009EFF00000000 AS DateTime), 7, 200, 20)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (30, CAST(0x00009EFF00000000 AS DateTime), 5, 235, 12.35)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (31, CAST(0x00009F0000000000 AS DateTime), 1, 300, 12.4)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (32, CAST(0x00009F0000000000 AS DateTime), 7, 100, 19.5)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (33, CAST(0x00009F0000000000 AS DateTime), 2, 100, 15.75)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (34, CAST(0x00009F0000000000 AS DateTime), 5, 3000, 11.8)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (36, CAST(0x00009F0000000000 AS DateTime), 6, 200, 17.9)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (37, CAST(0x00009F0000000000 AS DateTime), 3, 150, 3.74)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (38, CAST(0x00009F0100000000 AS DateTime), 3, 150, 3.74)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (39, CAST(0x00009F0100000000 AS DateTime), 10, 100, 4.2)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (40, CAST(0x00009F0100000000 AS DateTime), 9, 100, 2.95)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (41, CAST(0x00009F0200000000 AS DateTime), 10, 130, 4.2)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (42, CAST(0x00009F0200000000 AS DateTime), 9, 110, 2.95)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (43, CAST(0x00009F0600000000 AS DateTime), 8, 155, 3.1)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (44, CAST(0x00009F0700000000 AS DateTime), 8, 450, 3.1)
INSERT [dbo].[m_income] ([id], [dt], [product_id], [amount], [price]) 
VALUES (45, CAST(0x00009EFF00000000 AS DateTime), 5, 535, 12.35)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
</pre>
Создаем таблицу 
<pre>	
CREATE TABLE [dbo].[m_category](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
</pre>
Вносим данные 
<pre>	
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (1, N'Молочные продукты')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (2, N'Масло, жир')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (3, N'Мясо')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (4, N'Кондитерские изделия')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (5, N'Хлебобулочные изделия')
</pre>

Теперь рассмотрим примеры запросов T-SQL в MS SQL Server.<br>
Оператор SELECT -используется для осуществления выборки из таблиц базы данных.

#### Задача  1. Пример Запроса для получения только нужных полей в нужной последовательности: 
<pre>
Use TestDB;
Go
SELECT dt, product_id, amount
FROM [TestDB].[dbo].[m_income];
Go	
</pre>

#### Задача 2. В этом примере Запроса SQL символ звездочки (*) использован для вывода всех столбцов таблицы m_product, иначе говоря, для получения всех полей отношения m_product: 
<pre>
SELECT *
FROM TestDB.dbo.m_product; 
</pre>

#### Задача 3. Инструкция DISTINCT используется для исключения повторяющихся записей и получения множества уникальных записей: 
<pre>
SELECT DISTINCT product_id
FROM TestDB.dbo.m_income; 
</pre>

#### Задача 4. Инструкция ORDER BY используется для сортировки (упорядочивания) записей по значениям определенного поля. Имя поля указывается за инструкцией ORDER BY: 
<pre>
SELECT *
FROM TestDB.dbo.m_income
ORDER BY price; 
</pre>

#### Задача 5. Инструкция ASC используется как дополнение к инструкции ORDER BY и служит для определения сортировки по возрастанию. Инструкция DESC используется как дополнение к инструкции ORDER BY и служит для определения сортировки по убыванию. В случае, когда ни ASC, ни DESC не указаны, подразумевается наличие ASC (default): 
<pre>
SELECT *
FROM TestDB.dbo.m_income
ORDER BY dt DESC, price; 
</pre>

#### Задача 6. Для отбора необходимых записей из таблицы пользуются различными логическими выражениями, которые выражают условие отбора. Логическое выражение приводится после инструкции WHERE. Пример получения из таблицы m_income всех записей, для которых значение amount больше 200: 
<pre>
SELECT *
FROM TestDB.dbo.m_income
WHERE amount>200; 
</pre>

#### Задача 7. Для выражения сложных условий пользуются логическими операциями AND (конъюнкция), OR (дизъюнкция) и NOT (логическое отрицание). Пример получения из таблицы m_outcome всех записей, для которых значение amount равно 20 и значение price больше или равно 10: 
<pre>
SELECT dt, product_id, amount, price
FROM TestDB.dbo.m_outcome
WHERE amount=20 AND price>=10; 
</pre>

#### Задача 8. Для объединения данных двух или более таблиц пользуются инструкциями INNER JOIN, LEFT JOIN, RIGHT JOIN. В следующем примере извлекаются поля dt, product_id, amount, price из таблицы m_income и поле title из таблицы m_product. Запись таблицы m_income соединяется с записью таблицы m_product при равенстве значения m_income.product_id значению m_product.id: 
<pre>
SELECT dt, product_id, title, amount, price
FROM TestDB.dbo.m_income INNER JOIN TestDB.dbo.m_product 
ON m_income.product_id=m_product.id; 
</pre>

#### Задача 9. В этом Запросе SQL нужно обратить внимание на две вещи: <pre> 1) искомый текст заключен в одинарные кавычки ( ' ); </pre> 2) дата приведена в формате #Месяц/День/Год#, что верно для MS Access. В других системах формат написания даты может быть другим. Пример вывода информации о поступлении молока 12-го июня 2011 года. Обратите внимание на формат даты '2011-06-12': 
<pre>
SELECT dt, product_id, title, amount, price
FROM TestDB.dbo.m_income INNER JOIN TestDB.dbo.m_product 
ON m_income.product_id=m_product.id
WHERE title='Молоко' And dt='20110612'; 
</pre>

#### Задача 10. Инструкция BETWEEN используется для проверки принадлежности некоторому диапазону значений. Пример Запроса SQL, выводящий информацию о товарах, поступивших между 1-м и 30-м июнем 2011 года:
<pre>
SELECT *
FROM TestDB.dbo.m_income INNER JOIN TestDB.dbo.m_product 
ON m_income.product_id=m_product.id
WHERE dt BETWEEN '20110601' And '20110630'; 
</pre>

Один Запрос SQL можно вкладывать в другой. Под Запрос - есть не что иное, как Запрос внутри Запроса. Обычно, под Запрос используется в конструкции WHERE. Но возможны и другие способы использования под Запросов.

#### Задача 11. Выводится информация о товарах из таблицы m_product, коды которых есть и в таблице m_income: 
<pre>
SELECT *
FROM m_product
WHERE id IN (SELECT product_id FROM m_income); 
</pre>

#### Задача 12. Выводится список товаров из таблицы m_product, кодов которых нет в таблице m_outcome: 
<pre>
SELECT *
FROM m_product
WHERE id NOT IN (SELECT product_id FROM m_outcome); 
</pre>

#### Задача 13. В этом Запросе SQL выводится уникальный список кодов и названий товаров, коды которых есть в таблице m_income, но которых нет в таблице m_outcome: 
<pre>
SELECT DISTINCT product_id, title
FROM m_income INNER JOIN m_product
ON m_income.product_id=m_product.id
WHERE product_id NOT IN (SELECT product_id FROM m_outcome); 
</pre>

#### Задача 14. Выводится из таблицы m_category уникальный список категорий, названия которых начинаются на букву М: 
<pre>
SELECT DISTINCT title
FROM m_product
WHERE title LIKE 'М%'; 
</pre>

#### Задача 15. Пример выполнения арифметических операций над полями в  Запросе и переименования полей в  Запросе (alias). В этом примере для каждой записи о расходе товара подсчитываются сумма расхода = количество*цена и размер прибыли, при предположении, что прибыль составляет 7 процентов от суммы продаж: 
<pre>
SELECT dt, product_id, amount, price, amount*price AS outcome_sum, 
amount*price/100*7 AS profit
FROM m_outcome; 
</pre>

#### Задача 16. В MS SQL Server вместо AS можно воспользоваться знаком =. Только в этом случае надо сперва написать имя алиаса. Проанализировав и упростив арифметические операции, можно увеличить скорость выполнения  Запроса: 
<pre>
SELECT dt, product_id, amount, price, outcome_sum=amount*price, 
profit=amount*price*0.07
FROM m_outcome; 
</pre>

#### Задача 17. При помощи инструкции INNER JOIN можно объединить данные нескольких таблиц. В следующем примере, в зависимости от значения ctgry_id, каждой записи таблицы m_income, сопоставляется название категории из таблицы m_category, к которой принадлежит товар: 
<pre>
SELECT c.title, b.title, dt, amount, price, amount*price AS income_sum
FROM (m_income AS a INNER JOIN m_product AS b ON a.product_id=b.id) 
INNER JOIN m_category AS c ON b.ctgry_id=c.id
ORDER BY c.title, b.title; 
</pre>

#### Задача 18. Такие функции как SUM - сумма, COUNT - количество, AVG – среднее арифметическое значение, MAX – максимальное значение, MIN – минимальное значение называются агрегатными функциями. Они принимают множество значений, и после их обработки возвращают единственное значение. Пример подсчета суммы произведения полей amount и price при помощи агрегатной функции SUM: 
<pre>
SELECT SUM(amount*price) AS Total_Sum
FROM m_income; 
</pre>

#### Задача 19. Пример использования нескольких агрегатных функций: 
<pre>
SELECT Sum(amount) AS Amount_Sum, AVG(amount) AS Amount_AVG, 
MAX(amount) AS Amount_Max, Min(amount) AS Amount_Min, 
Count(*) AS Total_Number
FROM m_income; 
</pre>

#### Задача 20. В этом примере подсчитана сумма всех товаров с кодом 1, оприходованных в июне 2011 года: 
<pre>
SELECT Sum(amount*price) AS income_sum
FROM m_income
WHERE product_id=1 AND dt BETWEEN '20110601' AND '20110630'; 
</pre>

#### Задача 21. Следующий  Запрос SQL вычисляет на какую сумму было продано товаров, имеющих код 4 или 6: 
<pre>
SELECT Sum(amount*price) as outcome_sum
FROM m_outcome
WHERE product_id=4 OR product_id=6; 
</pre>

#### Задача 22. Вычисляется на какую сумму было продано 12 июня 2011 года товаров, имеющих код 4 или 6: 
<pre>
SELECT Sum(amount*price) AS outcome_sum
FROM m_outcome
WHERE (product_id=4 OR product_id=6) AND dt='20110612'; 
</pre>

#### Задача 23. Задача такова. Вычислить на какую общую сумму было оприходовано товаров категории "Хлебобулочные изделия".

Для решения этой задачи нужно оперировать тремя таблицами:

m_income, m_product и m_category, потому что:

- количество и цена оприходованных товаров хранятся в таблице m_income; 
- код категории каждого товара хранится в таблице m_product; 
- название категории title хранится в таблице m_category.

Для решения данной задачи воспользуемся следующим алгоритмом: 

- определение кода категории "Хлебобулочные изделия" из таблицы m_category посредством под Запроса; 
- соединение таблиц m_income и m_product для определения категории каждого оприходованного товара; 
- вычисление суммы прихода( = количество*цена) для товаров, код категории которых равен коду, определенному вышеуказанным под Запросом.

Итак: 
<pre>
SELECT Sum(amount*price) AS income_sum
FROM m_product AS a INNER JOIN m_income AS b ON a.id=b.product_id
WHERE ctgry_id = (SELECT id FROM m_category WHERE title='Хлебобулочные изделия'); 
</pre>

#### Задача 24. Задачу вычисления общей суммы оприходованных товаров категории "Хлебобулочные изделия" решим следующим алгоритмом: 
<pre>
- каждой записи таблицы m_income, в зависимости от значения его product_id, из таблицы m_category, сопоставить название категории; 
- выделить записи, для которых категория равна "Хлебобулочные изделия"; 
- вычислить сумму прихода = количество*цена.
</pre>
Итак: 
<pre>
SELECT Sum(amount*price) AS income_sum
FROM (m_product AS a INNER JOIN m_income AS b ON a.id=b.product_id) 
INNER JOIN m_category AS c ON a.ctgry_id=c.id
WHERE c.title='Хлебобулочные изделия'; 
</pre>

#### Задача 25. В этом примере вычисляется сколько наименований товаров было израсходовано: 
<pre>
SELECT COUNT(product_id) AS product_cnt
FROM (SELECT DISTINCT product_id FROM m_outcome)  AS t; 
</pre>

#### Задача 26. Инструкция GROUP BY используется для группировки записей. Обычно записи группируются по значению одного или нескольких полей, и относительно каждой группы применяется какая-либо агрегатная операция. Например, Следующий  Запрос состявляет отчет о продаже товаров. То есть генерируется таблица, в которой будут названия товаров и сумма, на которую они проданы: 
<pre>
SELECT title, SUM(amount*price) AS outcome_sum
FROM m_product AS a INNER JOIN m_outcome AS b 
ON a.id=b.product_id
GROUP BY title; 
</pre>

#### Задача 27. Отчет о продажах по категориям. То есть генерируется таблица, в которой будут названия категорий товаров, общая сумма, на которую проданы товары данных категорий, и средняя сумма продаж. Функция ROUND использована для округления среднего значения до сотой доли (второй знак после разделителя целой и дробной частей): 
<pre>
SELECT c.title, SUM(amount*price) AS outcome_sum, 
ROUND(AVG(amount*price),2) AS outcome_sum_avg
FROM m_product AS a 
INNER JOIN m_outcome AS b 
ON a.id=b.product_id 
INNER JOIN m_category AS c 
ON a.ctgry_id=c.id
GROUP BY c.title; 
</pre>

#### Задача 28. Вычисляется для каждого товара общее и среднее количество его поступлений и выводит информацию о товарах, общее количество поступления которых не менее 500: 
<pre>
SELECT product_id, SUM(amount) AS amount_sum, 
Round(Avg(amount),2) AS amount_avg
FROM m_income
GROUP BY product_id
HAVING Sum(amount)>=500; 
</pre>

#### Задача 29. В этом Запросе вычисляется для каждого товара сумма и среднее значение его поступлений, осуществленных во втором квартале 2011 года. Если общая сумма прихода товара не менее 1000, то отображается информация об этом товаре: 
<pre>
SELECT title, SUM(amount*price) AS income_sum
FROM m_income a INNER JOIN m_product b ON a.product_id=b.id
WHERE dt BETWEEN '20110401' AND '20110630'
GROUP BY title
HAVING SUM(amount*price)>=1000; 
</pre>

#### Задача 30. В некоторых случаях нужно сопоставлять каждой записи некоторой таблицы каждую запись другой таблицы; </pre> что называется декартовым произведением. Таблица, образующаяся в результате такого соединения, называется таблицей Декарта. Например, если некоторая таблица А имеет 100 записей и таблица В имеет 15 записей, то их таблица Декарта будет состоять из 100*15=150 записей. Следующий  Запрос соединяет каждую запись таблицы m_income с каждой записью таблицы m_outcome: 
<pre>
SELECT *
FROM m_income, m_outcome; 
</pre>

#### Задача 31. Пример группирования записей по двум полям. Следующий  Запрос SQL вычисляет по каждому поставщику сумму и количество поступивших от него товаров: 
<pre>
SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS income_sum
FROM m_income AS a INNER JOIN m_product AS b ON a.product_id=b.id
GROUP BY supplier_id, product_id; 
</pre>

#### Задача 32. Пример группирования записей по двум полям. Следующий  Запрос вычисляет для каждого поставщика сумму и количество его продуктов, проданных нами: 
<pre>
SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS outcome_sum
FROM m_outcome AS a INNER JOIN m_product AS b ON a.product_id=b.id
GROUP BY supplier_id, product_id; 
</pre>

#### Задача 33. В этом примере два вышеприведенных  Запроса (задача31 и задача32) использованы как под Запросы. Результаты этих  Запросов методом LEFT JOIN объединены в один отчет. Следующий  Запрос выводит отчет о количестве и сумме поступивших и реализованных продуктов по каждому поставщику. Следует обратить внимание на то, что если какой-то товар уже поступил, но еще не реализован, то клетка outcome_sum для этой записи будет пустой. Также необходимо отметить, что данный #### Запрос служит только примером использования относительно сложных  Запросов в качестве под Запроса. Производительность данного Запроса SQL при большом объеме данных сомнительна: 
<pre>
SELECT *
FROM 
(SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS income_sum 
FROM m_income AS a INNER JOIN m_product AS b 
ON a.product_id=b.id GROUP BY supplier_id, product_id)  AS a 
LEFT JOIN 
(SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS outcome_sum 
FROM m_outcome AS a INNER JOIN m_product AS b 
ON a.product_id=b.id GROUP BY supplier_id, product_id)  AS b 
ON (a.product_id=b.product_id) AND (a.supplier_id=b.supplier_id); 
</pre>

#### Задача 34. В этом примере два вышеприведенных  Запроса (задача31 и задача32) использованы как под Запросы. Результаты этих  Запросов методом RIGTH JOIN объединены в один отчет. Следующий  Запрос выводит отчет о сумме платежей каждого клиента по использованным им платежным системам и сумме сделанных им инвестиций. Следующий  Запрос выводит отчет о количестве и сумме поступивших и реализованных продуктов по каждому поставщику. Следует обратить внимание на то, что если какой-то товар уже реализован, но еще не поступил, то клетка income_sum для этой записи будет пустой. Наличие таких пустых клеток является показателем ошибки в учете продаж, так как до продажи сначала необходимо, чтобы соответствующий товар поступил: 
<pre>
SELECT *
FROM 
(SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS income_sum
FROM m_income AS a INNER JOIN m_product AS b ON a.product_id=b.id
GROUP BY supplier_id, product_id)  AS a 
RIGHT JOIN 
(SELECT supplier_id, product_id, SUM(amount) AS amount_sum, 
SUM(amount*price) AS outcome_sum
FROM m_outcome AS a INNER JOIN m_product AS b ON a.product_id=b.id
GROUP BY supplier_id, product_id)  AS b 
ON (a.supplier_id=b.supplier_id) AND (a.product_id=b.product_id); 
</pre>

#### Задача 35. Выводится отчет о сумме доходов и расходов по продуктам. Для этого создается список продуктов по таблицам m_income и m_outcome, затем для каждого продукта из этого списка вычисляется сумма его приходов по таблице m_income и сумма его расходов по таблице m_outcome: 
<pre>
SELECT product_id, SUM(in_amount) AS income_amount, 
SUM(out_amount) AS outcome_amount
FROM 
(SELECT product_id, amount AS in_amount, 0 AS out_amount
FROM m_income
UNION ALL
SELECT product_id, 0 AS in_amount, amount AS out_amount
FROM m_outcome)  AS t
GROUP BY product_id; 
</pre>

#### Задача 36. Функция EXISTS возвращает значение TRUE, если переданное ей множество содержит элементы. Функция EXISTS возвращает значение FALSE, если переданное ей множество пустое, то есть не содержит элементов. Следующий  Запрос выводит коды товаров, которые содержатся как в таблице m_income, так и в таблице m_outcome: 
<pre>
SELECT DISTINCT product_id
FROM m_income AS a
WHERE EXISTS(SELECT product_id FROM m_outcome AS b 
WHERE b.product_id=a.product_id); 
</pre>

#### Задача 37. Выводятся коды товаров, которые содержатся как в таблице m_income, так и в таблице m_outcome: 
<pre>
SELECT DISTINCT product_id
FROM m_income AS a
WHERE product_id IN (SELECT product_id FROM m_outcome);
</pre>	

#### Задача 38. Выводятся коды товаров, которые содержатся как в таблице m_income, но не содержатся в таблице m_outcome: 	
<pre>
SELECT DISTINCT product_id
FROM m_income AS a
WHERE NOT EXISTS(SELECT product_id FROM m_outcome AS b 
WHERE b.product_id=a.product_id); 
</pre>

#### Задача 39. Выводится список товаров, сумма продаж которых максимальная. Алгоритм таков. Для каждого товара вычисляется сумма его продаж. Затем, определяется максимум этих сумм. Затем, для каждого товара снова вычисляется сумма его продаж, и выводятся код и сумма продаж товаров, сумма продаж которых равна максимальной: 
<pre>
SELECT product_id, SUM(amount*price) AS amount_sum
FROM m_outcome
GROUP BY product_id
HAVING SUM(amount*price) = (SELECT MAX(s_amount) 
FROM (SELECT SUM(amount*price) AS s_amount FROM m_outcome GROUP BY product_id)t); 
</pre>

#### Задача 40. Зарезервированное слово CASE-WHEN-THEN-ELSE-END (условный оператор) используется для оценки логического выражения и выполнения того или иного действия в зависимости от результата (TRUE или FALSE). В следующем примере поставка товара считается «малой», если количество меньше 500. В противном случае, то есть количество поступления больше или равно 500, поставка считается «большой»: 
<pre>
SELECT dt, product_id, amount, 
CASE 
   WHEN amount<500 THEN N'малая' ELSE N'большая'
END AS mark
FROM m_income; 
</pre>

