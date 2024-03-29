USE [master]
GO
/****** Object:  Database [KFC]    Script Date: 23.04.2022 1:37:32 ******/
CREATE DATABASE [KFC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KFC', FILENAME = N'D:\SERVERSQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\KFC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KFC_log', FILENAME = N'D:\SERVERSQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\KFC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KFC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KFC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KFC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KFC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KFC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KFC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KFC] SET ARITHABORT OFF 
GO
ALTER DATABASE [KFC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KFC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KFC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KFC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KFC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KFC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KFC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KFC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KFC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KFC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KFC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KFC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KFC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KFC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KFC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KFC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KFC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KFC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KFC] SET  MULTI_USER 
GO
ALTER DATABASE [KFC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KFC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KFC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KFC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KFC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KFC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KFC] SET QUERY_STORE = OFF
GO
USE [KFC]
GO
/****** Object:  Table [dbo].[CompositionOfOrders]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompositionOfOrders](
	[NumberOrder] [int] NOT NULL,
	[Course] [varchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_CompositionOfOrders] PRIMARY KEY CLUSTERED 
(
	[NumberOrder] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompositionOfTheDish]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompositionOfTheDish](
	[NameCourse] [varchar](100) NOT NULL,
	[IngredientName] [varchar](60) NOT NULL,
	[Amount] [int] NOT NULL,
	[Measure] [varchar](12) NOT NULL,
 CONSTRAINT [PK_DISHCOMPOUND] PRIMARY KEY CLUSTERED 
(
	[NameCourse] ASC,
	[IngredientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[NameCourse] [varchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[NameCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseSet]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSet](
	[NameSet] [varchar](100) NOT NULL,
	[Course] [varchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_CourseSet] PRIMARY KEY CLUSTERED 
(
	[NameSet] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodSet]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodSet](
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FoodSet] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[Name] [varchar](60) NOT NULL,
	[Calories] [int] NOT NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measure]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measure](
	[unit] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Measure] PRIMARY KEY CLUSTERED 
(
	[unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNumber] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 23.04.2022 1:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Кола', N'Кола', 500, N'мл')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Крылышки', N'Крылышки', 6, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Булочка для бургера', 3, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Кетчуп', 30, N'г')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Котлета говяжья', 400, N'г')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Лук', 1, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Майонез', 30, N'г')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Огурец', 1, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Помидор', 1, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Салат', 5, N'шт')
INSERT [dbo].[CompositionOfTheDish] ([NameCourse], [IngredientName], [Amount], [Measure]) VALUES (N'Сандерс', N'Сыр', 40, N'г')
GO
INSERT [dbo].[Course] ([NameCourse], [Cost]) VALUES (N'Кола', 89.0000)
INSERT [dbo].[Course] ([NameCourse], [Cost]) VALUES (N'Крылышки', 240.0000)
INSERT [dbo].[Course] ([NameCourse], [Cost]) VALUES (N'Сандерс', 209.0000)
GO
INSERT [dbo].[CourseSet] ([NameSet], [Course], [Count]) VALUES (N'КрыльяСРуджом', N'Кола', 1)
INSERT [dbo].[CourseSet] ([NameSet], [Course], [Count]) VALUES (N'КрыльяСРуджом', N'Крылышки', 1)
INSERT [dbo].[CourseSet] ([NameSet], [Course], [Count]) VALUES (N'КрыльяСРуджом', N'Сандерс', 1)
GO
INSERT [dbo].[FoodSet] ([Name]) VALUES (N'КрыльяСРуджом')
GO
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Булочка для бургера', 100)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Кетчуп', 60)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Кола', 105)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Котлета говяжья', 200)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Крылышки ', 508)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Лук', 40)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Майонез', 300)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Огурец', 16)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Помидор', 19)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Салат', 16)
INSERT [dbo].[Ingredients] ([Name], [Calories]) VALUES (N'Сыр', 400)
GO
INSERT [dbo].[Measure] ([unit]) VALUES (N'г')
INSERT [dbo].[Measure] ([unit]) VALUES (N'мл')
INSERT [dbo].[Measure] ([unit]) VALUES (N'шт')
GO
INSERT [dbo].[Status] ([Status]) VALUES (N'В очереди')
INSERT [dbo].[Status] ([Status]) VALUES (N'Готовится')
INSERT [dbo].[Status] ([Status]) VALUES (N'Готово')
INSERT [dbo].[Status] ([Status]) VALUES (N'Отдано')
GO
ALTER TABLE [dbo].[CompositionOfOrders]  WITH CHECK ADD  CONSTRAINT [FK_CompositionOfOrders_Course] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([NameCourse])
GO
ALTER TABLE [dbo].[CompositionOfOrders] CHECK CONSTRAINT [FK_CompositionOfOrders_Course]
GO
ALTER TABLE [dbo].[CompositionOfOrders]  WITH CHECK ADD  CONSTRAINT [FK_CompositionOfOrders_NumberOrder] FOREIGN KEY([NumberOrder])
REFERENCES [dbo].[Order] ([OrderNumber])
GO
ALTER TABLE [dbo].[CompositionOfOrders] CHECK CONSTRAINT [FK_CompositionOfOrders_NumberOrder]
GO
ALTER TABLE [dbo].[CompositionOfTheDish]  WITH CHECK ADD  CONSTRAINT [FK_CompositionOfTheDish_Course] FOREIGN KEY([NameCourse])
REFERENCES [dbo].[Course] ([NameCourse])
GO
ALTER TABLE [dbo].[CompositionOfTheDish] CHECK CONSTRAINT [FK_CompositionOfTheDish_Course]
GO
ALTER TABLE [dbo].[CompositionOfTheDish]  WITH CHECK ADD  CONSTRAINT [FK_CompositionOfTheDish_Ingredients] FOREIGN KEY([IngredientName])
REFERENCES [dbo].[Ingredients] ([Name])
GO
ALTER TABLE [dbo].[CompositionOfTheDish] CHECK CONSTRAINT [FK_CompositionOfTheDish_Ingredients]
GO
ALTER TABLE [dbo].[CompositionOfTheDish]  WITH CHECK ADD  CONSTRAINT [FK_CompositionOfTheDish_Measure] FOREIGN KEY([Measure])
REFERENCES [dbo].[Measure] ([unit])
GO
ALTER TABLE [dbo].[CompositionOfTheDish] CHECK CONSTRAINT [FK_CompositionOfTheDish_Measure]
GO
ALTER TABLE [dbo].[CourseSet]  WITH CHECK ADD  CONSTRAINT [FK_CourseSet_Course] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([NameCourse])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseSet] CHECK CONSTRAINT [FK_CourseSet_Course]
GO
ALTER TABLE [dbo].[CourseSet]  WITH CHECK ADD  CONSTRAINT [FK_CourseSet_FoodSet] FOREIGN KEY([NameSet])
REFERENCES [dbo].[FoodSet] ([Name])
GO
ALTER TABLE [dbo].[CourseSet] CHECK CONSTRAINT [FK_CourseSet_FoodSet]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_fk0] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_fk0]
GO
USE [master]
GO
ALTER DATABASE [KFC] SET  READ_WRITE 
GO
