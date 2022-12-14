USE [master]
GO
/****** Object:  Database [PustokDb2022]    Script Date: 12/5/2022 1:41:13 AM ******/
CREATE DATABASE [PustokDb2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PustokDb2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PustokDb2022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PustokDb2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PustokDb2022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PustokDb2022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PustokDb2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PustokDb2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PustokDb2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PustokDb2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PustokDb2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PustokDb2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [PustokDb2022] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PustokDb2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PustokDb2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PustokDb2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PustokDb2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PustokDb2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PustokDb2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PustokDb2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PustokDb2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PustokDb2022] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PustokDb2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PustokDb2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PustokDb2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PustokDb2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PustokDb2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PustokDb2022] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PustokDb2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PustokDb2022] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PustokDb2022] SET  MULTI_USER 
GO
ALTER DATABASE [PustokDb2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PustokDb2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PustokDb2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PustokDb2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PustokDb2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PustokDb2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PustokDb2022] SET QUERY_STORE = OFF
GO
USE [PustokDb2022]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookImages]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[BookId] [int] NOT NULL,
	[PosterStatus] [bit] NULL,
 CONSTRAINT [PK_BookImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StockStatus] [bit] NOT NULL,
	[SalePrice] [decimal](18, 2) NOT NULL,
	[DisCountPercent] [decimal](18, 2) NOT NULL,
	[CostPrice] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsNew] [bit] NOT NULL,
	[IsSpecial] [bit] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BtmPromotions]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BtmPromotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](30) NOT NULL,
	[Title2] [nvarchar](35) NOT NULL,
	[Title3] [nvarchar](50) NOT NULL,
	[BtnText] [nvarchar](25) NOT NULL,
	[RedirectUrl] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_BtmPromotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](75) NOT NULL,
	[Text1] [nvarchar](100) NOT NULL,
	[Text2] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](30) NOT NULL,
	[Title2] [nvarchar](50) NOT NULL,
	[Desc] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](75) NOT NULL,
	[BtnText] [nvarchar](30) NOT NULL,
	[RedirectUrl] [nvarchar](100) NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopPromotions]    Script Date: 12/5/2022 1:41:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopPromotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](75) NOT NULL,
	[RedirectUrl] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TopPromotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130182519_CreatedTablePustokDb2022', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130191159_DeletedBookTableIsnewandIsSpecial', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130194052_AddIsNewandIsSpecialColumnBookTable', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130204941_CreatedTablePustokDb2022', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221130222235_ChangedtypeofOrder', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221203124628_ChangedOrder', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221203133635_CreatedSettingTable', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221203161344_CreatedFeatureTable', N'6.0.11')
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (1, N'Bextiyar Vahabzade')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (2, N'Cingiz Abdullayev')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (3, N'Dostoyevski')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (4, N'Abdulla Saiq')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (5, N'Abbas Sehhet')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (6, N'Cefer Cabbarli')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (7, N'Leo Tolstoy')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (8, N'Sabahattin Ali')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (9, N'Charles Dickens')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (10, N'William Shakespeare')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (11, N'Cingiz Aitmatov')
INSERT [dbo].[Authors] ([Id], [FullName]) VALUES (12, N'Mark Twain')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookImages] ON 

INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (6, N'product-1.jpg', 2, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (7, N'product-2.jpg', 2, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (8, N'product-3.jpg', 2, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (9, N'product-4.jpg', 3, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (10, N'product-5.jpg', 3, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (11, N'product-6.jpg', 3, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (12, N'product-7.jpg', 4, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (13, N'product-8.jpg', 4, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (14, N'product-9.jpg', 4, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (15, N'product-10.jpg', 5, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (16, N'product-7.jpg', 5, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (17, N'product-12.jpg', 6, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (18, N'product-1.jpg', 6, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (19, N'product-2.jpg', 7, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (20, N'product-3.jpg', 7, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (21, N'product-4.jpg', 8, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (22, N'product-5.jpg', 8, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (23, N'product-6.jpg', 9, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (24, N'product-7.jpg', 9, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (25, N'product-8.jpg', 9, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (26, N'product-9.jpg', 10, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (27, N'product-10.jpg', 10, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (28, N'product-11.jpg', 10, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (30, N'product-12.jpg', 11, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (31, N'product-1.jpg', 11, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (32, N'product-2.jpg', 12, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (33, N'product-3.jpg', 12, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (34, N'product-4.jpg', 13, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (35, N'product-5.jpg', 13, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (36, N'product-6.jpg', 13, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (37, N'product-7.jpg', 14, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (38, N'product-8.jpg', 14, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (39, N'product-9.jpg', 14, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (40, N'product-10.jpg', 15, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (41, N'product-11.jpg', 15, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (42, N'product-4.jpg', 16, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (43, N'product-5.jpg', 16, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (44, N'product-8.jpg', 16, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (45, N'product-12.jpg', 17, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (46, N'product-1.jpg', 17, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (47, N'product-2.jpg', 17, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (48, N'product-3.jpg', 18, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (49, N'product-4.jpg', 18, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (50, N'product-5.jpg', 19, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (51, N'product-6.jpg', 19, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (52, N'product-7.jpg', 20, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (53, N'product-8.jpg', 20, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (54, N'product-9.jpg', 21, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (55, N'product-10.jpg', 21, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (56, N'product-11.jpg', 21, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (57, N'product-12.jpg', 22, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (58, N'product-1.jpg', 22, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (59, N'product-2.jpg', 22, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (60, N'product-3.jpg', 23, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (61, N'product-4.jpg', 23, NULL)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (62, N'product-5.jpg', 23, 1)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (63, N'product-6.jpg', 24, 0)
INSERT [dbo].[BookImages] ([Id], [Image], [BookId], [PosterStatus]) VALUES (64, N'product-7.jpg', 24, 1)
SET IDENTITY_INSERT [dbo].[BookImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (2, 1, 1, N'Damda yaşayan Karlson', 1, CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (3, 2, 2, N'Mahmud və Məryəm', 1, CAST(15.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (4, 3, 3, N'Hələbli arıçı', 1, CAST(25.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (5, 4, 4, N'Tanrı ile Dostluk', 1, CAST(33.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (6, 5, 5, N'Çinko Çocuklar', 1, CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (7, 6, 6, N'Öteki Kadın', 1, CAST(20.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (8, 7, 7, N'Umutyüzü durağı', 1, CAST(18.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (9, 8, 8, N'Qarlı aşırım', 1, CAST(25.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (10, 1, 9, N'Yazıçıların gizli həyatı', 1, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (11, 2, 10, N'Aşiq xəyalət', 1, CAST(22.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (12, 3, 11, N'Bataqlıq qızı', 1, CAST(10.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (13, 4, 12, N'Qəndəharlı agent', 1, CAST(24.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (14, 5, 1, N'Türkü söyləyən şəhərlər', 1, CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, 1, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (15, 6, 2, N'Gözyaşı malikanəsi', 1, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (16, 7, 3, N'İctimai müqavilə', 1, CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, 1, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (17, 8, 4, N'Yatmış xatirələr', 1, CAST(14.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (18, 1, 5, N'Flaminqolar çəhrayıdır', 1, CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 0, 1, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (19, 2, 6, N'Tanrının formulu', 1, CAST(18.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (20, 3, 7, N'Boyama Yolda', 1, CAST(7.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (21, 4, 8, N'Görünməz mürəkkəb', 1, CAST(35.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 0, 0, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (22, 5, 9, N'Mənim Puşkinim', 1, CAST(50.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 0, 1, 1)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (23, 6, 10, N'Arzulara aparan yol', 1, CAST(28.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 0, 1, 0)
INSERT [dbo].[Books] ([Id], [GenreId], [AuthorId], [Name], [StockStatus], [SalePrice], [DisCountPercent], [CostPrice], [IsDeleted], [IsNew], [IsSpecial]) VALUES (24, 7, 11, N'Kainatın musiqisi', 1, CAST(40.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [Icon], [Text1], [Text2]) VALUES (1, N'fas fa-shipping-fast', N'Free Shipping Item', N'Orders over $500')
INSERT [dbo].[Features] ([Id], [Icon], [Text1], [Text2]) VALUES (2, N'fas fa-redo-alt', N'Money Back Guarantee', N'100% money back')
INSERT [dbo].[Features] ([Id], [Icon], [Text1], [Text2]) VALUES (3, N'fas fa-piggy-bank', N'Cash On Delivery', N'Lorem ipsum dolor amet')
INSERT [dbo].[Features] ([Id], [Icon], [Text1], [Text2]) VALUES (4, N'fas fa-life-ring', N'Help & Support', N'Call us : + 0123.4567.89')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Dastan')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Roman')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Povest')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Dram')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (5, N'Komediya')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (6, N'Sci-Fi')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (7, N'Bioqrafiya')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (8, N'Dedektiv')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'HeaderLogo', N'logo.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (2, N'FooterLogo', N'logo--footer.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'Address', N'Example Street 98, HH2 BacHa, New York, USA')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'Phone', N'+18088 234 5678')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'Email', N'suport@hastech.com')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'SupportPhone', N'+01-202-555-0181')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (7, N'BtmPromoImage', N'promo-banner-full.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (8, N'BtmPromoTitle', N'I Love This Idea!')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (9, N'BtmPromoDesc', N'Cover up front of book and
                                    leave summary')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (10, N'BtmPromoBtnUrl', N'#')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (11, N'BtmPromoBtnText', N'$78.09 - Learn More')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (12, N'MiddlePromoImage1', N'promo-banner-mid.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (13, N'MiddlePromoImage2', N'promo-banner-small.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (14, N'MiddlePromoTitle1', N'Buy 3. Get Free 1.')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (15, N'MiddlePromoDesc1', N'50% off for selected products in Pustok.')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (16, N'MiddlePromoBtnUrl1', N'#')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (17, N'MiddlePromoBtnUrl2', N'#')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (18, N'MiddlePromoTitle2', N'$26.00')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (19, N'MiddlePromoDescHalf1', N'Praise for')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (20, N'MiddlePromoDescHalf2', N'The Night Child')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (21, N'MiddlePromoBtnText1', N'See More')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (22, N'MiddlePromoBtnText2', N'Buy Now')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (23, N'TopPromoImage1', N'promo-banner-with-text.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (24, N'TopPromoImage2', N'promo-banner-with-text-2.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (25, N'TopPromoUrl1', N'#')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (26, N'TopPromoUrl2', N'#')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title1], [Title2], [Desc], [Image], [BtnText], [RedirectUrl], [Order]) VALUES (1, N'H.G. Wells', N'De Vengeance', N'Cover Up Front Of Books and Leave Summary', N'home-slider-2-ai.png', N'$78.09 - Order Now!', N'shop-grid.html', 1)
INSERT [dbo].[Sliders] ([Id], [Title1], [Title2], [Desc], [Image], [BtnText], [RedirectUrl], [Order]) VALUES (2, N'J.D. Kurtness', N'De Vengeance', N'Cover Up Front Of Books and Leave Summary', N'home-slider-1-ai.png', N'$78.09 - Learn More', N'shop-grid.html', 2)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
/****** Object:  Index [IX_BookImages_BookId]    Script Date: 12/5/2022 1:41:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_BookImages_BookId] ON [dbo].[BookImages]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_AuthorId]    Script Date: 12/5/2022 1:41:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorId] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_GenreId]    Script Date: 12/5/2022 1:41:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_GenreId] ON [dbo].[Books]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsNew]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsSpecial]
GO
ALTER TABLE [dbo].[BookImages]  WITH CHECK ADD  CONSTRAINT [FK_BookImages_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookImages] CHECK CONSTRAINT [FK_BookImages_Books_BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_AuthorId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres_GenreId]
GO
USE [master]
GO
ALTER DATABASE [PustokDb2022] SET  READ_WRITE 
GO
