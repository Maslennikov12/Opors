USE [Maslennikov]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Discription] [nchar](10) NULL,
	[MainImagePath] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 01.04.2022 15:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[IdTypeProduct] [int] NOT NULL,
	[TitleTypeProduct] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TypeProduct] PRIMARY KEY CLUSTERED 
(
	[IdTypeProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'76', CAST(N'2017-10-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Airline', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Airtex', CAST(N'2016-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'ALСA', CAST(N'2015-04-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'ASHIKA', CAST(N'2018-01-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'Automega', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Bendix', CAST(N'2015-08-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'Benson', CAST(N'2016-11-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'BILSTEIN', CAST(N'2016-06-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'BOGE', CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'BOSCH', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'Castrol', CAST(N'2015-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'Elf', CAST(N'2016-03-26' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Ferodo', CAST(N'2018-03-06' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Ford', CAST(N'2017-03-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'General Motors', CAST(N'2015-04-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'Glaser', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'Goodyear', CAST(N'2017-04-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'Honda', CAST(N'2018-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'Hyundai/Kia', CAST(N'2016-11-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'Idemitsu', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'KASHIYAMA', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'Kayaba', CAST(N'2015-12-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'King Bearings', CAST(N'2017-02-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'Lemforder', CAST(N'2016-02-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Liqui Moly', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'LUK', CAST(N'2018-06-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Lukoil', CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'Magneti Marelli', CAST(N'2016-09-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Mando', CAST(N'2015-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'Mazda', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'Mercedes', CAST(N'2015-03-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'Mitsubishi', CAST(N'2018-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'Mobil', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Motul', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'Nissan', CAST(N'2015-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'Opel', CAST(N'2015-12-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'OPTIMAL', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Petro-Canada', CAST(N'2017-12-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'Pierburg', CAST(N'2016-10-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Profix', CAST(N'2016-08-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'Shell', CAST(N'2015-02-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'Stels', CAST(N'2016-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'Suzuki', CAST(N'2016-10-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Total', CAST(N'2015-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'Toyota', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'VAG', CAST(N'2015-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'Zekkert', CAST(N'2016-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'ZIC', CAST(N'2017-06-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'ZIMMERMANN', CAST(N'2017-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'Моторное масло Motor Oil KE900-90042-R', 2060.0000, N'          ', N'Товары автосервиса\8FE07916.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Моторное масло Helix Ultra 550046361', 2120.0000, N'          ', N'Товары автосервиса\F310E078.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Моторное масло Super 3000 X1 152566', 1820.0000, N'          ', N'Товары автосервиса\6CA0BE73.jpg', 0, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Моторное масло Turbo SYN Gasoline 05100-00441', 1870.0000, N'          ', N'Товары автосервиса\2B009062.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'Моторное масло Dexos 2 95599405', 1410.0000, N'          ', N'Товары автосервиса\AD00B713.jpg', 1, 44)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Моторное масло Molygen New Generation 9054', 2670.0000, N'          ', N'Товары автосервиса\0DF0A8A4.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Моторное масло Top Tec 4600 8033', 2580.0000, N'          ', N'Товары автосервиса\B790A6AA.jpg', 0, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Моторное масло ENGINE OIL 08880-80375-GO', 2710.0000, N'          ', N'Товары автосервиса\CC40C869.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (9, N'Моторное масло40 1 ESP 154285', 2890.0000, N'          ', N'Товары автосервиса\F490E078.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'Моторное масло Dexos 2 93165557', 1500.0000, N'          ', N'Товары автосервиса\45908C52.jpg', 1, 44)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Моторное масло Super 3000 X1 Diesel 152572', 1870.0000, N'          ', N'Товары автосервиса\B0A0C186.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Моторное масло ENGINE OIL MZ 320754', 2140.0000, N'          ', N'Товары автосервиса\3B70C57C.jpg', 1, 18)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'Моторное масло Genesis Armortech 3148675', 1660.0000, N'          ', N'Товары автосервиса\C9C0F036.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'Моторное масло Optimal Synth 3926', 1880.0000, N'          ', N'Товары автосервиса\EFC05011.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Моторное масло Optimal Synth 2293', 2520.0000, N'          ', N'Товары автосервиса\C310B9F3.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Моторное масло Evolution 900 SXR 194878', 2010.0000, N'          ', N'Товары автосервиса\E320BB7C.jpg', 1, 48)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Моторное масло Special C G 055 167 M4', 4720.0000, N'          ', N'Товары автосервиса\6730A31C.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Моторное масло Longlife III G 052 195 M2', 1910.0000, N'          ', N'Товары автосервиса\E5507A37.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Моторное масло Special Tec LL 8055', 2420.0000, N'          ', N'Товары автосервиса\B590AA7B.jpg', 0, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'Моторное масло Dexos 2 19 42 002', 1300.0000, N'          ', N'Товары автосервиса\23F0848B.jpg', 1, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (21, N'Моторное масло Gasoline Fully- Synthetic 30021326-746', 1650.0000, N'          ', N'Товары автосервиса\27B0C883.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (22, N'Моторное масло Formula F 15595E', 1750.0000, N'          ', N'Товары автосервиса\5250C855.jpg', 0, 43)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (23, N'Моторное масло Zepro Euro Spec SN/CF 1849-004', 2400.0000, N'          ', N'Товары автосервиса\90D0B807.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (24, N'Моторное масло SN 08880-10705', 2200.0000, N'          ', N'Товары автосервиса\43909176.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (25, N'Моторное масло Motor Oil KE900-90042', 2020.0000, N'          ', N'Товары автосервиса\90505D31.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (26, N'Моторное масло Evolution 900 SXR 194839', 2340.0000, N'          ', N'Товары автосервиса\F8E0B138.jpg', 0, 48)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (27, N'Моторное масло SN/GF-5 SN5W30C', 1550.0000, N'          ', N'Товары автосервиса\5A30A7EE.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (28, N'Моторное масло Evolution 900 SXR 194877', 2470.0000, N'          ', N'Товары автосервиса\E3A0B18A.jpg', 1, 48)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (29, N'Трос буксировочный 12 тонн 54384', 410.0000, N'          ', N'Товары автосервиса\9750DA76.jpg', 1, 34)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (30, N'Моторное масло Molygen New Generation 9042', 2510.0000, N'          ', N'Товары автосервиса\0D60A8A4.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (31, N'Моторное масло QUARTZ INEO ECS 166252', 1600.0000, N'          ', N'Товары автосервиса\D0D08F32.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (32, N'Моторное масло Motor Oil KE900-90032-R', 1450.0000, N'          ', N'Товары автосервиса\54B0795D.jpg', 1, 12)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (33, N'Моторное масло Original oil Ultra 8300-77-992', 2770.0000, N'          ', N'Товары автосервиса\EF80D790.jpg', 0, 5)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (34, N'Моторное масло Longlife III G 052 195 M4', 4100.0000, N'          ', N'Товары автосервиса\D9605006.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (35, N'Моторное масло 8100 X-CESS 102870', 3190.0000, N'          ', N'Товары автосервиса\E9308929.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (36, N'Моторное масло Magnatec A5 15583D', 2220.0000, N'          ', N'Товары автосервиса\9380C1E7.jpg', 1, 30)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (37, N'Щетка для снега со съемным скребком GY000202', 350.0000, N'          ', N'Товары автосервиса\3760D73F.jpg', 1, 37)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (38, N'Моторное масло Magnatec A3/B4 156E9E', 2130.0000, N'          ', N'Товары автосервиса\92C0C1E7.jpg', 1, 30)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (39, N'Моторное масло Dexos 2 19 42 000', 1410.0000, N'          ', N'Товары автосервиса\2390848B.jpg', 1, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (40, N'Моторное масло QUARTZ 9000 FUTURE NFC 171839', 1560.0000, N'          ', N'Товары автосервиса\D2508F32.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (41, N'Моторное масло Premium DPF Diesel 05200-00120', 1460.0000, N'          ', N'Товары автосервиса\2D709062.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (42, N'Моторное масло Special G G 052 502 M2', 1820.0000, N'          ', N'Товары автосервиса\E0D0E079.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (43, N'Моторное масло Ecstar F9000 99M00-22R02-004', 2330.0000, N'          ', N'Товары автосервиса\21B0E533.jpg', 1, 38)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (44, N'Моторное масло Genesis Armortech 1539424', 1710.0000, N'          ', N'Товары автосервиса\B0F0CB59.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (45, N'Моторное масло Helix Ultra 550046387', 2160.0000, N'          ', N'Товары автосервиса\F2B0E078.jpg', 0, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (46, N'Моторное масло Super 3000 X1 152567', 1550.0000, N'          ', N'Товары автосервиса\F200BC2F.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (47, N'Моторное масло ENGINE OIL MZ 320753', 1590.0000, N'          ', N'Товары автосервиса\5BB0C351.jpg', 0, 18)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (48, N'Моторное масло40 1 ESP Formula 152621', 2920.0000, N'          ', N'Товары автосервиса\DC70BEC3.jpg', 0, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (49, N'Моторное масло Genuine A000989790211BIFR', 1530.0000, N'          ', N'Товары автосервиса\2E30E06C.jpg', 0, 17)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (50, N'Моторное масло ULTRA 152624', 1940.0000, N'          ', N'Товары автосервиса\BA30C186.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (51, N'Моторное масло Super 3000 X1 Formula FE 152564', 1890.0000, N'          ', N'Товары автосервиса\59B0BE73.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (52, N'Моторное масло Zepro Euro Spec SN/CF 1849-001', 1730.0000, N'          ', N'Товары автосервиса\90A0B807.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (53, N'Моторное масло Helix Ultra 550046367', 1650.0000, N'          ', N'Товары автосервиса\F2E0E078.jpg', 0, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (54, N'Моторное масло QUARTZ 9000 FUTURE NFC 183199', 2040.0000, N'          ', N'Товары автосервиса\6CE0A012.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (55, N'Моторное масло Dexos 2 93165554', 1380.0000, N'          ', N'Товары автосервиса\45008C52.jpg', 1, 44)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (56, N'Моторное масло Formula F Fuel Economy HC 155D4B', 1450.0000, N'          ', N'Товары автосервиса\39A0C188.jpg', 1, 43)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (57, N'Моторное масло 24 08880-803ENGINE OIL-GO', 1630.0000, N'          ', N'Товары автосервиса\0070C563.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (58, N'Моторное масло QUARTZ 9000 FUTURE NFC 183450', 1660.0000, N'          ', N'Товары автосервиса\FA90B138.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (59, N'Моторное масло Top Tec 4100 7501', 2580.0000, N'          ', N'Товары автосервиса\022096CB.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (60, N'Моторное масло40 1 ESP 154279', 1860.0000, N'          ', N'Товары автосервиса\F460E078.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (61, N'Моторное масло Super 3000 X1 152061', 2010.0000, N'          ', N'Товары автосервиса\40409946.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (62, N'Моторное масло Super Extra Gasoline 05100-00410', 1230.0000, N'          ', N'Товары автосервиса\2A109062.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (63, N'Моторное масло Dexos 2 93165556', 1340.0000, N'          ', N'Товары автосервиса\43E08C52.jpg', 1, 44)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (64, N'Моторное масло Leichtlauf Special AA 7516', 2360.0000, N'          ', N'Товары автосервиса\47E07CB5.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (65, N'Моторное масло Helix HX8 A5/B5 550046777', 1530.0000, N'          ', N'Товары автосервиса\F160E078.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (66, N'Моторное масло Fuel Economy 08880-80845', 2560.0000, N'          ', N'Товары автосервиса\23106A35.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (67, N'Моторное масло 24 Top Tec 420061', 3440.0000, N'          ', N'Товары автосервиса\03D096CB.jpg', 1, 21)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (68, N'Моторное масло X9 162613', 1530.0000, N'          ', N'Товары автосервиса\30E0C751.jpg', 1, 42)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (69, N'Моторное масло EDGE Professional LL III Titanium FST 157AD6', 1240.0000, N'          ', N'Товары автосервиса\96E0C1E7.jpg', 1, 30)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (70, N'Моторное масло Magnatec A3/B4 156E9D', 1610.0000, N'          ', N'Товары автосервиса\9290C1E7.jpg', 1, 30)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (71, N'Моторное масло Genuine A000989790213BIFR', 2390.0000, N'          ', N'Товары автосервиса\2E60E06C.jpg', 1, 17)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (72, N'Моторное масло Supreme Synthetic MOSYN53C16', 1910.0000, N'          ', N'Товары автосервиса\69C0CD62.jpg', 1, 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (73, N'Моторное масло Helix Ultra Pro AM-L 550046353', 2110.0000, N'          ', N'Товары автосервиса\3DF0E4BC.jpg', 1, 20)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (74, N'Моторное масло QUARTZ INEO ECS 151510', 1920.0000, N'          ', N'Товары автосервиса\8F609ED7.jpg', 1, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (75, N'Моторное масло Original oil Ultra 0530-05-TFE', 2930.0000, N'          ', N'Товары автосервиса\85C04040.jpg', 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (77, N'Моторное масло Ultra LEO-SN 08217-99974', 2980.0000, N'          ', N'Товары автосервиса\97809225.jpg', 1, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (78, N'Моторное масло Special G G 052 502 M4', 3090.0000, N'          ', N'Товары автосервиса\E0A0E079.jpg', 1, 28)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (79, N'Моторное масло Люкс 207465', 1090.0000, N'          ', N'Товары автосервиса\8E20A863.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (80, N'Жилет светоотражающий взрослый ARW-AV-02', 150.0000, N'          ', N'Товары автосервиса\D4D0CE67.jpg', 1, 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (81, N'Моторное масло Premium LF Gasoline 05100-00451', 1620.0000, N'          ', N'Товары автосервиса\2B609062.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (82, N'Моторное масло Evolution 900 SXR 10160501', 1750.0000, N'          ', N'Товары автосервиса\BD80E8D5.jpg', 1, 48)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (83, N'Моторное масло Zepro Touring 1845-004', 2380.0000, N'          ', N'Товары автосервиса\5180B90E.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (84, N'Моторное масло 24 A000989PKW Motorenol0213BLER', 2510.0000, N'          ', N'Товары автосервиса\2E00E06C.jpg', 1, 17)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (85, N'Моторное масло QUARTZ 9000 ENERGY HKS 175392', 1530.0000, N'          ', N'Товары автосервиса\6DA0A012.jpg', 0, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (86, N'Моторное масло Formula F 155D3A', 1830.0000, N'          ', N'Товары автосервиса\39D0C188.jpg', 1, 43)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (87, N'Моторное масло40 1 FS 153692', 3020.0000, N'          ', N'Товары автосервиса\6080DCD5.jpg', 1, 40)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (88, N'Моторное масло Zepro Eco Medalist 3583-004', 2520.0000, N'          ', N'Товары автосервиса\3DA0B713.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (89, N'Моторное масло SN 08880-10706', 1640.0000, N'          ', N'Товары автосервиса\43C09176.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (90, N'Моторное масло Dexos 2 19 42 003', 1490.0000, N'          ', N'Товары автосервиса\8430842A.jpg', 1, 32)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (91, N'Моторное масло ENGINE OIL 08880-80365-GO', 3580.0000, N'          ', N'Товары автосервиса\CC10C869.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (92, N'Моторное масло EDGE LL Titanium FST 15669A', 3000.0000, N'          ', N'Товары автосервиса\8BC0C1A9.jpg', 1, 30)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (93, N'Моторное масло QUARTZ 9000 148597', 1700.0000, N'          ', N'Товары автосервиса\8F909ED7.jpg', 0, 26)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (94, N'Моторное масло ENGINE OIL MZ 320756', 1600.0000, N'          ', N'Товары автосервиса\5BE0C351.jpg', 0, 18)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (95, N'Кредитница, Кожа B6 6 95 1349', 6770.0000, N'          ', N'Товары автосервиса\63C09E91.jpg', 1, 17)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (96, N'Моторное масло Zepro Touring 1845-001', 1720.0000, N'          ', N'Товары автосервиса\7B70B9C6.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (97, N'Моторное масло ENGINE OIL MZ 320757', 2210.0000, N'          ', N'Товары автосервиса\0D30C4EE.jpg', 1, 18)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (98, N'Моторное масло Zepro Eco Medalist 3583-001', 1770.0000, N'          ', N'Товары автосервиса\6800BB8A.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (99, N'Моторное масло Premium DPF Diesel 05200-00620', 2470.0000, N'          ', N'Товары автосервиса\9B3075EB.jpg', 1, 31)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Discription], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (100, N'Моторное масло QUARTZ 9000 FUTURE NFC 10230501', 1650.0000, N'          ', N'Товары автосервиса\3970E753.jpg', 0, 26)
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (1, 1, N'Товары автосервиса\8FE07916.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (2, 2, N'Товары автосервиса\F310E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 3, N'Товары автосервиса\6CA0BE73.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 4, N'Товары автосервиса\2B009062.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 5, N'Товары автосервиса\AD00B713.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 6, N'Товары автосервиса\0DF0A8A4.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (7, 7, N'Товары автосервиса\B790A6AA.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (8, 8, N'Товары автосервиса\CC40C869.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (9, 9, N'Товары автосервиса\F490E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (10, 10, N'Товары автосервиса\45908C52.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (11, 11, N'Товары автосервиса\B0A0C186.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (12, 12, N'Товары автосервиса\3B70C57C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (13, 13, N'Товары автосервиса\C9C0F036.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (14, 14, N'Товары автосервиса\EFC05011.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (15, 15, N'Товары автосервиса\C310B9F3.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (16, 16, N'Товары автосервиса\E320BB7C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (17, 17, N'Товары автосервиса\6730A31C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (18, 18, N'Товары автосервиса\E5507A37.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (19, 19, N'Товары автосервиса\B590AA7B.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (20, 20, N'Товары автосервиса\23F0848B.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (21, 21, N'Товары автосервиса\27B0C883.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (22, 22, N'Товары автосервиса\5250C855.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (23, 23, N'Товары автосервиса\90D0B807.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (24, 24, N'Товары автосервиса\43909176.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (25, 25, N'Товары автосервиса\90505D31.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (26, 26, N'Товары автосервиса\F8E0B138.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (27, 27, N'Товары автосервиса\5A30A7EE.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (28, 28, N'Товары автосервиса\E3A0B18A.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (29, 29, N'Товары автосервиса\9750DA76.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (30, 30, N'Товары автосервиса\0D60A8A4.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (31, 31, N'Товары автосервиса\D0D08F32.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (32, 32, N'Товары автосервиса\54B0795D.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (33, 33, N'Товары автосервиса\EF80D790.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (34, 34, N'Товары автосервиса\D9605006.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (35, 35, N'Товары автосервиса\E9308929.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (36, 36, N'Товары автосервиса\9380C1E7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (37, 37, N'Товары автосервиса\3760D73F.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (38, 38, N'Товары автосервиса\92C0C1E7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (39, 39, N'Товары автосервиса\2390848B.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (40, 40, N'Товары автосервиса\D2508F32.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (41, 41, N'Товары автосервиса\2D709062.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (42, 42, N'Товары автосервиса\E0D0E079.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (43, 43, N'Товары автосервиса\21B0E533.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (44, 44, N'Товары автосервиса\B0F0CB59.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (45, 45, N'Товары автосервиса\F2B0E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (46, 46, N'Товары автосервиса\F200BC2F.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (47, 47, N'Товары автосервиса\5BB0C351.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (48, 48, N'Товары автосервиса\DC70BEC3.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (49, 49, N'Товары автосервиса\2E30E06C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (50, 50, N'Товары автосервиса\BA30C186.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (51, 51, N'Товары автосервиса\59B0BE73.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (52, 52, N'Товары автосервиса\90A0B807.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (53, 53, N'Товары автосервиса\F2E0E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (54, 54, N'Товары автосервиса\6CE0A012.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (55, 55, N'Товары автосервиса\45008C52.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (56, 56, N'Товары автосервиса\39A0C188.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (57, 57, N'Товары автосервиса\0070C563.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (58, 58, N'Товары автосервиса\FA90B138.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (59, 59, N'Товары автосервиса\022096CB.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (60, 60, N'Товары автосервиса\F460E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (61, 61, N'Товары автосервиса\40409946.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (62, 62, N'Товары автосервиса\2A109062.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (63, 63, N'Товары автосервиса\43E08C52.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (64, 64, N'Товары автосервиса\47E07CB5.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (65, 65, N'Товары автосервиса\F160E078.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (66, 66, N'Товары автосервиса\23106A35.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (67, 67, N'Товары автосервиса\03D096CB.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (68, 68, N'Товары автосервиса\30E0C751.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (69, 69, N'Товары автосервиса\96E0C1E7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (70, 70, N'Товары автосервиса\9290C1E7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (71, 71, N'Товары автосервиса\2E60E06C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (72, 72, N'Товары автосервиса\69C0CD62.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (73, 73, N'Товары автосервиса\3DF0E4BC.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (74, 74, N'Товары автосервиса\8F609ED7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (75, 75, N'Товары автосервиса\85C04040.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (77, 77, N'Товары автосервиса\97809225.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (78, 78, N'Товары автосервиса\E0A0E079.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (79, 79, N'Товары автосервиса\8E20A863.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (80, 80, N'Товары автосервиса\D4D0CE67.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (81, 81, N'Товары автосервиса\2B609062.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (82, 82, N'Товары автосервиса\BD80E8D5.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (83, 83, N'Товары автосервиса\5180B90E.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (84, 84, N'Товары автосервиса\2E00E06C.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (85, 85, N'Товары автосервиса\6DA0A012.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (86, 86, N'Товары автосервиса\39D0C188.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (87, 87, N'Товары автосервиса\6080DCD5.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (88, 88, N'Товары автосервиса\3DA0B713.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (89, 89, N'Товары автосервиса\43C09176.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (90, 90, N'Товары автосервиса\8430842A.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (91, 91, N'Товары автосервиса\CC10C869.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (92, 92, N'Товары автосервиса\8BC0C1A9.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (93, 93, N'Товары автосервиса\8F909ED7.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (94, 94, N'Товары автосервиса\5BE0C351.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (95, 95, N'Товары автосервиса\63C09E91.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (96, 96, N'Товары автосервиса\7B70B9C6.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (97, 97, N'Товары автосервиса\0D30C4EE.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (98, 98, N'Товары автосервиса\6800BB8A.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (99, 99, N'Товары автосервиса\9B3075EB.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (100, 100, N'Товары автосервиса\3970E753.jpg')
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (1, CAST(N'2019-02-22' AS Date), 9, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2019-11-20' AS Date), 94, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2019-10-05' AS Date), 40, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (4, CAST(N'2019-10-06' AS Date), 92, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2019-02-11' AS Date), 7, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (6, CAST(N'2019-11-03' AS Date), 8, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (7, CAST(N'2019-08-25' AS Date), 80, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (8, CAST(N'2019-04-08' AS Date), 46, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (9, CAST(N'2019-10-07' AS Date), 32, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (10, CAST(N'2019-12-30' AS Date), 81, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (11, CAST(N'2019-07-23' AS Date), 97, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (12, CAST(N'2019-05-08' AS Date), 63, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (13, CAST(N'2019-02-25' AS Date), 28, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (14, CAST(N'2019-11-16' AS Date), 70, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (15, CAST(N'2019-01-05' AS Date), 13, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (16, CAST(N'2019-01-03' AS Date), 12, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (17, CAST(N'2019-11-22' AS Date), 41, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (18, CAST(N'2019-12-18' AS Date), 55, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (19, CAST(N'2019-02-11' AS Date), 56, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (20, CAST(N'2019-11-09' AS Date), 82, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (21, CAST(N'2019-01-17' AS Date), 99, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (22, CAST(N'2019-07-27' AS Date), 74, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (23, CAST(N'2019-05-02' AS Date), 2, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (24, CAST(N'2019-03-23' AS Date), 36, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (25, CAST(N'2019-08-31' AS Date), 98, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (26, CAST(N'2019-04-02' AS Date), 54, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (27, CAST(N'2019-02-14' AS Date), 89, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (28, CAST(N'2019-06-30' AS Date), 3, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (29, CAST(N'2019-01-15' AS Date), 58, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (30, CAST(N'2019-12-25' AS Date), 23, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (31, CAST(N'2019-04-24' AS Date), 42, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (32, CAST(N'2019-05-11' AS Date), 89, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (33, CAST(N'2019-01-21' AS Date), 16, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (34, CAST(N'2019-08-22' AS Date), 99, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (35, CAST(N'2019-11-10' AS Date), 90, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (36, CAST(N'2019-01-20' AS Date), 67, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (37, CAST(N'2019-08-06' AS Date), 19, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (38, CAST(N'2019-09-25' AS Date), 84, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (39, CAST(N'2019-01-13' AS Date), 56, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (40, CAST(N'2019-11-21' AS Date), 74, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (41, CAST(N'2019-03-02' AS Date), 53, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (42, CAST(N'2019-02-16' AS Date), 39, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (43, CAST(N'2019-07-22' AS Date), 16, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (44, CAST(N'2019-12-26' AS Date), 49, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (45, CAST(N'2019-07-18' AS Date), 29, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (46, CAST(N'2019-06-02' AS Date), 48, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (47, CAST(N'2019-07-22' AS Date), 47, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (48, CAST(N'2019-03-27' AS Date), 80, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (49, CAST(N'2019-09-01' AS Date), 49, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (50, CAST(N'2019-02-27' AS Date), 84, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (51, CAST(N'2019-02-22' AS Date), 88, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (52, CAST(N'2019-01-18' AS Date), 29, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (53, CAST(N'2019-03-24' AS Date), 93, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (54, CAST(N'2019-10-21' AS Date), 36, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (55, CAST(N'2019-06-11' AS Date), 68, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (56, CAST(N'2019-06-08' AS Date), 33, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (57, CAST(N'2019-03-23' AS Date), 86, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (58, CAST(N'2019-07-21' AS Date), 29, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (59, CAST(N'2019-04-13' AS Date), 82, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (60, CAST(N'2019-01-24' AS Date), 79, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (61, CAST(N'2019-02-15' AS Date), 95, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (62, CAST(N'2019-07-04' AS Date), 2, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (63, CAST(N'2019-03-27' AS Date), 10, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (64, CAST(N'2019-11-14' AS Date), 14, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (65, CAST(N'2019-06-12' AS Date), 5, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (66, CAST(N'2019-08-07' AS Date), 48, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (67, CAST(N'2019-09-26' AS Date), 34, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (68, CAST(N'2019-09-04' AS Date), 47, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (69, CAST(N'2019-02-19' AS Date), 68, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (70, CAST(N'2019-05-14' AS Date), 71, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (71, CAST(N'2019-07-14' AS Date), 12, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (72, CAST(N'2019-01-01' AS Date), 21, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (73, CAST(N'2019-01-08' AS Date), 93, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (74, CAST(N'2019-03-07' AS Date), 68, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (75, CAST(N'2019-05-08' AS Date), 14, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (76, CAST(N'2019-07-29' AS Date), 11, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (77, CAST(N'2019-01-17' AS Date), 88, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (78, CAST(N'2019-01-02' AS Date), 22, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (79, CAST(N'2019-04-27' AS Date), 30, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (80, CAST(N'2019-10-11' AS Date), 27, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (81, CAST(N'2019-11-16' AS Date), 66, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (82, CAST(N'2019-07-28' AS Date), 18, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (83, CAST(N'2019-05-29' AS Date), 91, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (84, CAST(N'2019-05-23' AS Date), 66, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (85, CAST(N'2019-12-24' AS Date), 19, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (86, CAST(N'2019-03-10' AS Date), 16, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (87, CAST(N'2019-08-20' AS Date), 85, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (88, CAST(N'2019-03-27' AS Date), 53, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (89, CAST(N'2019-02-13' AS Date), 66, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (90, CAST(N'2019-09-20' AS Date), 7, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (91, CAST(N'2019-10-03' AS Date), 54, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (92, CAST(N'2019-10-08' AS Date), 98, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (93, CAST(N'2019-08-19' AS Date), 18, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (94, CAST(N'2019-10-09' AS Date), 93, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (95, CAST(N'2019-01-09' AS Date), 15, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (96, CAST(N'2019-07-26' AS Date), 12, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (97, CAST(N'2019-04-29' AS Date), 38, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (98, CAST(N'2019-11-22' AS Date), 18, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (99, CAST(N'2019-01-28' AS Date), 87, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (100, CAST(N'2019-05-25' AS Date), 97, 3, NULL)
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
