USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 04-Oct-21 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[tblCategory]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblOrders]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblProducts]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblRoles]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblStatus]    Script Date: 04-Oct-21 8:43:31 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 04-Oct-21 8:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [varchar](10) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[RoleID] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Bank] [varchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[StatusID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'233184c8-46c6-4b3e-9418-0512abcc2edf', N'e8c8643e-0a59-401f-b8bd-582448738aa4', N'B54', 1, 89000.0000, CAST(N'2021-09-16 10:52:06.423' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'56b7ea64-f31d-499e-b79f-08593c8e7bcd', N'e8c8643e-0a59-401f-b8bd-582448738aa4', N'B76', 2, 64000.0000, CAST(N'2021-09-16 10:52:06.423' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'ff6ab93b-ef1c-4de5-95e0-09eb6fec78c1', N'58a5c069-54d0-4360-bff2-854e9f15e0f5', N'B64', 1, 55000.0000, CAST(N'2021-09-17 19:50:59.610' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'a43aaf61-4b97-4823-86e1-0b8f248820a2', N'8146067f-1f38-42c7-8c3b-f0650a3be8b6', N'B55', 1, 72000.0000, CAST(N'2021-09-09 15:14:31.353' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2ac050b0-0dc6-44da-906b-0b9c7ecdeb32', N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'B6', 1, 111000.0000, CAST(N'2021-07-12 09:03:51.477' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'ccf4de74-2e00-440e-a332-0c24b3a729fd', N'8c7334bf-f5b8-4c35-a833-b337537754d8', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:45:33.017' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'84033b65-0c10-4120-8fd7-0e668b6fdc27', N'd07c2cff-a889-4499-bc75-bc3e26b786ca', N'B55', 2, 144000.0000, CAST(N'2021-07-14 09:40:22.197' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'025f6f96-4b35-4e86-89e4-13779b201dba', N'fc2409e3-db13-403f-a31d-87d60379da79', N'B62', 4, 364000.0000, CAST(N'2021-09-23 10:31:18.967' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e9432ced-cf09-496c-97f1-18bc6b3c50d5', N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'B1', 15, 1950000.0000, CAST(N'2021-07-20 14:44:06.340' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e08fe5fc-cc27-4e8d-855a-1c6362c7ab33', N'42cb4152-a50c-4895-81d2-17c889d5abd6', N'B55', 1, 72000.0000, CAST(N'2021-07-11 10:44:06.733' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'c4c81626-cc10-43ca-9efb-23b507172b83', N'2c19f2b5-5dbd-4880-9de4-65d5daa72d39', N'B76', 1, 32000.0000, CAST(N'2021-09-18 08:56:35.830' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5de2b7e6-973d-48a9-9fd5-27a826a27730', N'316403a4-78dd-46a0-a6c2-f124f41cedb7', N'B71', 1, 35000.0000, CAST(N'2021-09-23 11:38:28.077' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'03f2ad10-a00e-4975-aaf5-2db9071b0867', N'a26e847d-84a0-475e-ad02-0c17d9227319', N'B71', 2, 70000.0000, CAST(N'2021-09-08 08:41:12.440' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'a4cffbfa-5302-490a-aed9-2dc3b9db2e4b', N'8efd0f0a-db49-41e6-9b2c-5cb60db89f5c', N'B74', 1, 67000.0000, CAST(N'2021-08-31 10:15:12.073' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'fc8d1fe1-008d-4c2a-b00f-2e26de4678c4', N'fcdfa304-5ade-4bcd-a038-61fe80b80833', N'B11', 4, 408000.0000, CAST(N'2021-09-08 19:51:43.673' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'1a5c4744-bfaa-4f86-9090-300e1407d8de', N'46af5998-9575-4631-a723-3455c6c3772e', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:42:07.990' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e8e5c00d-ca8a-4e01-9d9e-311330f74854', N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'B63', 1, 81000.0000, CAST(N'2021-07-19 19:36:18.943' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'acf7807c-2edb-494a-b1b5-348f63d0e56e', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B46', 2, 210000.0000, CAST(N'2021-07-14 09:33:13.803' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5a2195f0-9358-4081-8eae-36531e9f6886', N'9ca78bb0-72d8-4002-97d1-06081daa5b75', N'B56', 13, 1287000.0000, CAST(N'2021-07-14 10:07:21.960' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2f36167d-00b2-4774-8a1e-383d774064c6', N'150f6cf4-83b0-41af-8c14-0a304d1b74b0', N'B54', 1, 89000.0000, CAST(N'2021-09-16 22:31:50.430' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'135b7dde-2366-4a14-b759-39c94c7045fc', N'316403a4-78dd-46a0-a6c2-f124f41cedb7', N'B56', 1, 99000.0000, CAST(N'2021-09-23 11:38:28.073' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'39c2a139-55c6-49b1-ae7f-3b9effbca27e', N'7f8dd6b1-3f07-4211-8948-0228527ed2a5', N'B26', 1, 50000.0000, CAST(N'2021-09-08 10:17:29.807' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3eafbcf3-fc98-4b96-918a-3d793f546685', N'bd6e35e4-9597-46ba-a10f-42c9c5d18b8b', N'B56', 2, 198000.0000, CAST(N'2021-09-09 15:14:17.347' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'46179bb5-afee-4e73-b5dc-3f4516c826f9', N'58a5c069-54d0-4360-bff2-854e9f15e0f5', N'B76', 1, 32000.0000, CAST(N'2021-09-17 19:50:59.613' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'00c96a2a-d97b-4cde-be00-41b52699bc4f', N'bd6e35e4-9597-46ba-a10f-42c9c5d18b8b', N'B55', 4, 288000.0000, CAST(N'2021-09-09 15:14:17.343' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6c935653-c8c4-454e-90a9-437f5fb1a083', N'87656095-00e0-42d6-bc19-fb3a7ba0846b', N'B55', 2, 144000.0000, CAST(N'2021-07-11 10:39:49.027' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'b27a6b04-ac32-4743-95ee-44aebc10a9e5', N'd3e63a44-77d1-4900-a75b-9298680efc1b', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:51:18.440' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'def154b5-e75c-4b9c-b615-462e0a7103f6', N'a1243711-95a9-47d3-8c69-995eb1c84633', N'B76', 1, 32000.0000, CAST(N'2021-09-09 15:29:33.503' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'1153f6f3-2608-4dac-9b13-4630ddcac053', N'd62f8f28-230f-4c8e-8de3-84e55884e07c', N'B54', 1, 89000.0000, CAST(N'2021-07-12 09:36:17.433' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f176f958-63aa-4ce1-9002-4655d6a14626', N'fc2ec0c2-9e92-4d5c-b372-a4c34b4c8cc4', N'B30', 1, 70000.0000, CAST(N'2021-07-13 08:56:57.010' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5816be27-09b9-42cc-8938-473c58193f93', N'8a81d5fc-e19b-4bcd-aefa-3bca81967a48', N'B74', 1, 67000.0000, CAST(N'2021-09-07 21:37:30.793' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'898ae404-b159-45e0-8f6f-4e856378ca53', N'02b5d4c3-025f-4fbe-b9ee-7b38087eb585', N'B76', 15, 480000.0000, CAST(N'2021-07-14 10:28:32.287' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'7b3b8070-4a33-4a08-8d87-5142a53a6601', N'946a12f1-9e90-414e-ac23-79db39a66a69', N'B56', 2, 198000.0000, CAST(N'2021-08-31 10:19:27.850' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'303438da-8ef7-4d51-ad59-5160bfe4c7da', N'eb87f237-ecae-4c2e-9fc4-ce9de3a1727a', N'B29', 3, 270000.0000, CAST(N'2021-09-09 08:12:42.000' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'231d0a47-7fa6-4cda-b156-523c8dc9131f', N'a4665d24-e4a7-4639-a63b-b9bfed4a5eec', N'B75', 2, 104000.0000, CAST(N'2021-09-16 22:37:07.370' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'aa3bdae0-aee4-4683-9301-5639aca4dfa3', N'd8124748-5d95-4ec4-98c7-7fdcaeee58f9', N'B55', 3, 216000.0000, CAST(N'2021-07-14 10:05:39.810' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'11e08c0f-dbb2-4467-8e81-571e9b1bb3f2', N'1220464f-229b-4e25-8cf6-53921b5b7c92', N'B55', 2, 144000.0000, CAST(N'2021-07-14 19:13:13.380' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'863e31a5-93ec-468f-bd88-5a845a1fdb0b', N'10244a9a-d3c0-4229-bec0-3b475c44a964', N'B43', 2, 240000.0000, CAST(N'2021-09-18 08:50:50.673' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6d3adb4c-c693-4435-919f-5ec0c7fc98f2', N'afb9e050-540e-47f6-8a82-ea054270b7d9', N'B54', 1, 89000.0000, CAST(N'2021-09-16 10:46:46.733' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5a68be51-e040-422c-9938-60ffa4826cd6', N'8f3c23c9-da51-4e76-87c1-1becbc4272b1', N'B55', 1, 72000.0000, CAST(N'2021-07-12 09:36:30.663' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'9401b62a-834c-475e-87dc-61d4393d8740', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B26', 1, 50000.0000, CAST(N'2021-07-14 09:33:13.807' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'0e31c8d0-5140-41be-8d6a-66d3cdc2ced5', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B75', 1, 52000.0000, CAST(N'2021-07-14 09:58:51.453' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'144e002e-0dc9-428b-bbe0-69fef841c2b2', N'01e63b31-4594-4543-8266-2894f449d412', N'B56', 3, 297000.0000, CAST(N'2021-09-16 22:35:48.233' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2bc7bae3-a609-4650-89c7-6b2fba9eeac6', N'1f9bd61d-17f2-45d8-b6d6-a77f956d6f10', N'B56', 1, 99000.0000, CAST(N'2021-09-17 21:19:01.383' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'd08051ee-e48b-4fed-92fb-6b72eb416dfe', N'a50b2fc1-6d65-44cf-ae3f-48562f4b4c7b', N'B75', 1, 52000.0000, CAST(N'2021-09-18 09:10:13.960' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6aefde3f-9dab-48d0-ab07-6b7affd6a586', N'e146a882-2849-415c-887d-7914fc45f0d9', N'B61', 1, 121000.0000, CAST(N'2021-07-14 19:02:24.343' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5af1e3be-696e-4d3b-acf0-6cc1cbd1ba5c', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B54', 2, 178000.0000, CAST(N'2021-07-14 09:58:51.453' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6c2d45e4-f7c5-4746-8ea9-6ea91e4916a0', N'7ede1e82-2616-4709-a7bd-2f11e46545e9', N'B54', 1, 89000.0000, CAST(N'2021-09-16 10:49:47.150' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'a89984ff-b136-4623-81d8-6ed43e9f343e', N'a1243711-95a9-47d3-8c69-995eb1c84633', N'B55', 1, 72000.0000, CAST(N'2021-09-09 15:29:33.503' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'90de6180-b285-422a-9058-7287c47e741d', N'49233a45-c1af-4068-a381-14ef86c219df', N'B43', 1, 120000.0000, CAST(N'2021-07-13 08:56:24.197' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'76d4627c-853b-4926-a286-7531a8728097', N'a1243711-95a9-47d3-8c69-995eb1c84633', N'B56', 1, 99000.0000, CAST(N'2021-09-09 15:29:33.507' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'99f80a4f-2eac-4ed8-adde-76eeed046a46', N'e4de93f0-61e4-4e3f-a4dc-d153a682dc25', N'B54', 2, 178000.0000, CAST(N'2021-09-17 21:21:08.533' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'5f39a18f-0b6f-41c1-b9bf-7934410e7354', N'abb4d748-2027-4387-8336-931d927a32af', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:37:58.197' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'd832da7d-9fae-45e4-81e8-7e08a5397a9a', N'd9c047a9-0f1b-44eb-9d36-922b082d63e3', N'B56', 3, 297000.0000, CAST(N'2021-09-08 08:45:51.093' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'c2fbcdde-f8d0-41a2-8f30-8601240955a4', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B71', 2, 70000.0000, CAST(N'2021-07-14 09:49:18.860' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'225ee942-27d9-4672-8b8d-8b32ade189aa', N'7aafb04b-7620-4584-b484-060996382b23', N'B76', 9, 288000.0000, CAST(N'2021-07-14 10:26:24.490' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3bf753fc-d0bf-4e12-869c-8b55f53c8b7e', N'e6fae982-461e-4fa8-a3b9-16778c6ba020', N'B77', 2, 158000.0000, CAST(N'2021-07-11 10:59:04.030' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'bed73bd1-f691-4ae1-8eb3-8d899717d1e0', N'4904cef3-6b3f-4eef-a4a9-4584d8fb5ad3', N'B55', 1, 72000.0000, CAST(N'2021-09-08 19:53:34.273' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'cd974db2-244b-4c80-9532-8e10eccee75f', N'ecd18523-438a-4342-88c9-8b1b5f9bc515', N'B75', 1, 52000.0000, CAST(N'2021-09-09 08:22:48.830' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'de119be9-0ad0-4b75-9511-904f9a481972', N'10244a9a-d3c0-4229-bec0-3b475c44a964', N'B55', 1, 72000.0000, CAST(N'2021-09-18 08:50:50.677' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'156a5793-a0a9-43a0-9cbe-90e9a93ec4f1', N'fc2409e3-db13-403f-a31d-87d60379da79', N'B63', 2, 162000.0000, CAST(N'2021-09-23 10:31:18.967' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8dc462df-c70d-49eb-8f2e-9291bc124640', N'9bc6bdfb-5d19-4ca3-8c7c-1bd9d1e56499', N'B72', 1, 39000.0000, CAST(N'2021-07-12 09:03:03.020' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8a8bb116-4b67-42f7-97e2-958380b0d9dc', N'776ed31b-ccff-4fdd-9a87-4d6814e79b8a', N'B77', 3, 237000.0000, CAST(N'2021-07-11 19:16:51.987' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'45083eee-a9d7-44a4-9a41-97c9b22e896e', N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'B56', 1, 99000.0000, CAST(N'2021-07-14 19:02:02.050' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'c126b21f-4978-490c-aad0-a70a4f56b16f', N'ab22afce-24cd-4c05-8742-2ad60b77637a', N'B54', 1, 89000.0000, CAST(N'2021-09-17 21:17:34.780' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'488994b3-31b4-4f57-9aca-a70c96148f60', N'd9c047a9-0f1b-44eb-9d36-922b082d63e3', N'B75', 1, 52000.0000, CAST(N'2021-09-08 08:45:51.090' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'74252691-7f87-43c2-8ba5-a856e4a8178c', N'a1243711-95a9-47d3-8c69-995eb1c84633', N'B54', 1, 89000.0000, CAST(N'2021-09-09 15:29:33.503' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8a5f4da7-3c48-469d-8217-ae4bd5befa17', N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'B61', 1, 121000.0000, CAST(N'2021-07-12 09:03:51.477' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'714b8253-e877-47d5-9ded-af388843fa9e', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B54', 2, 178000.0000, CAST(N'2021-07-14 09:49:18.853' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8f6795a1-33a8-4bcc-ac52-af3e7845d3ba', N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'B55', 1, 72000.0000, CAST(N'2021-07-14 09:49:18.857' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'dfdb663c-42e3-4654-990e-b049c9455450', N'4fcf2631-c98c-4418-bb6f-58cf758a5d72', N'B43', 2, 240000.0000, CAST(N'2021-09-09 14:18:09.117' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'83f287ec-c1d4-4dba-a565-bac076b78d39', N'9d08c494-47ca-4730-bcb3-eefc4c0d7fe4', N'B44', 2, 240000.0000, CAST(N'2021-07-14 09:49:46.577' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e35820e7-4454-4d2b-b4af-be93463eca55', N'58a5c069-54d0-4360-bff2-854e9f15e0f5', N'B77', 1, 79000.0000, CAST(N'2021-09-17 19:50:59.617' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'0e488425-394e-4f8e-9a4d-bf38d9b7ecd3', N'a2612a04-9b4b-4d66-8d2c-9e1eba85da05', N'B55', 2, 144000.0000, CAST(N'2021-09-16 11:00:41.640' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'35410e66-6de6-4627-b387-c1a646945a36', N'794cbb6f-bc4a-4ebd-b989-e7c9dcdd9087', N'B23', 4, 400000.0000, CAST(N'2021-09-09 08:17:20.900' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'882e70dd-ccac-4e1e-95f5-c1edd152e86b', N'e8c8643e-0a59-401f-b8bd-582448738aa4', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:52:06.427' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2c50e52f-a7aa-43f2-9fd9-c25ca94eb19e', N'd0b813c0-327e-4452-a3c8-0c506014425f', N'B55', 2, 144000.0000, CAST(N'2021-07-17 08:32:54.667' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6cc219ef-30ad-4142-9fb8-c3ba73d9a29d', N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'B2', 1, 90000.0000, CAST(N'2021-07-20 14:44:06.340' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'e1ad4394-f0c5-418b-b3f1-c5bdac49cd0c', N'6e56b507-79be-47ca-9ed4-32ff3932796a', N'B55', 2, 144000.0000, CAST(N'2021-09-16 10:45:22.293' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f8a89b75-2f22-4bba-bf2d-c64dadd0a0f8', N'a50b2fc1-6d65-44cf-ae3f-48562f4b4c7b', N'B55', 1, 72000.0000, CAST(N'2021-09-18 09:10:13.963' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'efa2c81f-55a7-4e2d-9913-c6f08b5dd5cb', N'd9c047a9-0f1b-44eb-9d36-922b082d63e3', N'B43', 2, 240000.0000, CAST(N'2021-09-08 08:45:51.090' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2fab7eb3-b3ec-41d4-9e6e-c77098d44d29', N'ebe627c0-74e7-493a-962b-9e921bc3ad38', N'B29', 1, 90000.0000, CAST(N'2021-08-31 10:17:32.747' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f4569bb2-cff5-46e1-baaa-c7d2c3268709', N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'B76', 1, 32000.0000, CAST(N'2021-07-14 09:58:51.457' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'7dc33367-6a4c-4fd9-995e-c8c8f6360a8b', N'e460574c-cfa9-4dc3-83da-6e15fa6c60b3', N'B55', 1, 72000.0000, CAST(N'2021-09-18 09:10:40.967' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'93735971-96db-4335-a2d9-ce92ac8045f1', N'eb87f237-ecae-4c2e-9fc4-ce9de3a1727a', N'B63', 1, 81000.0000, CAST(N'2021-09-09 08:12:42.000' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'63db3540-3189-4600-a047-d3b361192c7c', N'81269724-164a-4f73-86e6-49a517f799e5', N'B55', 1, 72000.0000, CAST(N'2021-07-15 13:47:37.143' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f9f5f63b-11a2-4529-90e9-ddcfef363428', N'45eef1cb-8f9a-40c5-be5d-534548bea8bf', N'B54', 1, 89000.0000, CAST(N'2021-09-09 08:17:34.523' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'634e354a-c892-4bc4-838c-dec3647887b0', N'4904cef3-6b3f-4eef-a4a9-4584d8fb5ad3', N'B75', 3, 156000.0000, CAST(N'2021-09-08 19:53:34.270' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3f455672-b50f-4d2b-8ff7-dfb5c5fb2711', N'a77af2ff-a345-4c34-96d0-96e9e1ad7f8c', N'B54', 2, 178000.0000, CAST(N'2021-09-17 21:20:21.913' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2f095c7f-76cd-4b07-b5ee-e2a33930d823', N'13ec70ac-5eca-4f5f-9a06-bf1fdf6ada91', N'B46', 9, 945000.0000, CAST(N'2021-07-14 10:13:35.263' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'63b31090-ef86-4e48-81db-e35894415b8a', N'87568fe3-cb7c-4c22-b419-72b46d450f36', N'B55', 4, 288000.0000, CAST(N'2021-09-16 22:32:21.330' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6081e2ea-ccbb-4ca2-8ec1-e53cf61c3247', N'09e76a98-aded-4702-b6d3-c6186ffa0d9e', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:46:33.633' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'67c7c01e-2918-454a-9b6f-e7fde90ce804', N'eb87f237-ecae-4c2e-9fc4-ce9de3a1727a', N'B54', 1, 89000.0000, CAST(N'2021-09-09 08:12:42.000' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'4f8faef6-463b-4403-bb2e-ea24c8a094ba', N'4792cecd-8a90-45ee-91a2-7e6e0a0bfc8a', N'B54', 4, 356000.0000, CAST(N'2021-08-31 08:51:21.707' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'686823a1-3c9d-440b-a66a-eba06a4b6038', N'a19e1c3d-6c5e-42f8-81ac-148e221983b4', N'B55', 1, 72000.0000, CAST(N'2021-07-13 15:26:23.900' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'162ca894-bbf3-4dbf-9136-f2eb3fcd5f3d', N'27b0ed89-c4ee-4df4-83e1-422ad066d955', N'B55', 2, 144000.0000, CAST(N'2021-07-11 18:44:01.160' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'2efd59e6-2a4b-4ce0-a335-f47ef7f39ccd', N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'B29', 1, 90000.0000, CAST(N'2021-07-14 09:33:13.807' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'd4c6b559-c909-495f-92bf-f598ec200e96', N'5463cd87-67a8-41d4-b671-ef8d73e9dff0', N'B55', 1, 72000.0000, CAST(N'2021-09-16 10:40:11.260' AS DateTime), N'A')
GO
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6ad5641c-6238-418e-b069-f6395f4512dd', N'eb87f237-ecae-4c2e-9fc4-ce9de3a1727a', N'B61', 1, 121000.0000, CAST(N'2021-09-09 08:12:42.000' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'47e6bc42-d516-4c0d-b7c0-f6d3de8856b1', N'24993221-5231-4547-9f01-1d8fc9e173dd', N'B14', 1, 132000.0000, CAST(N'2021-09-09 08:22:30.767' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'4facd468-5301-4274-b61b-f8300b8fc9ca', N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'B74', 1, 67000.0000, CAST(N'2021-07-19 19:36:18.940' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'0782cb7f-4a59-451b-8f27-f8ced98df922', N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'B55', 2, 144000.0000, CAST(N'2021-07-14 19:02:02.047' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'85fdf7b5-40dd-44c0-821f-f91119070d9a', N'4fcf2631-c98c-4418-bb6f-58cf758a5d72', N'B61', 2, 242000.0000, CAST(N'2021-09-09 14:18:09.120' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'08f1e51c-25ca-4f91-bce2-fad5939e4b65', N'5e028718-8ab3-46ba-9085-0dc2f45b6a20', N'B54', 1, 89000.0000, CAST(N'2021-09-08 19:51:08.793' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'6060d88c-610e-43f1-b1ea-fb97053489e8', N'd9c047a9-0f1b-44eb-9d36-922b082d63e3', N'B44', 1, 120000.0000, CAST(N'2021-09-08 08:45:51.090' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'f2b6e114-179d-4d0a-81d5-fc2f3daa3914', N'8a81d5fc-e19b-4bcd-aefa-3bca81967a48', N'B75', 1, 52000.0000, CAST(N'2021-09-07 21:37:30.790' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'3290b3e4-c1b4-4079-a3d2-fd1220795e57', N'd1486a8b-2004-43a2-b99e-12dc0b0eee02', N'B26', 17, 850000.0000, CAST(N'2021-07-14 10:22:34.753' AS DateTime), N'A')
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Total], [Date], [StatusID]) VALUES (N'8bcfba3e-3494-4303-ac9f-fd48f0e4f564', N'40289e24-cc6d-4ff3-95cf-07edad3a5681', N'B72', 1, 39000.0000, CAST(N'2021-07-13 19:25:50.120' AS DateTime), N'A')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7f8dd6b1-3f07-4211-8948-0228527ed2a5', N'se2', CAST(N'2021-09-08 09:38:52.057' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'3cae7dcd-94ed-4be3-8b22-027fb0f60412', N'se2', CAST(N'2021-07-14 10:13:40.163' AS DateTime), 315000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9ca78bb0-72d8-4002-97d1-06081daa5b75', N'se2', CAST(N'2021-07-14 10:07:16.667' AS DateTime), 1287000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7aafb04b-7620-4584-b484-060996382b23', N'se2', CAST(N'2021-07-14 10:24:45.040' AS DateTime), 288000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'b5975414-dda9-47f3-bd0b-06fbf2546b7d', N'se2', CAST(N'2021-07-14 09:21:45.153' AS DateTime), 563000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'40289e24-cc6d-4ff3-95cf-07edad3a5681', N'se2', CAST(N'2021-07-13 16:24:01.413' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'150f6cf4-83b0-41af-8c14-0a304d1b74b0', N'se2', CAST(N'2021-09-16 20:54:19.173' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a26e847d-84a0-475e-ad02-0c17d9227319', N'se2', CAST(N'2021-09-08 08:39:21.777' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd0b813c0-327e-4452-a3c8-0c506014425f', N'se2', CAST(N'2021-07-15 13:51:18.500' AS DateTime), 9216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'5e028718-8ab3-46ba-9085-0dc2f45b6a20', N'se2', CAST(N'2021-09-08 19:50:49.630' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'00c0bb24-0de8-441e-a109-0e96e5ad8784', N'se2', CAST(N'2021-07-11 19:05:07.270' AS DateTime), 144000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'066337b2-d455-4a11-b848-101b2ce51e78', N'se2', CAST(N'2021-07-15 12:56:31.237' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'faa3fd6f-beac-4563-b17d-109ea1976e3a', N'se2', CAST(N'2021-07-11 17:49:29.057' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd1486a8b-2004-43a2-b99e-12dc0b0eee02', N'se21', CAST(N'2021-07-14 10:22:11.810' AS DateTime), 850000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a19e1c3d-6c5e-42f8-81ac-148e221983b4', N'se2', CAST(N'2021-07-13 15:26:19.300' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'49233a45-c1af-4068-a381-14ef86c219df', N'se38', CAST(N'2021-07-13 08:53:58.840' AS DateTime), 120000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9f9e5c45-78b6-49db-9695-161f23b3eced', N'se2', CAST(N'2021-07-14 09:32:08.510' AS DateTime), 350000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e6fae982-461e-4fa8-a3b9-16778c6ba020', N'se6', CAST(N'2021-07-11 10:58:59.817' AS DateTime), 158000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'42cb4152-a50c-4895-81d2-17c889d5abd6', N'se2', CAST(N'2021-07-11 10:43:59.523' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4356b9fc-09b0-4888-9153-1802110fda79', N'se2', CAST(N'2021-10-04 20:28:10.173' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9bc6bdfb-5d19-4ca3-8c7c-1bd9d1e56499', N'se2', CAST(N'2021-07-12 09:01:10.390' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8f3c23c9-da51-4e76-87c1-1becbc4272b1', N'se2', CAST(N'2021-07-12 09:36:23.440' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'75557b8f-d7e4-4b7e-a4dc-1d0c3143bc5b', N'se2', CAST(N'2021-07-12 09:02:42.347' AS DateTime), 288000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'24993221-5231-4547-9f01-1d8fc9e173dd', N'se2', CAST(N'2021-09-09 08:22:27.030' AS DateTime), 132000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6feda5a0-ea31-4a60-a391-1dd52f1914cb', N'se2', CAST(N'2021-09-16 21:41:18.483' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fe90ac16-f28c-4718-adb7-1fcaae925579', N'se2', CAST(N'2021-09-18 08:16:25.813' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'01e63b31-4594-4543-8266-2894f449d412', N'se2', CAST(N'2021-09-16 22:35:42.500' AS DateTime), 297000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ab22afce-24cd-4c05-8742-2ad60b77637a', N'se2', CAST(N'2021-09-17 21:17:30.440' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6b60e94c-0899-41cf-938b-2d298042391c', N'se2', CAST(N'2021-09-16 21:27:23.137' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7ede1e82-2616-4709-a7bd-2f11e46545e9', N'se2', CAST(N'2021-09-16 10:49:43.903' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6e56b507-79be-47ca-9ed4-32ff3932796a', N'se2', CAST(N'2021-09-16 10:44:02.803' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd5dfd93b-3165-45a8-a05c-33b655bfcfab', N'se2', CAST(N'2021-09-16 21:59:52.893' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'46af5998-9575-4631-a723-3455c6c3772e', N'se2', CAST(N'2021-09-16 10:42:00.137' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c5add133-0cee-4cd8-b2d6-35b6467022f7', N'se2', CAST(N'2021-09-16 21:37:20.067' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'10244a9a-d3c0-4229-bec0-3b475c44a964', N'se2', CAST(N'2021-09-18 08:50:35.323' AS DateTime), 312000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8a81d5fc-e19b-4bcd-aefa-3bca81967a48', N'se95', CAST(N'2021-09-07 21:37:19.613' AS DateTime), 119000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'82d0017b-5625-441d-864b-3ca0dffd3df5', N'se2', CAST(N'2021-09-16 20:58:07.083' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'0dcb0cf7-62ad-4bf6-a37d-3cd4f3f277dc', N'se2', CAST(N'2021-07-14 09:58:09.900' AS DateTime), 262000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'b41dee49-4b0f-48b2-ae16-3ef4745d5b3b', N'se2', CAST(N'2021-09-16 21:57:58.290' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'02ac8626-3a31-45a6-bdcb-3f2b241443b3', N'se2', CAST(N'2021-07-11 10:40:57.717' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7c43973d-2994-46be-aa36-3f3a11a2e43b', N'se21', CAST(N'2021-07-14 10:23:59.670' AS DateTime), 89000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'cb19c2f3-a330-4985-ab31-403f06090bf3', N'se2', CAST(N'2021-07-13 19:25:45.650' AS DateTime), 39000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9e4d7f89-c746-42a0-8d62-40453eaf25c2', N'se2', CAST(N'2021-09-17 21:21:32.963' AS DateTime), 144000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'55a8456b-d19f-4967-b30f-41683342b3fb', N'se2', CAST(N'2021-09-08 19:51:03.893' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'27b0ed89-c4ee-4df4-83e1-422ad066d955', N'se2', CAST(N'2021-07-11 18:43:54.810' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'bd6e35e4-9597-46ba-a10f-42c9c5d18b8b', N'se2', CAST(N'2021-09-09 15:13:41.597' AS DateTime), 486000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'5a430990-39c5-4dfd-910f-434490c136d7', N'se2', CAST(N'2021-07-13 20:01:49.843' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c66d6e18-7624-4c71-8476-43eb094727f5', N'se2', CAST(N'2021-09-16 11:45:35.377' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4904cef3-6b3f-4eef-a4a9-4584d8fb5ad3', N'se66', CAST(N'2021-09-08 19:53:16.423' AS DateTime), 228000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a50b2fc1-6d65-44cf-ae3f-48562f4b4c7b', N'se2', CAST(N'2021-09-18 09:09:48.960' AS DateTime), 124000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'81269724-164a-4f73-86e6-49a517f799e5', N'se2', CAST(N'2021-07-15 13:47:33.177' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'776ed31b-ccff-4fdd-9a87-4d6814e79b8a', N'se41', CAST(N'2021-07-11 19:16:44.690' AS DateTime), 237000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'45eef1cb-8f9a-40c5-be5d-534548bea8bf', N'se2', CAST(N'2021-09-09 08:17:30.847' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'1220464f-229b-4e25-8cf6-53921b5b7c92', N'se2', CAST(N'2021-07-14 19:02:33.807' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'49abe14f-2572-45de-95a5-56d6ed4185aa', N'se2', CAST(N'2021-09-16 21:23:39.970' AS DateTime), 99000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e8c8643e-0a59-401f-b8bd-582448738aa4', N'se2', CAST(N'2021-09-16 10:51:35.770' AS DateTime), 225000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4fcf2631-c98c-4418-bb6f-58cf758a5d72', N'se5', CAST(N'2021-09-09 14:17:52.410' AS DateTime), 482000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8efd0f0a-db49-41e6-9b2c-5cb60db89f5c', N'se3', CAST(N'2021-08-31 10:15:08.143' AS DateTime), 67000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7e35aa6b-b11b-413e-bd61-5eae809770b3', N'se2', CAST(N'2021-07-14 09:48:41.393' AS DateTime), 320000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9fae6eda-66d6-4f65-a557-5f856e61a72d', N'se41', CAST(N'2021-07-11 19:15:59.877' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fcdfa304-5ade-4bcd-a038-61fe80b80833', N'se2', CAST(N'2021-09-08 19:51:32.307' AS DateTime), 408000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'1eed0dbc-5d57-42f2-b0da-655743351bdd', N'se20', CAST(N'2021-09-09 08:13:28.743' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'2c19f2b5-5dbd-4880-9de4-65d5daa72d39', N'se2', CAST(N'2021-09-18 08:56:19.510' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c85cff21-8041-4ae1-a8c8-66c28b69b0ff', N'se84', CAST(N'2021-07-20 14:42:41.853' AS DateTime), 2040000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'87ef57c9-9e69-4e76-a974-66f3f66038f2', N'se2', CAST(N'2021-09-08 10:17:10.817' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9c097793-d3eb-4ace-b323-6a7aa35b3e69', N'se2', CAST(N'2021-09-16 21:05:15.777' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e460574c-cfa9-4dc3-83da-6e15fa6c60b3', N'se2', CAST(N'2021-09-18 09:10:31.813' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'0ddf777a-65ea-4975-91a9-70ed391ef373', N'se2', CAST(N'2021-09-16 10:42:16.673' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8c2a0c06-e4a7-48ce-804f-7257e84c0c18', N'se21', CAST(N'2021-07-14 10:17:19.067' AS DateTime), 900000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'87568fe3-cb7c-4c22-b419-72b46d450f36', N'se2', CAST(N'2021-09-16 22:31:58.927' AS DateTime), 288000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8888297a-a264-4cc1-994a-72bd9ea3d958', N'se2', CAST(N'2021-07-11 10:38:06.060' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'934f0480-99c6-4dc7-af06-745613bc514c', N'se2', CAST(N'2021-09-16 20:59:02.027' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'2818bc71-0f4d-4d32-96be-76f60dcfe5be', N'se2', CAST(N'2021-09-07 21:46:12.113' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'3712711d-7f2f-4942-9c81-775d5d2f2cb9', N'se38', CAST(N'2021-07-13 08:57:08.333' AS DateTime), 120000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e146a882-2849-415c-887d-7914fc45f0d9', N'se2', CAST(N'2021-07-14 19:02:19.843' AS DateTime), 121000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'946a12f1-9e90-414e-ac23-79db39a66a69', N'se2', CAST(N'2021-08-31 10:19:24.507' AS DateTime), 198000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'02b5d4c3-025f-4fbe-b9ee-7b38087eb585', N'se2', CAST(N'2021-07-14 10:28:25.907' AS DateTime), 480000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e1288291-eb6e-4ae4-8ba1-7b3d4eddb24c', N'se2', CAST(N'2021-08-31 09:21:39.760' AS DateTime), 216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'774fe3cb-b84b-41d0-80ad-7bdcdad190e5', N'se95', CAST(N'2021-09-07 21:37:00.197' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4792cecd-8a90-45ee-91a2-7e6e0a0bfc8a', N'se17', CAST(N'2021-08-31 08:51:10.947' AS DateTime), 356000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd8124748-5d95-4ec4-98c7-7fdcaeee58f9', N'se2', CAST(N'2021-07-14 10:05:34.223' AS DateTime), 216000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd62f8f28-230f-4c8e-8de3-84e55884e07c', N'se2', CAST(N'2021-07-12 09:36:09.620' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'58a5c069-54d0-4360-bff2-854e9f15e0f5', N'se4', CAST(N'2021-09-17 19:47:09.040' AS DateTime), 166000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a74ebdf4-35b0-452e-959c-865ee0c30a35', N'se2', CAST(N'2021-07-13 19:25:02.160' AS DateTime), 110000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fc2409e3-db13-403f-a31d-87d60379da79', N'se2', CAST(N'2021-09-23 10:31:03.947' AS DateTime), 526000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd9f61cd8-6f58-4dfd-bebd-8b1b035b3bdf', N'se2', CAST(N'2021-07-17 08:32:45.637' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ecd18523-438a-4342-88c9-8b1b5f9bc515', N'se2', CAST(N'2021-09-09 08:22:45.143' AS DateTime), 52000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e1303e1d-5cbb-4538-a449-906acab95aa4', N'se2', CAST(N'2021-09-09 08:05:31.120' AS DateTime), 792000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'0d986362-e6d5-48ab-997c-908cf1c33a2d', N'se2', CAST(N'2021-07-17 08:33:15.947' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'dd8d67a1-1585-4ebf-ad6d-90d867826804', N'se2', CAST(N'2021-07-12 09:03:28.077' AS DateTime), 232000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd9c047a9-0f1b-44eb-9d36-922b082d63e3', N'se67', CAST(N'2021-09-08 08:45:36.633' AS DateTime), 709000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd3e63a44-77d1-4900-a75b-9298680efc1b', N'se2', CAST(N'2021-09-16 10:51:09.613' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'abb4d748-2027-4387-8336-931d927a32af', N'se2', CAST(N'2021-09-16 10:37:50.790' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6ae79a39-5479-41d5-9d2a-93c10d91bcfe', N'se2', CAST(N'2021-09-07 21:38:21.520' AS DateTime), 32000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4224eb3b-01cf-4c17-9bf6-940424ad0854', N'se2', CAST(N'2021-09-09 08:21:52.270' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd8910835-f80a-46e3-80ca-9634c0145062', N'se65', CAST(N'2021-07-13 15:28:55.470' AS DateTime), 50000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a77af2ff-a345-4c34-96d0-96e9e1ad7f8c', N'se2', CAST(N'2021-09-17 21:20:14.940' AS DateTime), 178000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ce156350-023b-4cf8-98ad-97a9fc790efa', N'se2', CAST(N'2021-09-16 20:57:14.497' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4642d030-7ff5-480f-a5b8-99004ad8ff41', N'se2', CAST(N'2021-07-11 10:44:31.280' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a1243711-95a9-47d3-8c69-995eb1c84633', N'se60', CAST(N'2021-09-09 15:29:19.357' AS DateTime), 292000.0000, N'I', N'Paid')
GO
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'c1fb28cc-2c07-4975-8911-99bc342b65ff', N'se2', CAST(N'2021-07-12 09:04:07.240' AS DateTime), 32000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6bf98eb9-bcb2-4b95-b3fe-9b500f213dc1', N'se2', CAST(N'2021-07-13 20:58:38.853' AS DateTime), 89000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a2612a04-9b4b-4d66-8d2c-9e1eba85da05', N'se2', CAST(N'2021-09-16 10:55:11.870' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ebe627c0-74e7-493a-962b-9e921bc3ad38', N'se3', CAST(N'2021-08-31 10:16:03.817' AS DateTime), 90000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'497eb1e6-8053-49df-a551-a009042371f7', N'se21', CAST(N'2021-07-11 10:38:18.560' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'05a6a3c9-cd2e-4d44-972e-a016083171a2', N'se2', CAST(N'2021-09-16 22:12:07.980' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fc2ec0c2-9e92-4d5c-b372-a4c34b4c8cc4', N'se38', CAST(N'2021-07-13 08:56:49.653' AS DateTime), 70000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'1f9bd61d-17f2-45d8-b6d6-a77f956d6f10', N'se2', CAST(N'2021-09-17 21:17:51.970' AS DateTime), 99000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8c314258-cddc-4193-963f-aae2f76ffec8', N'se2', CAST(N'2021-09-23 10:30:45.370' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'f901ffe0-9d3a-40ce-b05f-acb425bdae8a', N'se2', CAST(N'2021-09-17 21:12:49.347' AS DateTime), 663000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'cbb57847-c6b4-4518-b56b-ad6e33e06c20', N'se2', CAST(N'2021-09-16 10:44:48.477' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'955fdebd-9b1e-41f7-b412-add4fec0f68a', N'se2', CAST(N'2021-09-16 21:53:41.753' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fab76f00-ddcd-4576-b79d-ae3d1d312cf2', N'se2', CAST(N'2021-09-08 08:41:06.690' AS DateTime), 70000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6f72eecb-e9ec-46a4-9be3-aee9ec6c5c01', N'se2', CAST(N'2021-09-16 20:25:25.277' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'307bb79e-a911-43ba-ae66-aef72ee7217d', N'se2', CAST(N'2021-07-13 20:48:00.827' AS DateTime), 144000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'249006cf-01a8-42f9-8774-b060861db2df', N'se2', CAST(N'2021-09-16 20:38:52.207' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'2fc596e5-de22-4bb5-8c51-b09cf3e9aaf5', N'se2', CAST(N'2021-07-12 09:36:34.270' AS DateTime), 576000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'cedfd02d-56f7-4b9c-b2d6-b1493f8afaad', N'se2', CAST(N'2021-09-16 11:42:13.740' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8c7334bf-f5b8-4c35-a833-b337537754d8', N'se2', CAST(N'2021-09-16 10:45:28.123' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'4381fc36-c294-41c4-8648-b4f9f135f909', N'se2', CAST(N'2021-09-16 21:36:47.503' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fd1df5b5-9f48-4f26-8afb-b4ff25c13427', N'se2', CAST(N'2021-09-18 08:54:12.667' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a4665d24-e4a7-4639-a63b-b9bfed4a5eec', N'se2', CAST(N'2021-09-16 22:36:40.343' AS DateTime), 104000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'fd7a60b1-7e14-4097-aee7-bb333b093956', N'se20', CAST(N'2021-09-09 08:14:08.723' AS DateTime), 52000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'd07c2cff-a889-4499-bc75-bc3e26b786ca', N'se2', CAST(N'2021-07-14 09:37:11.360' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'f456805c-6822-4c2d-a170-be5d19d02a17', N'se2', CAST(N'2021-09-16 21:50:22.980' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'bd0d4a4a-a1c4-4b30-a207-beb0cdcb086b', N'se2', CAST(N'2021-07-14 09:25:27.907' AS DateTime), 32000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'13ec70ac-5eca-4f5f-9a06-bf1fdf6ada91', N'se2', CAST(N'2021-07-14 10:13:23.963' AS DateTime), 945000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'bd8b8a79-d608-414e-9c85-c5dfba01c198', N'se2', CAST(N'2021-09-16 11:13:03.587' AS DateTime), 445000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'09e76a98-aded-4702-b6d3-c6186ffa0d9e', N'se2', CAST(N'2021-09-16 10:46:27.570' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'eb87f237-ecae-4c2e-9fc4-ce9de3a1727a', N'se20', CAST(N'2021-09-09 08:12:28.407' AS DateTime), 561000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'26c303f6-260b-445f-83b7-cf09811fe0e5', N'se2', CAST(N'2021-09-16 21:25:26.303' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e4de93f0-61e4-4e3f-a4dc-d153a682dc25', N'se2', CAST(N'2021-09-17 21:20:38.563' AS DateTime), 178000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'e97e74af-5388-4782-be75-d225731c6f95', N'se2', CAST(N'2021-09-18 08:49:44.157' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'27dffc2a-8def-49df-a8ca-d60f333f9289', N'se2', CAST(N'2021-09-17 21:10:46.080' AS DateTime), 198000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'bc12ae49-43ad-48e8-88e1-d6496f205473', N'se2', CAST(N'2021-09-16 20:38:36.443' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'29631726-307e-4b82-8cfc-d65f3992d125', N'se2', CAST(N'2021-07-11 10:38:36.233' AS DateTime), 178000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'69de9890-decd-42a8-89f7-d78e2c168672', N'se2', CAST(N'2021-07-11 14:31:03.053' AS DateTime), 178000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6d647f0f-ed86-42c2-9f3f-dc7a2bd3bd09', N'se2', CAST(N'2021-07-14 10:07:26.377' AS DateTime), 198000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'57c03f90-abac-434c-b131-de8f9bf4fc31', N'se2', CAST(N'2021-07-14 19:01:48.170' AS DateTime), 243000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8cc839e7-182b-42ae-a4b2-e15c1817fdb6', N'se3', CAST(N'2021-08-31 10:12:42.853' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'794cbb6f-bc4a-4ebd-b989-e7c9dcdd9087', N'se2', CAST(N'2021-09-09 08:17:01.963' AS DateTime), 400000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'294a9d06-247e-4a54-8e20-e99be9a118f7', N'se2', CAST(N'2021-09-16 20:54:53.260' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'afb9e050-540e-47f6-8a82-ea054270b7d9', N'se2', CAST(N'2021-09-16 10:46:42.103' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ce78b85f-2808-4a99-a57f-ea4502a31b3c', N'se2', CAST(N'2021-09-18 08:56:30.440' AS DateTime), 32000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'200bf0f1-2703-4603-ac74-eaf0ca3fe877', N'se2', CAST(N'2021-09-16 11:39:21.283' AS DateTime), 89000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'7a3456c3-1b8c-48a8-b369-ee2100e4d59f', N'se2', CAST(N'2021-09-16 10:48:18.037' AS DateTime), 0.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'9d08c494-47ca-4730-bcb3-eefc4c0d7fe4', N'se2', CAST(N'2021-07-14 09:49:37.530' AS DateTime), 240000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'5463cd87-67a8-41d4-b671-ef8d73e9dff0', N'se2', CAST(N'2021-09-16 10:39:58.950' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'8146067f-1f38-42c7-8c3b-f0650a3be8b6', N'se2', CAST(N'2021-09-09 15:14:26.310' AS DateTime), 72000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'316403a4-78dd-46a0-a6c2-f124f41cedb7', N'se2', CAST(N'2021-09-23 11:38:19.867' AS DateTime), 134000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'6c2e6cab-f27d-4656-ac99-f1bef4c8e684', N'se2', CAST(N'2021-07-12 09:02:56.863' AS DateTime), 39000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'161def58-95bc-4772-a800-f480f2029395', N'se2', CAST(N'2021-07-14 09:01:22.827' AS DateTime), 72000.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'ee94b709-2e37-49ba-90bb-f4f6aada8c85', N'se2', CAST(N'2021-09-08 10:17:25.530' AS DateTime), 50000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'a5394d7e-ea0d-442b-b484-f59e744809ff', N'se63', CAST(N'2021-07-19 19:35:44.017' AS DateTime), 148000.0000, N'I', N'Paid')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'da266ae0-4cbf-42b6-b697-f6029a73d9cb', N'se2', CAST(N'2021-07-11 10:40:03.807' AS DateTime), 0.0000, N'I', N'Unpaid debt')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [Date], [Price], [StatusID], [PaymentStatus]) VALUES (N'87656095-00e0-42d6-bc19-fb3a7ba0846b', N'se2', CAST(N'2021-07-11 10:39:14.440' AS DateTime), 144000.0000, N'I', N'Paid')
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B1', N'Harry Potter 1', N'L1', N'J. K. Rowling', 20, 130000.0000, N'A', CAST(N'2021-06-27 18:07:08.490' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B11', N'Harry Potter 2', N'G1', N'J. K. Rowling', 15, 102000.0000, N'A', CAST(N'2021-06-27 18:13:41.723' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B12', N'Harry Potter 3', N'G1', N'J. K. Rowling', 20, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B13', N'Harry Potter 4', N'G1', N'J. K. Rowling', 16, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B14', N'Harry Potter 5', N'G1', N'J. K. Rowling', 19, 132000.0000, N'A', CAST(N'2021-06-27 18:13:41.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B2', N'Harry Potter 6', N'L2', N'J. K. Rowling', 20, 90000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B21', N'Harry Potter 7', N'L1', N'J. K. Rowling', 14, 160000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B22', N'Harry Potter 8', N'L1', N'J. K. Rowling', 16, 110000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B23', N'Harry Potter 9', N'L1', N'J. K. Rowling', 28, 100000.0000, N'A', CAST(N'2021-06-27 18:11:30.783' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B24', N'Love is gone 4', N'L1', N'Peter', 111, 120000.0000, N'A', CAST(N'2021-06-27 18:11:30.787' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B25', N'IT Book', N'L2', N'Peter', 15, 60000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B26', N'Artificial Intelligence', N'L2', N'Peter', 20, 50000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B27', N'No love no life', N'L2', N'Peter', 17, 70000.0000, N'A', CAST(N'2021-06-27 18:13:27.393' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B28', N'No eat no life', N'L2', N'Oliver', 34, 100000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B29', N'Stupid person', N'L2', N'Oliver', 10, 90000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B30', N'Life of the Time Cat', N'L2', N'Oliver', 22, 70000.0000, N'A', CAST(N'2021-06-27 18:13:27.397' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B42', N'Life of the Time Dog', N'G2', N'Oliver', 22, 100000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B43', N'The A to Z of Fighting Boredom', N'G2', N'Oliver', 14, 120000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B44', N'Beloved 1', N'G2', N'George', 51, 120000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B45', N'Don Quixote', N'G2', N'George', 12, 110000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B46', N'Beloved 2', N'G2', N'George', 32, 105000.0000, N'A', CAST(N'2021-06-27 18:15:01.250' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B51', N'Invisible Man 1', N'L1', N'Bonnie', 31, 97000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B52', N'Invisible Man 2', N'L1', N'Bonnie', 17, 78000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B53', N'Invisible Man 3', N'L1', N'Bonnie', 11, 93000.0000, N'A', CAST(N'2021-06-27 18:16:17.727' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B54', N'A Passage to India', N'L1', N'Bonnie', 27, 89000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B55', N'A Passage to America', N'L1', N'Bonnie', 30, 72000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B56', N'A Passage to Laos', N'L1', N'Jameson', 25, 99000.0000, N'A', CAST(N'2021-06-27 18:16:17.730' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B6', N'One Hundred Years of Solitude', N'S1', N'Jameson', 20, 111000.0000, N'A', CAST(N'2021-06-27 18:19:39.173' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B61', N'One Thoudsan Years of Solitude', N'S1', N'Jameson', 25, 121000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B62', N'The Great Gatsby. F.', N'S1', N'Jameson', 7, 91000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B63', N'To Kill a Mockingbird 1', N'S1', N'Jameson', 12, 81000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B64', N'To Kill a Mockingbird 2', N'S1', N'Jameson', 53, 55000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B65', N'I love Science 6', N'S1', N'Jameson', 66, 55000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B66', N'I love Science 7', N'S1', N'Brandon ', 51, 51000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B67', N'I love Science 8', N'S1', N'Brandon', 13, 52000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B68', N'I love Science 9', N'S1', N'Brandon', 23, 25000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B69', N'I love Science 10', N'S1', N'Brandon', 76, 19000.0000, N'A', CAST(N'2021-06-27 18:19:39.177' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B7', N'IT Book', N'S2', N'Brandon', 11, 32000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B71', N'Stephen King', N'S2', N'Queen Elizabeth', 14, 35000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B72', N'Clean Code', N'S2', N'Queen Elizabeth', 51, 39000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B73', N'Eloquent JavaScript', N'S2', N'Queen Elizabeth', 43, 49000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B74', N'Sharing books talking science 5', N'S2', N'Queen Elizabeth', 22, 67000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B75', N'Android', N'S2', N'Queen Elizabeth', 18, 52000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B76', N'Akata Warrior', N'S2', N'Queen Elizabeth', 26, 32000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B77', N'Professional developers of iowa', N'S2', N'Queen Elizabeth', 14, 79000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B78', N'Computer awareness', N'S2', N'Queen Elizabeth', 37, 89000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblProducts] ([ProductID], [ProductName], [CategoryID], [Writer], [QuantityInStock], [Price], [StatusID], [PublicationDate]) VALUES (N'B79', N'Linked', N'S2', N'Queen Elizabeth', 25, 110000.0000, N'A', CAST(N'2021-06-27 18:23:19.020' AS DateTime))
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'US', N'User')
INSERT [dbo].[tblStatus] ([StastusID], [StatusName]) VALUES (N'A', N'Active')
INSERT [dbo].[tblStatus] ([StastusID], [StatusName]) VALUES (N'I', N'Inactive')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se1', N'1000:ca889bf8056e4f3882a9c5b55c48c32bfd84ec0bc8fefda5:7e5f1b5dd44dd4a9ad8f970942c24347827c5207a838ecd7', N'Peter', N'Male', N'AD', N'vanfun@gmail.com', N'0971775111', N'HDBank', N'94/21 Bùi Quang Là F12', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se10', N'1000:a499a742d335fd2c178d1f587ef1d62e1a1ac092d458d6be:2017f7b90e8a02dded007cd945963f8fb679cb9bd7950ac6', N'Smith', N'Male', N'US', N'Smith@gmail.com', N'0917161516', N'ACB', N'Nguyen Van Luong F12', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se11', N'1000:8e4023ce1417f8631c1e72838d58055eae1875a823b6e064:6d3583a5dc510dcdf7c996017383bf8d36b67a76a4cf43a5', N'Jackson', N'Male', N'US', N'gelbero@gmail.com', N'0943433111', N'TPBank', N'Vinhome Quan 9', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se12', N'1000:a6558a7e1ae973bbf688e6a0e38d91ef92fd3cfe8662f040:4237e4c84d728a6678a17d1d280abd3696da55f0a85f317a', N'Harry', N'Male', N'US', N'harry@gmail.com', N'0987161516', N'Hdbank', N'Long An Los Angeles', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se13', N'1000:dd6c2bd332ba7444a06a4d59ca2009c06bde3e95fb543cd1:c28c0255244002c3ec19d70857513aaa201cecff51d11edf', N'Jacob', N'Female', N'US', N'jacob@gmail.com', N'0971323111', N'ACB', N'Nguyễn Công Trứ', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se14', N'1000:f9961fe78d4a295ab775f036819066b9ba82bae7c86dba56:2d860cb3fe186a90cc7341dcd1e6dab7066bd75b1db0f9ad', N'Charlie', N'Male', N'US', N'charlie@gmail.com', N'0931235111', N'Vietcombank', N'Hai Bà Trưng', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se15', N'1000:b8c5d85beac6593a46b8cef14006b6cba8970b6a3db4125a:9b0800bf87c0d5de6760bf6cfc9e73461e4e7270819582e9', N'Oliver', N'Male', N'AD', N'namaaa1@gmail.com', N'0971745711', N'Vietcombank', N'Vinhome Quận 6', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se16', N'1000:bb599444c2305adea5096217f934b216d3d4d2fe6cf5c2b5:4c1d3ce4cfbdff3988702056a1995554e7d64aa2f910459a', N'Anna lee', N'Male', N'US', N'Amelia@gmail.com', N'09717751628', N'HDBank', N'Quang Trung', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se17', N'1000:db6e8b7749261e1acec44a073b2ba0aeee5f1a0c88c0524b:60509605ebae14460efb14b05e308af76ba0196905efc0e7', N'James', N'Male', N'US', N'James@gmail.com', N'09717751691', N'Vietcombank', N'Gò Vấp TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se18', N'1000:c372d76e3c96994f681090911051b360464c4d6ab1d8585a:56004d65153c890442e31d9aed833cdc2b5a53193a3f7ddd', N'Thomas', N'Male', N'US', N'thomas31@gmail.com', N'0917857383', N'ACB', N'Phạm Văn Chiêu', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se19', N'1000:a18606191a76dbbdb14faa28a53cce1e9000da511dbf1edb:71bd94cec4e886290cadecf3467b921ae81b53167555f78a', N'George', N'Male', N'US', N'george@gmail.com', N'0965646471', N'ACB', N'Đinh Bộ Lĩnh', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se2', N'1000:bb644d5c38a34cdf548625a42ae9b348a36a1438f9e8903a:e5bb301582d425f1f3b5c762014ad99c4a840f57d41a72ea', N'Myaaa', N'Female', N'US', N'Myaaa@gmail.com', N'09371233111', N'HDBank', N'Quận 12 TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se20', N'1000:0bf83f8dc4a0e8bf565c8fcc7be1204280157561b80d39be:a1650f2a48bfd4a6faa520f8eb0b611632c23e7084133f37', N'Oscar', N'Male', N'US', N'Oscar2@gmail.com', N'0916151415', N'ACB', N'Gò Vấp TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se21', N'1000:d0a64cb9c5021b757686b836fc18b15afed6fff8aaf625f1:ee0a11b0a6316e57cb57367628dfa0f341b302544d7b477b', N'William', N'Male', N'US', N'William@gmail.com', N'0976156151', N'ACB', N'Đà Nẵng', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se23', N'1000:7455f4cc81733d98929170e434785f674a0c4653a1b6b60c:f95079d4f4fc4f427b3f061e7fe18b330eeca17026a009d8', N'NoName10', N'Female', N'US', N'phuxiteo223@zing.vn', N'09717717172', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se3', N'1000:5bd051d8101b201ba2076e2789c829eadd0100f9750dbf8a:52a8d99b401d68ce9fce12bf8b3977e9574a819562e8b566', N'Taylor', N'Male', N'US', N'Taylor@gmail.com', N'0945637171', N'VPBank', N'Hoi An Quang Nam', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se35', N'1000:662d32ee9a7dca342e094d175a1c7ba617a6b0beb9fb558f:37af9159e903023a963d84690ed58e4cdcb756dec03d440d', N'NoName', N'Female', N'US', N'vanphuong2001@gmail.com', N'0963218731', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se38', N'1000:0145e3ab0b5202162a736109a65e455a8b0c1eba39d883d2:13cfc6ce1963c07461ab1eb8bdf6934cf96707e6cbd7c276', N'Justin', N'Male', N'US', N'justinboy@zing.vn', N'09615141617', N'Hdbank', N'New York City', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se4', N'1000:7d778f6a6cb1fe09902408232fa854d096154829f3b87970:3def648f85f0718fd66dad2a9874cd09b1128ada485c2656', N'Triều Mee', N'Female', N'US', N'trieumy2404@gmail.com', N'0123456789', N'HDBank', N'Việt Nam Tphcm', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se41', N'1000:204bdfc6bd34cbe440c88694e15c24fd8679e7ad0ed0aaa9:7e8412a00a19bc179ade3ebc72cdde7a52dfc27144b12be9', N'Nguyễn Thị Thủy', N'Male', N'US', N'ntt0809@gmail.com', N'0917161611', N'HDBank', N'Gò Vấp TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se47', N'1000:a1524f113c5f9e8791b826bcfac0d54797f7189cd49e9ec0:c06797e26f9e1de58c6531c19389f4485d38117eea5c3ebc', N'Cậu Vàng', N'Male', N'US', N'cauvang@gmail.com', N'0971775169', N'ACB', N'Phạm Văn Chiêu', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se5', N'1000:55b9b824298008c3666d96b1a763587d4598a5afa78c75c9:32f8be96b4ebfa74613f20f354b302dcb013b94baf39d695', N'Tremblay', N'Male', N'US', N'Tremblay@gmail.com', N'03232251111', N'BIDV', N'Hà Nội', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se6', N'1000:293aac910b12031c977a7b39b220613d556689756da693b2:21f277790675b7e4b1b95b7ae52efc9a337dc4e2f416982e', N'Martin', N'Male', N'US', N'Martin@gmail.com', N'0323225115', N'HDBank', N'United States', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se60', N'1000:186a0e4ccb62121d62b73572b2afba950b0701ff463c6cd0:cf6c2aad04ee6ebfa013f628000462ec50ada0f37444c63d', N'Võ Văn Phương', N'Male', N'AD', N'funvo@gmai.com', N'09716151611', N'HDBank', N'Bùi Quang Là TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se61', N'1000:6f59d5adfe439ffafd7fdf12c735fc2712560b4c62120501:923c9073b8fb26fcc0ad9c9ca437a6b87733ea4c9000f794', N'Không có tên', N'Male', N'US', N'laohac@gmail.com', N'09178573831', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se63', N'1000:718ba305cb040534dd1a50211c38261ae7a88139351113aa:7eb8c9a8f45b6e7b4b37ec00003f44f511e3dc75c294e23e', N'Unknown', N'Male', N'AD', N'admin1@gmail.com', N'09716151511', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se64', N'1000:29209cf525e21fcedf9898a4bf911922c51f7ab82e076d3f:80ed96cbb5be727b6fd4e7068c4f375a3d4f3f1a54feaabd', N'Khoaaaaaa', N'Male', N'AD', N'phuxiteo66@zing.vn', N'09711775169', N'HDBank', N'Bui Quang La F12 Quan Go Vap', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se65', N'1000:afe84b2ae35b67b71cb1008615d07d9de3f25b0ed251d9d4:e10365e1e19ec1ea20286eea131f335218c13b9565264dd1', N'Khoa buggg', N'Male', N'US', N'khoabug@gmail.com', N'0971616177', N'HDBank', N'Tay Ninh Viet Nam', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se66', N'1000:d36b78dc8ed820791c3d19bf5980393eaf9998fc88871daa:876450ba8a6156b034c4b75c15998adbd5453dd91dfa4504', N'Hùng', N'Male', N'US', N'phuxite2o3@zing.vn', N'09161612512', N'HDBank', N'Quang Trung TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se67', N'1000:4d66baecb7caf86b530dd260840f67b6e57eadf4420e3a5b:69a65a6b5aae8bb067c7603ea5ca5920367cb32aa1b50522', N'Đức', N'Female', N'US', N'phuxiteo67@zing.vn', N'09615151615', N'ACB', N'Phạm Văn Chiêu', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se7', N'1000:98b3f1a554ce4f2f563592e3bcaa688ae12608431803d79a:e46186f60b75a14a3e26d18ac89c9e4a73dcdf9ce755c833', N'Gagnon', N'Male', N'US', N'Gagnon@gmail.com', N'0971775161', N'HDBank', N'Paris France', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se83', N'1000:b9de3b0c9050e1b9e9b63629f6c3f10617470c6f476b62ca:f9f63026ef6494e4a32588e604d569d5b7f53fcb85093c07', N'Hoan', N'Male', N'AD', N'phuxiteo6@zing.vn', N'0936115216', N'HDBank', N'Quang Trung TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se84', N'1000:2520badc5998272f6a8e684b835d0e2d8b66ec9abf288681:8a9cdb36da7ab08cecd5362bcc7e0a918ea448e835c08554', N'Thompson', N'Male', N'AD', N'diajisdj@gmail.com', N'09716100511', N'HDBank', N'Bui Quang La F12 Quan Go Vap', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se89', N'1000:8dda1f773b90400d608a18b39f413e411554064adf571bcc:0bca20a72ad5e80d84b9393f8a143e065b1824ff0471c2a3', N'Đan', N'Male', N'US', N'kmda@gmail.com', N'0971551617', N'Sacombank', N'Phạm Văn Chiêu', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se90', N'1000:ddb3810d0af577fd28594ecb6507aa7a1262bc26d8525c1a:dd8d3d4c6e1d1b61eed6f44f0c9d084ee451fe45a2c0f65b', N'Thảo', N'Male', N'AD', N'Mickey@gmail.com', N'0971773211', N'Sacombank', N'Tokyo Japan', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se91', N'1000:9f5c06c19b735b2cee9b202a5f80889436efc54ecedf544f:387ee6a7b6edb2f597d4761b0236863fde6b3069186c93bb', N'Lan', N'Male', N'AD', N'Roy@gmail.com', N'0323225111', N'ACB', N'China', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se92', N'1000:422a2f23cf00378e07ec1b75b291b68b32452e0d1c23b23c:030a8d37f592b2d90230abfef1541600cdbd38f36737d6fc', N'Tùng', N'Male', N'US', N'phuxiteo23@zing.vn', N'09161661161', N'HDBank', N'Nguyen Thi Minh Khai Quan 1', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se93', N'1000:fb50b804617b96ba7ab36bcae8f60322d478bcb2ac6af1c7:98d127aae5a62b5bbdbc0f47405564b6c301dbc28aa5c0b9', N'Người thất nghiệp', N'Male', N'US', N'phuxiteo3@zing.vn', N'09772751691', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se95', N'1000:d351f528b53cb0b5413423fd50b8d26942ca51ad20bcd937:65a67144c21a6253d36f01b43faddf0a80f58bc1adea5967', N'Peterrrrrrrr', N'Female', N'US', N'vanphuong@gmail.com', N'09717751621', N'HDBank', N'94/21 Bùi Quang Là F12', N'A')
INSERT [dbo].[tblUsers] ([UserID], [Password], [FullName], [Gender], [RoleID], [Email], [PhoneNumber], [Bank], [Address], [StatusID]) VALUES (N'se96', N'1000:44af5471147efc81d7715625c87ab61f87d0ca271fe9fafd:6c37ab88f3f4e588e0f4875aa8c7dc85c813afc2352392e5', N'No name', N'Male', N'US', N'noname@gmail.com', N'09716151671', N'HDBank', N'Vô Gia Cư TPHCM', N'A')
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
