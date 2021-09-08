USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 07-Sep-21 8:49:27 PM ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[OrderDetailID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__tblOrderD__Order__1273C1CD]  DEFAULT (newid()),
	[OrderID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__tblOrderD__Order__1367E606]  DEFAULT (newid()),
	[ProductID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[Date] [datetime] NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblOrderDetails ] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__tblOrders__Order__164452B1]  DEFAULT (newid()),
	[UserID] [varchar](10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[Writer] [nvarchar](50) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
	[PublicationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [varchar](10) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StastusID] [varchar](10) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StastusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 07-Sep-21 8:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [varchar](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[RoleID] [varchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Bank] [varchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'G1', N'Ghost', N'ThaiLand', N'A')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'G2', N'Ghost', N'American', N'A')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'L1', N'Love', N'Việt Nam', N'A')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'L2', N'Love', N'Lào', N'A')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'S1', N'Science', N'England', N'A')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Country], [StatusID]) VALUES (N'S2', N'Science', N'Úc', N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'd212c634-b568-43eb-9522-02527fb0e15b', N'29631726-307e-4b82-8cfc-d65f3992d125', N'B54', 2, 178000.0000, CAST(N'2021-07-11 10:38:46.110' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'bcfb76aa-0ef1-4946-b7be-0406b163ca6d', N'faa3fd6f-beac-4563-b17d-109ea1976e3a', N'B55', 1, 72000.0000, CAST(N'2021-07-11 17:49:34.370' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2ac050b0-0dc6-44da-906b-0b9c7ecdeb32', N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'B6', 1, 111000.0000, CAST(N'2021-07-12 09:03:51.477' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'84033b65-0c10-4120-8fd7-0e668b6fdc27', N'd07c2cff-a889-4499-bc75-bc3e26b786ca', N'B55', 2, 144000.0000, CAST(N'2021-07-14 09:40:22.197' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e9432ced-cf09-496c-97f1-18bc6b3c50d5', N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'B1', 15, 1950000.0000, CAST(N'2021-07-20 14:44:06.340' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e08fe5fc-cc27-4e8d-855a-1c6362c7ab33', N'42cb4152-a50c-4895-81d2-17c889d5abd6', N'B55', 1, 72000.0000, CAST(N'2021-07-11 10:44:06.733' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'a4cffbfa-5302-490a-aed9-2dc3b9db2e4b', N'8efd0f0a-db49-41e6-9b2c-5cb60db89f5c', N'B74', 1, 67000.0000, CAST(N'2021-08-31 10:15:12.073' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e8e5c00d-ca8a-4e01-9d9e-311330f74854', N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'B63', 1, 81000.0000, CAST(N'2021-07-19 19:36:18.943' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'acf7807c-2edb-494a-b1b5-348f63d0e56e', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B46', 2, 210000.0000, CAST(N'2021-07-14 09:33:13.803' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5a2195f0-9358-4081-8eae-36531e9f6886', N'9ca78bb0-72d8-4002-97d1-06081daa5b75', N'B56', 13, 1287000.0000, CAST(N'2021-07-14 10:07:21.960' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6c935653-c8c4-454e-90a9-437f5fb1a083', N'87656095-00e0-42d6-bc19-fb3a7ba0846b', N'B55', 2, 144000.0000, CAST(N'2021-07-11 10:39:49.027' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'1153f6f3-2608-4dac-9b13-4630ddcac053', N'd62f8f28-230f-4c8e-8de3-84e55884e07c', N'B54', 1, 89000.0000, CAST(N'2021-07-12 09:36:17.433' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f176f958-63aa-4ce1-9002-4655d6a14626', N'fc2ec0c2-9e92-4d5c-b372-a4c34b4c8cc4', N'B30', 1, 70000.0000, CAST(N'2021-07-13 08:56:57.010' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'898ae404-b159-45e0-8f6f-4e856378ca53', N'02b5d4c3-025f-4fbe-b9ee-7b38087eb585', N'B76', 15, 480000.0000, CAST(N'2021-07-14 10:28:32.287' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'7b3b8070-4a33-4a08-8d87-5142a53a6601', N'946a12f1-9e90-414e-ac23-79db39a66a69', N'B56', 2, 198000.0000, CAST(N'2021-08-31 10:19:27.850' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'aa3bdae0-aee4-4683-9301-5639aca4dfa3', N'd8124748-5d95-4ec4-98c7-7fdcaeee58f9', N'B55', 3, 216000.0000, CAST(N'2021-07-14 10:05:39.810' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'11e08c0f-dbb2-4467-8e81-571e9b1bb3f2', N'1220464f-229b-4e25-8cf6-53921b5b7c92', N'B55', 2, 144000.0000, CAST(N'2021-07-14 19:13:13.380' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5a68be51-e040-422c-9938-60ffa4826cd6', N'8f3c23c9-da51-4e76-87c1-1becbc4272b1', N'B55', 1, 72000.0000, CAST(N'2021-07-12 09:36:30.663' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'9401b62a-834c-475e-87dc-61d4393d8740', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B26', 1, 50000.0000, CAST(N'2021-07-14 09:33:13.807' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'0e31c8d0-5140-41be-8d6a-66d3cdc2ced5', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B75', 1, 52000.0000, CAST(N'2021-07-14 09:58:51.453' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6aefde3f-9dab-48d0-ab07-6b7affd6a586', N'e146a882-2849-415c-887d-7914fc45f0d9', N'B61', 1, 121000.0000, CAST(N'2021-07-14 19:02:24.343' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5af1e3be-696e-4d3b-acf0-6cc1cbd1ba5c', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B54', 2, 178000.0000, CAST(N'2021-07-14 09:58:51.453' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'90de6180-b285-422a-9058-7287c47e741d', N'49233a45-c1af-4068-a381-14ef86c219df', N'B43', 1, 120000.0000, CAST(N'2021-07-13 08:56:24.197' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'c2fbcdde-f8d0-41a2-8f30-8601240955a4', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B71', 2, 70000.0000, CAST(N'2021-07-14 09:49:18.860' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'225ee942-27d9-4672-8b8d-8b32ade189aa', N'7aafb04b-7620-4584-b484-060996382b23', N'B76', 9, 288000.0000, CAST(N'2021-07-14 10:26:24.490' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3bf753fc-d0bf-4e12-869c-8b55f53c8b7e', N'e6fae982-461e-4fa8-a3b9-16778c6ba020', N'B77', 2, 158000.0000, CAST(N'2021-07-11 10:59:04.030' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8dc462df-c70d-49eb-8f2e-9291bc124640', N'9bc6bdfb-5d19-4ca3-8c7c-1bd9d1e56499', N'B72', 1, 39000.0000, CAST(N'2021-07-12 09:03:03.020' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8a8bb116-4b67-42f7-97e2-958380b0d9dc', N'776ed31b-ccff-4fdd-9a87-4d6814e79b8a', N'B77', 3, 237000.0000, CAST(N'2021-07-11 19:16:51.987' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'45083eee-a9d7-44a4-9a41-97c9b22e896e', N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'B56', 1, 99000.0000, CAST(N'2021-07-14 19:02:02.050' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8a5f4da7-3c48-469d-8217-ae4bd5befa17', N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'B61', 1, 121000.0000, CAST(N'2021-07-12 09:03:51.477' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'714b8253-e877-47d5-9ded-af388843fa9e', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B54', 2, 178000.0000, CAST(N'2021-07-14 09:49:18.853' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8f6795a1-33a8-4bcc-ac52-af3e7845d3ba', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B55', 1, 72000.0000, CAST(N'2021-07-14 09:49:18.857' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'83f287ec-c1d4-4dba-a565-bac076b78d39', N'9d08c494-47ca-4730-bcb3-eefc4c0d7fe4', N'B44', 2, 240000.0000, CAST(N'2021-07-14 09:49:46.577' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2c50e52f-a7aa-43f2-9fd9-c25ca94eb19e', N'd0b813c0-327e-4452-a3c8-0c506014425f', N'B55', 2, 144000.0000, CAST(N'2021-07-17 08:32:54.667' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6cc219ef-30ad-4142-9fb8-c3ba73d9a29d', N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'B2', 1, 90000.0000, CAST(N'2021-07-20 14:44:06.340' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2fab7eb3-b3ec-41d4-9e6e-c77098d44d29', N'ebe627c0-74e7-493a-962b-9e921bc3ad38', N'B29', 1, 90000.0000, CAST(N'2021-08-31 10:17:32.747' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f4569bb2-cff5-46e1-baaa-c7d2c3268709', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B76', 1, 32000.0000, CAST(N'2021-07-14 09:58:51.457' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'63db3540-3189-4600-a047-d3b361192c7c', N'81269724-164a-4f73-86e6-49a517f799e5', N'B55', 1, 72000.0000, CAST(N'2021-07-15 13:47:37.143' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2f095c7f-76cd-4b07-b5ee-e2a33930d823', N'13ec70ac-5eca-4f5f-9a06-bf1fdf6ada91', N'B46', 9, 945000.0000, CAST(N'2021-07-14 10:13:35.263' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'4f8faef6-463b-4403-bb2e-ea24c8a094ba', N'4792cecd-8a90-45ee-91a2-7e6e0a0bfc8a', N'B54', 4, 356000.0000, CAST(N'2021-08-31 08:51:21.707' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'686823a1-3c9d-440b-a66a-eba06a4b6038', N'a19e1c3d-6c5e-42f8-81ac-148e221983b4', N'B55', 1, 72000.0000, CAST(N'2021-07-13 15:26:23.900' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'162ca894-bbf3-4dbf-9136-f2eb3fcd5f3d', N'27b0ed89-c4ee-4df4-83e1-422ad066d955', N'B55', 2, 144000.0000, CAST(N'2021-07-11 18:44:01.160' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2efd59e6-2a4b-4ce0-a335-f47ef7f39ccd', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B29', 1, 90000.0000, CAST(N'2021-07-14 09:33:13.807' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'4facd468-5301-4274-b61b-f8300b8fc9ca', N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'B74', 1, 67000.0000, CAST(N'2021-07-19 19:36:18.940' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'0782cb7f-4a59-451b-8f27-f8ced98df922', N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'B55', 2, 144000.0000, CAST(N'2021-07-14 19:02:02.047' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3290b3e4-c1b4-4079-a3d2-fd1220795e57', N'd1486a8b-2004-43a2-b99e-12dc0b0eee02', N'B26', 17, 850000.0000, CAST(N'2021-07-14 10:22:34.753' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8bcfba3e-3494-4303-ac9f-fd48f0e4f564', N'40289e24-cc6d-4ff3-95cf-07edad3a5681', N'B72', 1, 39000.0000, CAST(N'2021-07-13 19:25:50.120' AS DateTime), N'A')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'3cae7dcd-94ed-4be3-8b22-027fb0f60412', N'se2', CAST(N'2021-07-14 10:13:40.163' AS DateTime), 315000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9ca78bb0-72d8-4002-97d1-06081daa5b75', N'se2', CAST(N'2021-07-14 10:07:16.667' AS DateTime), 1287000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7aafb04b-7620-4584-b484-060996382b23', N'se2', CAST(N'2021-07-14 10:24:45.040' AS DateTime), 288000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'b5975414-dda9-47f3-bd0b-06fbf2546b7d', N'se2', CAST(N'2021-07-14 09:21:45.153' AS DateTime), 563000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'40289e24-cc6d-4ff3-95cf-07edad3a5681', N'se2', CAST(N'2021-07-13 16:24:01.413' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd0b813c0-327e-4452-a3c8-0c506014425f', N'se2', CAST(N'2021-07-15 13:51:18.500' AS DateTime), 9216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'00c0bb24-0de8-441e-a109-0e96e5ad8784', N'se2', CAST(N'2021-07-11 19:05:07.270' AS DateTime), 144000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'066337b2-d455-4a11-b848-101b2ce51e78', N'se2', CAST(N'2021-07-15 12:56:31.237' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'faa3fd6f-beac-4563-b17d-109ea1976e3a', N'se2', CAST(N'2021-07-11 17:49:29.057' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd1486a8b-2004-43a2-b99e-12dc0b0eee02', N'se21', CAST(N'2021-07-14 10:22:11.810' AS DateTime), 850000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a19e1c3d-6c5e-42f8-81ac-148e221983b4', N'se2', CAST(N'2021-07-13 15:26:19.300' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'49233a45-c1af-4068-a381-14ef86c219df', N'se38', CAST(N'2021-07-13 08:53:58.840' AS DateTime), 120000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'se2', CAST(N'2021-07-14 09:32:08.510' AS DateTime), 350000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e6fae982-461e-4fa8-a3b9-16778c6ba020', N'se6', CAST(N'2021-07-11 10:58:59.817' AS DateTime), 158000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'42cb4152-a50c-4895-81d2-17c889d5abd6', N'se2', CAST(N'2021-07-11 10:43:59.523' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9bc6bdfb-5d19-4ca3-8c7c-1bd9d1e56499', N'se2', CAST(N'2021-07-12 09:01:10.390' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8f3c23c9-da51-4e76-87c1-1becbc4272b1', N'se2', CAST(N'2021-07-12 09:36:23.440' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'75557b8f-d7e4-4b7e-a4dc-1d0c3143bc5b', N'se2', CAST(N'2021-07-12 09:02:42.347' AS DateTime), 288000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'se2', CAST(N'2021-07-14 09:58:09.900' AS DateTime), 262000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'02ac8626-3a31-45a6-bdcb-3f2b241443b3', N'se2', CAST(N'2021-07-11 10:40:57.717' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7c43973d-2994-46be-aa36-3f3a11a2e43b', N'se21', CAST(N'2021-07-14 10:23:59.670' AS DateTime), 89000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'cb19c2f3-a330-4985-ab31-403f06090bf3', N'se2', CAST(N'2021-07-13 19:25:45.650' AS DateTime), 39000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'27b0ed89-c4ee-4df4-83e1-422ad066d955', N'se2', CAST(N'2021-07-11 18:43:54.810' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'5a430990-39c5-4dfd-910f-434490c136d7', N'se2', CAST(N'2021-07-13 20:01:49.843' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'81269724-164a-4f73-86e6-49a517f799e5', N'se2', CAST(N'2021-07-15 13:47:33.177' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'776ed31b-ccff-4fdd-9a87-4d6814e79b8a', N'se41', CAST(N'2021-07-11 19:16:44.690' AS DateTime), 237000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'1220464f-229b-4e25-8cf6-53921b5b7c92', N'se2', CAST(N'2021-07-14 19:02:33.807' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8efd0f0a-db49-41e6-9b2c-5cb60db89f5c', N'se3', CAST(N'2021-08-31 10:15:08.143' AS DateTime), 67000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'se2', CAST(N'2021-07-14 09:48:41.393' AS DateTime), 320000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9fae6eda-66d6-4f65-a557-5f856e61a72d', N'se41', CAST(N'2021-07-11 19:15:59.877' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'se84', CAST(N'2021-07-20 14:42:41.853' AS DateTime), 2040000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8c2a0c06-e4a7-48ce-804f-7257e84c0c18', N'se21', CAST(N'2021-07-14 10:17:19.067' AS DateTime), 900000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8888297a-a264-4cc1-994a-72bd9ea3d958', N'se2', CAST(N'2021-07-11 10:38:06.060' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'3712711d-7f2f-4942-9c81-775d5d2f2cb9', N'se38', CAST(N'2021-07-13 08:57:08.333' AS DateTime), 120000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e146a882-2849-415c-887d-7914fc45f0d9', N'se2', CAST(N'2021-07-14 19:02:19.843' AS DateTime), 121000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'946a12f1-9e90-414e-ac23-79db39a66a69', N'se2', CAST(N'2021-08-31 10:19:24.507' AS DateTime), 198000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'02b5d4c3-025f-4fbe-b9ee-7b38087eb585', N'se2', CAST(N'2021-07-14 10:28:25.907' AS DateTime), 480000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e1288291-eb6e-4ae4-8ba1-7b3d4eddb24c', N'se2', CAST(N'2021-08-31 09:21:39.760' AS DateTime), 216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4792cecd-8a90-45ee-91a2-7e6e0a0bfc8a', N'se17', CAST(N'2021-08-31 08:51:10.947' AS DateTime), 356000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd8124748-5d95-4ec4-98c7-7fdcaeee58f9', N'se2', CAST(N'2021-07-14 10:05:34.223' AS DateTime), 216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd62f8f28-230f-4c8e-8de3-84e55884e07c', N'se2', CAST(N'2021-07-12 09:36:09.620' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a74ebdf4-35b0-452e-959c-865ee0c30a35', N'se2', CAST(N'2021-07-13 19:25:02.160' AS DateTime), 110000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd9f61cd8-6f58-4dfd-bebd-8b1b035b3bdf', N'se2', CAST(N'2021-07-17 08:32:45.637' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'0d986362-e6d5-48ab-997c-908cf1c33a2d', N'se2', CAST(N'2021-07-17 08:33:15.947' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'se2', CAST(N'2021-07-12 09:03:28.077' AS DateTime), 232000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd8910835-f80a-46e3-80ca-9634c0145062', N'se65', CAST(N'2021-07-13 15:28:55.470' AS DateTime), 50000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4642d030-7ff5-480f-a5b8-99004ad8ff41', N'se2', CAST(N'2021-07-11 10:44:31.280' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c1fb28cc-2c07-4975-8911-99bc342b65ff', N'se2', CAST(N'2021-07-12 09:04:07.240' AS DateTime), 32000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6bf98eb9-bcb2-4b95-b3fe-9b500f213dc1', N'se2', CAST(N'2021-07-13 20:58:38.853' AS DateTime), 89000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ebe627c0-74e7-493a-962b-9e921bc3ad38', N'se3', CAST(N'2021-08-31 10:16:03.817' AS DateTime), 90000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'497eb1e6-8053-49df-a551-a009042371f7', N'se21', CAST(N'2021-07-11 10:38:18.560' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fc2ec0c2-9e92-4d5c-b372-a4c34b4c8cc4', N'se38', CAST(N'2021-07-13 08:56:49.653' AS DateTime), 70000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'307bb79e-a911-43ba-ae66-aef72ee7217d', N'se2', CAST(N'2021-07-13 20:48:00.827' AS DateTime), 144000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'2fc596e5-de22-4bb5-8c51-b09cf3e9aaf5', N'se2', CAST(N'2021-07-12 09:36:34.270' AS DateTime), 576000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd07c2cff-a889-4499-bc75-bc3e26b786ca', N'se2', CAST(N'2021-07-14 09:37:11.360' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'bd0d4a4a-a1c4-4b30-a207-beb0cdcb086b', N'se2', CAST(N'2021-07-14 09:25:27.907' AS DateTime), 32000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'13ec70ac-5eca-4f5f-9a06-bf1fdf6ada91', N'se2', CAST(N'2021-07-14 10:13:23.963' AS DateTime), 945000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'29631726-307e-4b82-8cfc-d65f3992d125', N'se2', CAST(N'2021-07-11 10:38:36.233' AS DateTime), 178000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'69de9890-decd-42a8-89f7-d78e2c168672', N'se2', CAST(N'2021-07-11 14:31:03.053' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6d647f0f-ed86-42c2-9f3f-dc7a2bd3bd09', N'se2', CAST(N'2021-07-14 10:07:26.377' AS DateTime), 198000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'se2', CAST(N'2021-07-14 19:01:48.170' AS DateTime), 243000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8cc839e7-182b-42ae-a4b2-e15c1817fdb6', N'se3', CAST(N'2021-08-31 10:12:42.853' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9d08c494-47ca-4730-bcb3-eefc4c0d7fe4', N'se2', CAST(N'2021-07-14 09:49:37.530' AS DateTime), 240000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6c2e6cab-f27d-4656-ac99-f1bef4c8e684', N'se2', CAST(N'2021-07-12 09:02:56.863' AS DateTime), 39000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'161def58-95bc-4772-a800-f480f2029395', N'se2', CAST(N'2021-07-14 09:01:22.827' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'se63', CAST(N'2021-07-19 19:35:44.017' AS DateTime), 148000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'da266ae0-4cbf-42b6-b697-f6029a73d9cb', N'se2', CAST(N'2021-07-11 10:40:03.807' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'87656095-00e0-42d6-bc19-fb3a7ba0846b', N'se2', CAST(N'2021-07-11 10:39:14.440' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B1', N'Harry Potter 1', N'L1', N'J. K. Rowling', 0, 130000.0000, N'I', CAST(N'2021-06-27 18:07:08.490' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B11', N'Harry Potter 2', N'G1', N'J. K. Rowling', 19, 102000.0000, N'A', CAST(N'2021-06-27 18:13:41.723' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B12', N'Harry Potter 3', N'G1', N'J. K. Rowling', 20, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B13', N'Harry Potter 4', N'G1', N'J. K. Rowling', 16, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B14', N'Harry Potter 5', N'G1', N'J. K. Rowling', 20, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B2', N'Harry Potter 6', N'L2', N'J. K. Rowling', 20, 90000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B21', N'Harry Potter 7', N'L1', N'J. K. Rowling', 14, 160000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B22', N'Harry Potter 8', N'L1', N'J. K. Rowling', 16, 110000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B23', N'Harry Potter 9', N'L1', N'J. K. Rowling', 32, 100000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B24', N'Love is gone 4', N'L1', N'Peter', 111, 120000.0000, N'A', CAST(N'2021-06-27 18:11:30.787' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B25', N'IT Book', N'L2', N'Peter', 15, 60000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B26', N'Artificial Intelligence', N'L2', N'Peter', 21, 50000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B27', N'No love no life', N'L2', N'Peter', 17, 70000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B28', N'No eat no life', N'L2', N'Oliver', 34, 100000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B29', N'Stupid person', N'L2', N'Oliver', 13, 90000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B30', N'Life of the Time Cat', N'L2', N'Oliver', 22, 70000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B42', N'Life of the Time Dog', N'G2', N'Oliver', 22, 100000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B43', N'The A to Z of Fighting Boredom', N'G2', N'Oliver', 20, 120000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B44', N'Beloved 1', N'G2', N'George', 52, 120000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B45', N'Don Quixote', N'G2', N'George', 12, 110000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B46', N'Beloved 2', N'G2', N'George', 32, 105000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B51', N'Invisible Man 1', N'L1', N'Bonnie', 31, 97000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B52', N'Invisible Man 2', N'L1', N'Bonnie', 17, 78000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B53', N'Invisible Man 3', N'L1', N'Bonnie', 11, 93000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B54', N'A Passage to India', N'L1', N'Bonnie', 40, 89000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B55', N'A Passage to America', N'L1', N'Bonnie', 25, 72000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B56', N'A Passage to Laos', N'L1', N'Jameson', 18, 99000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B6', N'One Hundred Years of Solitude', N'S1', N'Jameson', 20, 111000.0000, N'A', CAST(N'2021-06-27 18:19:39.173' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B61', N'One Thoudsan Years of Solitude', N'S1', N'Jameson', 28, 121000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B62', N'The Great Gatsby. F.', N'S1', N'Jameson', 11, 91000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B63', N'To Kill a Mockingbird 1', N'S1', N'Jameson', 15, 81000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B64', N'To Kill a Mockingbird 2', N'S1', N'Jameson', 54, 55000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B65', N'I love Science 6', N'S1', N'Jameson', 66, 55000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B66', N'I love Science 7', N'S1', N'Brandon ', 51, 51000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B67', N'I love Science 8', N'S1', N'Brandon', 13, 52000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B68', N'I love Science 9', N'S1', N'Brandon', 23, 25000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B69', N'I love Science 10', N'S1', N'Brandon', 76, 19000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B7', N'IT Book', N'S2', N'Brandon', 11, 32000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B71', N'Stephen King', N'S2', N'Queen Elizabeth', 17, 35000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B72', N'Clean Code', N'S2', N'Queen Elizabeth', 51, 39000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B73', N'Eloquent JavaScript', N'S2', N'Queen Elizabeth', 43, 49000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B74', N'Sharing books talking science 5', N'S2', N'Queen Elizabeth', 23, 67000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B75', N'Android', N'S2', N'Queen Elizabeth', 27, 52000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B76', N'Akata Warrior', N'S2', N'Queen Elizabeth', 31, 32000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B77', N'Professional developers of iowa', N'S2', N'Queen Elizabeth', 15, 79000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B78', N'Computer awareness', N'S2', N'Queen Elizabeth', 37, 89000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B79', N'Linked', N'S2', N'Queen Elizabeth', 25, 110000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'US', N'User')
INSERT [dbo].[tblStatus] ([StastusID], [StatusName]) VALUES (N'A', N'Active')
INSERT [dbo].[tblStatus] ([StastusID], [StatusName]) VALUES (N'I', N'Inactive')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE1', N'1', N'Peter', N'Male', N'AD', N'vanphuong0606@gmail.com', N'0971775111', N'HDBank', N'32/12a Bui Quang La', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE10', N'1', N'Smith', N'Male', N'US', N'Smith@gmail.com', N'0917161516', N'ACB', N'Nguyen Van Luong F12', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE11', N'1', N'Jackson', N'Male', N'US', N'gelbero@gmail.com', N'0943433111', N'TPBank', N'Vinhome Quan 9', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE12', N'1', N'Harry', N'Male', N'US', N'harry@gmail.com', N'0987161516', N'Hdbank', N'Long An Los Angeles', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE13', N'1', N'Jacob', N'Female', N'US', N'jacob@gmail.com', N'0971323111', N'ACB', N'Nguyen Cong Tru 91', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE14', N'1', N'Charlie', N'Male', N'US', N'charlie@gmail.com', N'0931235111', N'Vietcombank', N'Hai Ba Trung', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE15', N'1', N'Oliver', N'Male', N'AD', N'namaaa1@gmail.com', N'0971745711', N'Vietcombank', N'Vinhome Quan 6', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE16', N'1', N'Anna lee', N'Male', N'US', N'Amelia@gmail.com', N'0971775167', N'BAC A Bank', N'Quang Trung', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE17', N'1', N'James', N'Male', N'US', N'James@gmail.com', N'09717751691', N'Vietcombank', N'Phan Huy Ich', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE18', N'1', N'Thomas', N'Male', N'US', N'thomas31@gmail.com', N'0917857383', N'ACB', N'Pham Van Chieu', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE19', N'1', N'George', N'Male', N'US', N'george@gmail.com', N'0965646471', N'ACB', N'Dinh Bo Linh', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE2', N'1', N'Myaaa', N'Female', N'US', N'Myaaa@gmail.com', N'09371233111', N'TPBank', N'Ca Mau', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE20', N'1', N'Oscar', N'Male', N'US', N'Oscar2@gmail.com', N'0916151415', N'ACB', N'Go Vap Tphcm', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE21', N'1', N'William', N'Male', N'US', N'William@gmail.com', N'0976156151', N'ACB', N'Da Nang', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE3', N'1', N'Taylor', N'Male', N'US', N'Taylor@gmail.com', N'0945637171', N'VPBank', N'Hoi An Quang Nam', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE38', N'1', N'Justin', N'Male', N'US', N'justinboy@zing.vn', N'09615141617', N'Hdbank', N'New York City', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE4', N'1', N'Trieu my', N'Female', N'AD', N'trieumy2404@gmail.com', N'0123456789', N'ACB', N'Quan 12 Tphcm', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE41', N'1', N'No name', N'Male', N'US', N'doka@gmail.com', N'0917161611', N'HDBank', N'Pham Ngu Lao', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE47', N'1', N'Cau vang', N'Male', N'US', N'cauvang@gmail.com', N'0971775169', N'ACB', N'Lao Hac''s House', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE5', N'1', N'Tremblay', N'Male', N'US', N'Tremblay@gmail.com', N'03232251111', N'BIDV', N'Ha Noi, Viet Nam', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE6', N'1', N'Martin', N'Male', N'US', N'Martin@gmail.com', N'0323225115', N'HDBank', N'United States', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE61', N'1', N'Khong co name', N'Male', N'US', N'laohac@gmail.com', N'09178573831', N'HDBank', N'No House Nha', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE63', N'1', N'Dasdasddaaaaaaaaaaaaaa', N'Male', N'US', N'trieumy24204@gmail.com', N'09716151511', N'HDBank', N'Hidhsaidhaishd', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE65', N'1', N'Khoa buggg', N'Male', N'US', N'khoabug@gmail.com', N'0971616177', N'HDBank', N'Tay Ninh Viet Nam', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE7', N'1', N'Gagnon', N'Male', N'US', N'Gagnon@gmail.com', N'0971775161', N'HDBank', N'Paris France', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE84', N'1', N'Dauisdhaushduah', N'Male', N'US', N'diajisdj@gmail.com', N'09716100511', N'HDBank', N'Bui Quang La F12 Quan Go Vap', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE89', N'1', N'Dashdu', N'Male', N'US', N'kmda@gmail.com', N'0971551617', N'Sacombank', N'Nguyen Cong Tru', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE90', N'1', N'Gelbero', N'Male', N'AD', N'Mickey@gmail.com', N'0932323111', N'Sacombank', N'Tokyo Japan', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE91', N'1', N'Roy', N'Male', N'AD', N'Roy@gmail.com', N'0323225111', N'ACB', N'China', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE92', N'1', N'Ahihihihi', N'Male', N'US', N'phuxiteo3333@zing.vn', N'09161661161', N'HDBank', N'Quã¡âºâ­n 12 Tphcm', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE93', N'1', N'Ahahahaha', N'Female', N'US', N'dasdhasudhas@gmail.com', N'0213172311', N'Vietcombank', N'Quang Trung Tphcm', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'SE96', N'1', N'No name', N'Male', N'US', N'noname@gmail.com', N'09716151671', N'HDBank', N'Nga Nam Chuong Cho', N'A')
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblCategory_tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StastusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK_tblCategory_tblStatus]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails _tblOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails _tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails _tblProducts] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails _tblProducts]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails _tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StastusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails _tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StastusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StastusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StastusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
