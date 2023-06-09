USE [master]
GO
/****** Object:  Database [Prj301_project]    Script Date: 11/9/2022 9:58:38 PM ******/
CREATE DATABASE [Prj301_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prj301_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHANHSP\MSSQL\DATA\Prj301_project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prj301_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHANHSP\MSSQL\DATA\Prj301_project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prj301_project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prj301_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prj301_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prj301_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prj301_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prj301_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prj301_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prj301_project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Prj301_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prj301_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prj301_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prj301_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prj301_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prj301_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prj301_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prj301_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prj301_project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Prj301_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prj301_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prj301_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prj301_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prj301_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prj301_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prj301_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prj301_project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prj301_project] SET  MULTI_USER 
GO
ALTER DATABASE [Prj301_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prj301_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prj301_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prj301_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prj301_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prj301_project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prj301_project] SET QUERY_STORE = OFF
GO
USE [Prj301_project]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[smallImage] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galery]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galery](
	[galeryId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[thumbnail] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[galeryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[odId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[ProductId] [int] NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[totalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[odId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[fullname] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Phone_number] [varchar](20) NULL,
	[address] [varchar](200) NULL,
	[order_date] [datetime] NULL,
	[totalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NULL,
	[title] [varchar](350) NULL,
	[price] [int] NULL,
	[discount] [int] NULL,
	[thumbnail] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/9/2022 9:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Phone_number] [varchar](20) NULL,
	[address] [varchar](200) NULL,
	[password] [varchar](30) NULL,
	[created_at] [datetime] NULL,
	[roleID] [int] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryId], [name], [smallImage]) VALUES (1, N'Nike', N'images/b1.jpg')
INSERT [dbo].[Categories] ([categoryId], [name], [smallImage]) VALUES (2, N'Camper', N'images/b2.jpg')
INSERT [dbo].[Categories] ([categoryId], [name], [smallImage]) VALUES (3, N'Converse', N'images/b4.jpg')
INSERT [dbo].[Categories] ([categoryId], [name], [smallImage]) VALUES (4, N'Puma', N'images/b5.jpg')
INSERT [dbo].[Categories] ([categoryId], [name], [smallImage]) VALUES (5, N'Adidas', N'images/b6.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Galery] ON 

INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (1, 1, N'images/nike0.png')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (2, 1, N'images/nike0_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (3, 1, N'images/nike0_2.png')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (4, 1, N'images/nike0_3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (5, 1, N'images/nike0_4.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (6, 1, N'images/nike0_5.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (7, 1, N'images/nike0_6.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (8, 2, N'images/camper0.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (9, 2, N'images/camper0_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (10, 2, N'images/camper0_2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (11, 2, N'images/camper0_3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (12, 3, N'images/converse0.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (13, 3, N'images/converse0_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (14, 3, N'images/converse0_2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (15, 3, N'images/converse0_3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (16, 3, N'images/converse0_4.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (17, 6, N'images/nike1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (18, 6, N'images/nike1_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (19, 6, N'images/nike1_2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (20, 6, N'images/nike1_3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (21, 7, N'images/nike2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (22, 8, N'images/nike3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (23, 10, N'images/camper2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (24, 11, N'images/camper3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (25, 12, N'images/nike4.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (26, 16, N'images/nike5.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (27, 17, N'images/p6.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (28, 18, N'images/p8.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (29, 19, N'images/nike6_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (30, 20, N'images/nike7.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (31, 21, N'images/nike8.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (32, 22, N'images/nike9.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (33, 23, N'images/nike10.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (34, 23, N'images/nike10.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (35, 22, N'images/nike9.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (36, 21, N'images/nike8.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (37, 20, N'images/nike7.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (38, 19, N'images/nike6_1.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (39, 18, N'images/p8.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (40, 17, N'images/p6.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (41, 16, N'images/nike5.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (42, 12, N'images/nike4.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (43, 11, N'images/camper3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (44, 10, N'images/camper2.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (45, 8, N'images/nike3.jpg')
INSERT [dbo].[Galery] ([galeryId], [productId], [thumbnail]) VALUES (46, 7, N'images/nike2.jpg')
SET IDENTITY_INSERT [dbo].[Galery] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (1, 1, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (2, 2, 1, 2400000, 1, 2400000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (3, 3, 1, 2400000, 2, 4800000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (4, 4, 2, 5040000, 1, 5040000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (5, 5, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (6, 6, 3, 5300000, 1, 5300000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (7, 7, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (8, 8, 6, 4600000, 3, 13800000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (9, 9, 6, 4600000, 1, 4600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (10, 10, 7, 3700000, 1, 3700000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (11, 11, 11, 1500000, 1, 1500000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (12, 12, 7, 3700000, 1, 10500000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (13, 12, 8, 6800000, 1, 10500000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (14, 13, 11, 1500000, 2, 3000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (15, 14, 12, 2500000, 1, 2500000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (16, 15, 23, 3390000, 2, 6780000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (17, 16, 6, 4600000, 2, 9200000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (18, 17, 11, 1500000, 2, 3000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (19, 18, 1, 2000000, 1, 11200000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (20, 18, 6, 4600000, 2, 11200000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (21, 19, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (22, 21, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (23, 22, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (24, 23, 6, 4600000, 1, 4600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (25, 24, 1, 2000000, 1, 11200000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (26, 24, 6, 4600000, 2, 11200000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (27, 25, 1, 2000000, 1, 6600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (28, 25, 6, 4600000, 1, 6600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (29, 26, 1, 2000000, 3, 6000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (30, 27, 6, 4600000, 1, 4600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (31, 28, 1, 2000000, 1, 2000000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (32, 29, 1, 2000000, 1, 6600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (33, 29, 6, 4600000, 1, 6600000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (34, 30, 1, 2000000, 1, 17100000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (35, 30, 6, 4600000, 1, 17100000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (36, 30, 7, 3700000, 1, 17100000)
INSERT [dbo].[Order_Details] ([odId], [orderId], [ProductId], [price], [quantity], [totalMoney]) VALUES (37, 30, 8, 6800000, 1, 17100000)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (1, 1, N'Khanh Dang', N'khanhdang@gmail.com', N'0987654321', N'Ha Noi', CAST(N'2022-12-02T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (2, 2, N'user2', N'user2se12345@gmail.com', N'0987654345', N'Ha Noi', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 2400000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (3, 2, N'user2', N'user2se12345@gmail.com', N'0987654345', N'Ha Noi', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 4800000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (4, 5, N'Dang Dinh Hoang', N'HoangFPLhe151234@gmail.com', N'0987554345', N'Bien Giang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 5040000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (5, 5, N'Dang Dinh Hoang', N'HoangFPLhe151234@gmail.com', N'0987554345', N'Bien Giang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (6, 5, N'Dang Dinh Hoang', N'HoangFPLhe151234@gmail.com', N'0987554345', N'Bien Giang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 5300000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (7, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (8, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 13800000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (9, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 4600000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (10, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 3700000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (11, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 1500000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (12, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 10500000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (13, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 3000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (14, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 2500000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (15, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 6780000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (16, 2, N'user2', N'user2se12345@gmail.com', N'0987654345', N'Ha Noi', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 9200000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (17, 2, N'user2', N'user2se12345@gmail.com', N'0987654345', N'Ha Noi', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 3000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (18, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-27T00:00:00.000' AS DateTime), 11200000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (19, 3, N'Ð?ng dình QU?c khánh', N'khanhddqhe161879@fpt.edu.vn', N'098743234', N'ha noi', CAST(N'2022-10-28T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (20, 1, N'Admin', N'Adminph34275@gmail.com', N'0987654321', N'Ha Noi', CAST(N'2022-10-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (21, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-28T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (22, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-28T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (23, 1, N'Admin', N'Adminph34275@gmail.com', N'0987654321', N'Ha Noi', CAST(N'2022-10-31T00:00:00.000' AS DateTime), 4600000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (24, 5, N'Dang Dinh Hoang', N'HoangFPLhe151234@gmail.com', N'0987554345', N'Bien Giang', CAST(N'2022-10-31T00:00:00.000' AS DateTime), 11200000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (25, 3, N'Ð?ng dình QU?c khánh', N'khanhddqhe161879@fpt.edu.vn', N'098743234', N'ha noi', CAST(N'2022-10-31T00:00:00.000' AS DateTime), 6600000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (26, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-10-31T00:00:00.000' AS DateTime), 6000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (27, 1, N'Admin', N'Adminph34275@gmail.com', N'0987654321', N'Ha Noi', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 4600000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (28, 3, N'Ð?ng dình QU?c khánh', N'khanhddqhe161879@fpt.edu.vn', N'098743234', N'ha noi', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 2000000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (29, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-11-05T00:00:00.000' AS DateTime), 6600000)
INSERT [dbo].[Orders] ([orderId], [userID], [fullname], [Email], [Phone_number], [address], [order_date], [totalMoney]) VALUES (30, 6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', CAST(N'2022-11-07T00:00:00.000' AS DateTime), 17100000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (1, 1, N'Nike Air Jordan', 2000000, 4000000, N'images/nike0.png', N'Giày Air Jordan 1 Low ‘White Wolf Grey’ DC0774-105. Ði êm chân l?m. Không tin th? mà xem', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 183)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (2, 2, N'Line Link 67009', 4200000, 5000000, N'images/camper0.jpg', N'Em Chan khi chay nhieu', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 298)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (3, 3, N'Athletic Shoe', 5300000, 7000000, N'images/converse0.jpg', N'Chong tham chong nuoc', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 198)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (6, 1, N'Nike Roshe Run 2', 4600000, 6000000, N'images/nike1.jpg', N'Giày Nike Air Jordan 1 University Blue Siêu C?p d?p & Ch?t', CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 183)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (7, 1, N'Nike Air', 3700000, 4000000, N'images/nike2.jpg', N'Nike Wmns Air Jordan 1 Low Gym Red Black', CAST(N'2021-07-03T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 192)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (8, 1, N'NIKE AIR FORCE', 6800000, 8000000, N'images/nike3.jpg', N'GIÀY NIKE AIR FORCE 1 ALL WHITE TR?NG REP 11 LIKE AUTH', CAST(N'2021-08-02T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 297)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (10, 2, N'Camper Shoes 1', 2600000, 3000000, N'images/camper2.jpg', N'Giày Da tr?ng tham nuoc', CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 250)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (11, 2, N'Camper Shoes 2', 1500000, 3500000, N'images/camper3.jpg', N'Giày Da tr?ng tham nuoc', CAST(N'2021-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 95)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (12, 1, N'Men''s Shoes', 2500000, 5000000, N'images/nike4.jpg', N'Nike Air Max Flyknit Racer', CAST(N'2021-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 229)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (16, 1, N'Men''s Shoes', 4490000, 6000000, N'images/nike5.jpg', N'Giày Nike Air Jordan 1 Low Paris Ð?p & Ch?t', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-05-01T00:00:00.000' AS DateTime), 245)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (17, 4, N'Veronique', 6500000, 7000000, N'images/p6.jpg', N'sang trong, dam chat rang ngoi', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 330)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (18, 5, N'Suede Boots', 7000000, 800000, N'images/p8.jpg', N'Giay thuoc mot trong nhung doi em chan nhat the gioi', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 33)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (19, 1, N'Nike Air Force ', 4690000, 6000000, N'images/nike6_1.jpg', N'Ph?n d? giày mang d?n c?m giác êm ái nhung không kém ph?n ch?c ch?n, phù h?p cho dân t?p luy?n th? thao v?i các cú b?t ngu?i “th?n s?u”. Ch?t li?u ? trên s? d?ng v?i gân có màu tr?ng ngà, s? d?ng các du?ng may n?i d? l?i nh?ng d?u ch?m nh? nh?m trang trí trên m?u giày mang s?c tr?ng, hình cây kéo nh? xíu du?c in ? bên logo c?a hãng Nike. Bên hông là logo thuong hi?u Nike quen thu?c.', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 445)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (20, 1, N'Nike Air Force 1  ', 3690000, 4590000, N'images/nike7.jpg', N'có công ngh? d?m Air mang tính cách m?ng c?a Swoosh bên trong gót chân c?a nó', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 222)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (21, 1, N'Nike DX6065-101', 5290000, 7000000, N'images/nike8.jpg', N'Nhe Em Chan', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 333)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (22, 1, N'Nike ‘Sun Club’', 2500000, 4000000, N'images/nike9.jpg', N'giày th? thao bóng r? d?u tiên ', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 555)
INSERT [dbo].[Products] ([productId], [categoryId], [title], [price], [discount], [thumbnail], [description], [created_at], [updated_at], [quantity]) VALUES (23, 1, N'Nike Phantom', 3390000, 4490000, N'images/nike10.jpg', N'k?t c?u ch?ng tru?t', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 97)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleId], [name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([roleId], [name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [fullname], [Email], [Phone_number], [address], [password], [created_at], [roleID], [updated_at], [deleted]) VALUES (1, N'Admin', N'Adminph34275@gmail.com', N'0987654321', N'Ha Noi', N'123456', CAST(N'2022-10-16T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User] ([userId], [fullname], [Email], [Phone_number], [address], [password], [created_at], [roleID], [updated_at], [deleted]) VALUES (2, N'user2', N'user2se12345@gmail.com', N'0987654345', N'Ha Noi', N'12341', CAST(N'2022-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User] ([userId], [fullname], [Email], [Phone_number], [address], [password], [created_at], [roleID], [updated_at], [deleted]) VALUES (3, N'Ð?ng dình QU?c khánh', N'khanhddqhe161879@fpt.edu.vn', N'098743234', N'ha noi', N'123456', CAST(N'2022-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User] ([userId], [fullname], [Email], [Phone_number], [address], [password], [created_at], [roleID], [updated_at], [deleted]) VALUES (5, N'Dang Dinh Hoang', N'HoangFPLhe151234@gmail.com', N'0987554345', N'Bien Giang', N'123456', CAST(N'2022-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User] ([userId], [fullname], [Email], [Phone_number], [address], [password], [created_at], [roleID], [updated_at], [deleted]) VALUES (6, N'Le The Bao', N'Baohe12345@gmail.com', N'0987654234', N'Cao Bang', N'12345', CAST(N'2022-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-16T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Galery]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[Galery] CHECK CONSTRAINT [FK_Product]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_product2] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_product2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_ROLE] FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_ROLE]
GO
USE [master]
GO
ALTER DATABASE [Prj301_project] SET  READ_WRITE 
GO
