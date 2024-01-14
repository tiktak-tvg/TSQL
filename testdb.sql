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
);
Go
-- ������� �������

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
-- ������ ������

	
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'��', N'���������')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'�', N'����')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'�', N'����')
INSERT [dbo].[m_unit] ([title], [description]) VALUES (N'��', N'�����')
SET ANSI_NULLS ON
GO
	
SET QUOTED_IDENTIFIER ON
GO
-- ������� �������

	
CREATE TABLE [dbo].[m_supplier](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL
) ON [PRIMARY]
GO
-- ������ ������

	
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (1, N'��� �������� "�����"', N'1212', NULL)
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (2, N'��� "�������"', N'1213', NULL)
INSERT [dbo].[m_supplier] ([id], [title], [phone], [address]) 
VALUES (3, N'�� ������� �.�.', N'12345', NULL)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ������� �������

	
CREATE TABLE [dbo].[m_product](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[supplier_id] [int] NULL,
	[ctgry_id] [int] NOT NULL,
	[unit] [nvarchar](255) NULL,
	[lifedays] [int] NULL
) ON [PRIMARY]
GO
-- ������ ������

INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (1, N'������� ���������', 1, 4, N'��', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (2, N'������� ��������', 3, 4, N'��', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (3, N'������', 2, 1, N'�', 2)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (4, N'����� ���������, ��������', 2, 2, N'��', 30)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (5, N'����� ������������, �������', 3, 2, N'��', 90)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (6, N'����� ���������, ���������', 1, 2, N'��', 10)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (7, N'���� �������', 1, 3, N'��', 5)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (8, N'�����, ��������', 1, 1, N'��', 2)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (9, N'����', 2, 5, N'��', 1)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (10, N'�����', 3, 5, N'��', 1)
INSERT [dbo].[m_product] ([id], [title], [supplier_id], [ctgry_id], [unit], [lifedays]) 
VALUES (11, N'�������', 1, 1, N'��', 2)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ������� �������

	
CREATE TABLE [dbo].[m_outcome](
	[id] [int] NOT NULL,
	[dt] [datetime] NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
-- ������ ������

	
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
-- ������� �������

	
CREATE TABLE [dbo].[m_income](
	[id] [int] NOT NULL,
	[dt] [datetime] NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
-- ������ ������

	
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
-- ������� �������

	
CREATE TABLE [dbo].[m_category](
	[id] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
-- ������ ������

	
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (1, N'�������� ��������')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (2, N'�����, ���')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (3, N'����')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (4, N'������������ �������')
INSERT [dbo].[m_category] ([id], [title]) 
VALUES (5, N'������������� �������');
Go