USE [master]
GO
/****** Object:  Database [ASPNET]    Script Date: 1/16/2025 10:01:57 PM ******/
CREATE DATABASE [ASPNET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASPNET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTHANHDAT\MSSQL\DATA\ASPNET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASPNET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTHANHDAT\MSSQL\DATA\ASPNET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASPNET] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASPNET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASPNET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASPNET] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASPNET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASPNET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASPNET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASPNET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASPNET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASPNET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASPNET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASPNET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASPNET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASPNET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASPNET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASPNET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASPNET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASPNET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASPNET] SET RECOVERY FULL 
GO
ALTER DATABASE [ASPNET] SET  MULTI_USER 
GO
ALTER DATABASE [ASPNET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASPNET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASPNET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASPNET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASPNET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASPNET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASPNET', N'ON'
GO
ALTER DATABASE [ASPNET] SET QUERY_STORE = OFF
GO
USE [ASPNET]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[Image] [nvarchar](255) NULL,
	[CategoryImage] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[ProductImage] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/16/2025 10:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (1, N'Apple', N'Thương hiệu Apple', CAST(N'2024-12-11T13:44:17.920' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.920' AS DateTime), NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (2, N'Sony', N'Thương hiệu Sony', CAST(N'2024-12-11T13:44:17.920' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.920' AS DateTime), NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (3, N'Dell', N'Thương hiệu Dell', CAST(N'2024-12-11T13:44:17.920' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.920' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Image], [CategoryImage]) VALUES (1, N'Điện thoại', N'Danh mục các sản phẩm điện thoại', CAST(N'2024-12-11T13:44:17.917' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.917' AS DateTime), NULL, N'20.jpg', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Image], [CategoryImage]) VALUES (2, N'Âm thanh', N'Danh mục các thiết bị âm thanh', CAST(N'2024-12-11T13:44:17.917' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.917' AS DateTime), NULL, N'10.jpg', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Image], [CategoryImage]) VALUES (3, N'Máy tính', N'Danh mục các thiết bị máy tính', CAST(N'2024-12-11T13:44:17.917' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.917' AS DateTime), NULL, N'17.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20241225154154', 1, 17, CAST(N'2024-12-25T15:41:54.933' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241225161107', 1, 17, CAST(N'2024-12-25T16:11:07.183' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20241230155610', 2, 17, CAST(N'2024-12-30T15:56:10.477' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20250108124629', 1, 17, CAST(N'2025-01-08T12:46:29.783' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20250108124713', 1, 17, CAST(N'2025-01-08T12:47:13.050' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20250108124752', 1, 17, CAST(N'2025-01-08T12:47:52.717' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20250108124929', 1, 17, CAST(N'2025-01-08T12:49:29.557' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20250108125236', 1, 17, CAST(N'2025-01-08T12:52:36.860' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20250108125353', 1, 17, CAST(N'2025-01-08T12:53:53.420' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20250108130327', 1, 17, CAST(N'2025-01-08T13:03:27.773' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20250108130435', 1, 17, CAST(N'2025-01-08T13:04:35.853' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20250108130807', 1, 17, CAST(N'2025-01-08T13:08:07.203' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang-20250108130917', 2, 17, CAST(N'2025-01-08T13:09:17.727' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20250108131134', 2, 17, CAST(N'2025-01-08T13:11:34.433' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20250108131348', 2, 17, CAST(N'2025-01-08T13:13:48.903' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20250108133043', 1, 17, CAST(N'2025-01-08T13:30:43.333' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang-20250108133333', 1, 17, CAST(N'2025-01-08T13:33:33.740' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (18, N'DonHang-20250108133507', 1, 17, CAST(N'2025-01-08T13:35:07.633' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (19, N'DonHang-20250108133710', 1, 17, CAST(N'2025-01-08T13:37:10.857' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (20, N'DonHang-20250108133901', 1, 17, CAST(N'2025-01-08T13:39:01.627' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (21, N'DonHang-20250108134054', 2, 17, CAST(N'2025-01-08T13:40:54.003' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (22, N'DonHang-20250108141146', 1, 17, CAST(N'2025-01-08T14:11:46.723' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (23, N'DonHang-20250108141412', 2, 17, CAST(N'2025-01-08T14:14:12.780' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (24, N'DonHang-20250115141216', 1, 17, CAST(N'2025-01-15T14:12:16.603' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (25, N'DonHang-20250115143133', 1, 17, CAST(N'2025-01-15T14:31:33.470' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (26, N'DonHang-20250115144805', 6, 17, CAST(N'2025-01-15T14:48:05.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 5, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 6, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 7, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 8, 25, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 9, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 10, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 11, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 12, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 13, 21, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 14, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 15, 19, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 16, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 16, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 17, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 18, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 19, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 20, 19, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 21, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 22, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 23, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 24, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 25, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (26, 26, 28, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (1, N'iPhone 16 Pro Max 256GB | Chính hãng VN/A', N'Màn hình Super Retina XDR 6,9 inch lớn hơn có viền mỏng hơn, đem đến cảm giác tuyệt vời khi cầm trên tay.', N'iPhone 16 Pro Max sở hữu màn hình 6.9 inch với công nghệ ProMotion, mang lại trải nghiệm hiển thị mượt mà và sắc nét, lý tưởng cho giải trí và làm việc.', N'20.jpg', CAST(33890000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (2, N'Laptop ASUS TUF Gaming F15 FX507ZC4-HN095W', N'Bộ vi xử lý Intel Core i5-12500H cho hiệu năng mạnh mẽ để chơi game mượt mà, xử lý các tác vụ đa nhiệm và sáng tạo nội dung.', N'Màn hình 15.6 inch với tần số quét 144Hz cho hình ảnh chuyển động mượt mà, giảm thiểu hiện tượng xé hình và giật lag, mang đến trải nghiệm chơi game tuyệt vời.', N'17.jpg', CAST(19690000.00 AS Decimal(18, 2)), 3, 3, CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (3, N'Xiaomi 14T (12GB 512GB)', N'Hiệu năng mạnh mẽ với chip MediaTek Dimensity 8300-Ultra - Mang lại hiệu năng tốt cho các tác vụ hàng ngày, từ lướt web, xem video đến chơi game với độ ổn định cao.', N'Thấu kính quang học Leica Summilux - Ghi lại những bức ảnh chi tiết, sắc nét phù hợp với nhu cầu nhiếp ảnh di động và quay phim chất lượng cao.', N'31.jpg', CAST(13990000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', CAST(N'2024-12-11T13:44:17.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (19, N'iPhone 13 128GB | Chính hãng VN/A', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao', N'iPhone 13 được trang bị chip A15 Bionic mạnh mẽ với 6 nhân CPU và 4 nhân GPU, cung cấp mức hiệu năng vượt trội, giúp xử lý nhanh chóng các tác vụ nặng.', N'24.jpg', CAST(13290000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-12-11T15:39:23.000' AS DateTime), NULL, CAST(N'2024-12-11T15:39:23.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (20, N'Laptop MSI Gaming Thin 15 B12UCX-1419VN', N'Vi xử lý Intel Core i5-12450H, RAM 8GB và ổ cứng SSD 512GB PCIe mang đến hiệu suất mượt mà cho các tác vụ hàng ngày, chơi game và chỉnh sửa video cơ bản.', N'Card đồ họa NVIDIA GeForce RTX 2050 giúp bạn chơi game ở độ phân giải Full HD với mức thiết lập đồ họa trung bình đến cao.', N'21.jpg', CAST(14990000.00 AS Decimal(18, 2)), 3, 3, CAST(N'2024-12-18T14:06:27.000' AS DateTime), NULL, CAST(N'2024-12-18T14:06:27.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (21, N'Apple MacBook Air M2 2024 8CPU 8GPU 16GB 256GB I Chính hãng Apple Việt Nam', N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg', N'Apple Macbook Air M2 2024 16GB 256GB thiết kế siêu mỏng 1.13cm, trang bị chip M2 8 nhân GPU, 16 nhân Neural Engine, RAM khủng 16GB, SSD 256GB, màn hình IPS Liquid Retina Display cùng hệ thống 4 loa cho trải nghiệm đỉnh cao.', N'27.jpg', CAST(14290000.00 AS Decimal(18, 2)), 3, 3, CAST(N'2024-12-18T14:10:00.000' AS DateTime), N'Admin', CAST(N'2024-12-18T14:10:00.000' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (24, N'Tai nghe Bluetooth True Wireless OPPO Enco Air3i', N'Trải nghiệm âm thanh chất lượng cao với công nghệ OPPO Alive Audio và driver 13.4mm', N'Tai nghe bluetooth OPPO Enco Air3i sở hữu thiết kế case sạc trong suốt độc đáo cùng hai tone màu xanh và trắng sang trọng. Tai nghe với driver âm thanh 13,4 mm cùng âm thanh vòm 360 độ.', N'8.jpg', CAST(990000.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-12-30T14:47:55.000' AS DateTime), NULL, CAST(N'2024-12-30T14:47:55.000' AS DateTime), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (25, N'Loa Bluetooth LG XBOOM GO XG2', N'Thời lượng pin 10 giờ, thưởng thức âm nhạc mọi lúc mọi nơi', N'Loa bluetooth LG XBOOM Go XG2 là thiết bị âm thanh di động với chất lượng âm thanh sống động với Sound Boost cho phép tùy chỉnh EQ để cá nhân hóa trải nghiệm nghe. ', N'10.jpg', CAST(790000.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-12-30T14:54:49.703' AS DateTime), N'Admin', CAST(N'2024-12-30T14:54:49.703' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (26, N'Loa JBL PartyBox Club 120', N'Trải nghiệm âm nhạc với âm lượng lớn và hiệu ứng âm thanh tuyệt vời với công suất 160W', N'Loa JBL Partybox Club 120 là mẫu loa dành riêng cho những buổi tiệc tùng khi được trang bị hệ thống 2 loa woofer, 2 loa tweeter có tổng công suất 160 W.', N'32.jpg', CAST(9790000.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-12-30T15:02:25.670' AS DateTime), N'Admin', CAST(N'2024-12-30T15:02:25.670' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (27, N'iPhone 13 128GB - Cũ Đẹp', N'Sản phẩm thu lại từ khách hàng không còn nhu cầu sử dụng, ngoại hình đẹp như máy mới', N'Bảo hành 6 tháng tại CellphoneS không loại trừ linh kiện, bảo hành cả nguồn, màn hình. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất', N'33.jpg', CAST(11590000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2025-01-08T14:10:22.797' AS DateTime), N'Admin', CAST(N'2025-01-08T14:10:22.797' AS DateTime), N'Admin', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status]) VALUES (28, N'Laptop ASUS ROG Strix G16 G614JIR-N4193W', N'Bộ vi xử lý Intel Core i9-14900HX, máy mang đến hiệu suất cực kỳ mạnh mẽ, đáp ứng tốt các tác vụ nặng và đa nhiệm.', N'RAM 32GB đảm bảo khả năng xử lý mượt mà ngay cả với các ứng dụng yêu cầu cao về bộ nhớ.', N'34.jpg', CAST(52990000.00 AS Decimal(18, 2)), 3, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Dat', N'Vo', N'vothanhdat@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Cong', N'Nguyen', N'nguyenthanhcong@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Dung', N'Nguyen', N'nguyenvotandung@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (4, N'Hau', N'Ly', N'lyminhhau@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (5, N'Dungg', N'Nguyen', N'nguyenvotandungg@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Trung', N'Vo', N'vothanhtrung@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [ASPNET] SET  READ_WRITE 
GO
