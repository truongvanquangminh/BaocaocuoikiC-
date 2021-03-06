USE [master]
GO
/****** Object:  Database [TruongVanQuangMinhDB]    Script Date: 20/06/2021 1:25:34 CH ******/
CREATE DATABASE [TruongVanQuangMinhDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TruongVanQuangMinhDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TruongVanQuangMinhDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TruongVanQuangMinhDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TruongVanQuangMinhDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TruongVanQuangMinhDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET  MULTI_USER 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TruongVanQuangMinhDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/06/2021 1:25:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/06/2021 1:25:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [varchar](100) NULL,
	[Description] [nvarchar](300) NULL,
	[Status] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 20/06/2021 1:25:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[PassWord] [varchar](100) NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (1, N'Pan', N'Pan thuộc thương hiệu giày nổi tiếng Pan Thái Lan ra đời từ năm 1977. Với tiêu chí đặt chất lượng sản phẩm lên đầu, giá cá phải chăng.')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (2, N'Jogarbola', N'Jogarbola gọi tắt là JGBL, là thương hiệu nổi tiếng về trang phục thể thao của Nhật Bản được thành lập vào tháng 11/2016 và đến nay đã có mặt tại Việt Nam.')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (3, N'Mitre', N'Mitre là sản phẩm thuộc thương hiệu thể thao nổi tiếng từ Anh Quốc nhượng quyền sản xuất cho Tập đoàn thể thao Động Lực Việt Nam.')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (4, N'Adidas', N'Adidas thuộc nhóm giày cao cấp với nhiều công nghệ hiện đại và sử dụng những loại chất liệu tốt nhất để cấu thành sản phẩm.')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (5, N'Akka', N'Tiêu chí đầu tiên khi sản xuất đôi giày AKKA đó là phải đảm bảo chất lượng từ phần mũ giày, đế giày, cho đến cả lót giày. Trong đó, mũ giày được làm từ da Nami PU, đế làm từ Cao su và lót giày làm từ EVA cao cấp.')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (6, N'Mira', N'Giày Mira có đa dạng các sản phẩm từ giày sân cỏ nhân tạo, giày sân futsal với mẫu mã đa dạng, không ngừng cải tiến, lắng nghe nhu cầu từ người dùng để cho ra những đôi giày chất lượng nhất.')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (1, N'Giày Pan Vigor X IC', 513000.0000, 20, N'https://bit.ly/2S8ziKS', N'Giày Pan Vigor X IC là sản phẩm mới nhất của Pan vào giai đoạn cuối năm 2020, Thiết kế ở giày Vigor X mang đến sự khác biệt trong các đường vân ở trên thân giày để tạo bề mặt tiếp xúc bóng tốt', N'Hiển thị', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (2, N'Giày Pan Vigor X TF', 537000.0000, 15, N'https://bit.ly/3vYpilL', N'Giày Pan Vigor X TF là sản phẩm mới nhất của Pan vào những ngày cuối năm 2020, Thiết kế ở giày Vigor X mang đến sự khác biệt trong các đường vân ở trên thân giày để tạo bề mặt tiếp xúc bóng tốt', N'Hiển th', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (3, N'Giày Pan Impulse VI TF', 560000.0000, 5, N'https://bit.ly/3ijc3Zb', N'Giày đá bóng Pan Impulse VI TF là mẫu giày sân cỏ nhân tạo mới ra mắt trong quý II năm 2021 của thương hiệu Pan Thái Lan. Mang một thiết kế mới mẻ, trẻ trung và đẹp mắt hơn, đây hứa hẹn sẽ là mẫu giày cực hot cho những người chơi bóng phong trào trong mùa hè năm nay.', N'Hiển thị', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (4, N'Giày Pan Wave Legend II IC', 940000.0000, 10, N'https://bit.ly/3cnQsuO', N'Giày Pan Wave Legend II IC là dòng sản phẩm giày Futsal cao cấp của Pan Thái Lan, được các vận động viên cũng như dân chơi bóng phong trào yêu chuộng bởi chất liêu da cao cấp, mềm mịn, cảm giác bóng tốt.', N'Hiển thị', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (6, N'Giày giá rẻ Mira Power TF', 251000.0000, 20, N'https://bit.ly/3zuimPs', NULL, NULL, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (7, N'Giày giá rẻ Mira Lux 19.3 TF', 341000.0000, 18, N'https://bit.ly/3zqGVNf', NULL, NULL, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (8, N'Giày Mira Winner TF', 419000.0000, 8, N'https://bit.ly/3wptXxn', NULL, NULL, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (9, N'Giày Jogarbola 001 TF', 389000.0000, 2, N'https://bit.ly/3iIV0Qu', NULL, NULL, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (10, N'Giày adidas Predator Freak.3', 1980000.0000, 4, N'https://bit.ly/2SzjcKj', NULL, NULL, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (11, N'Giày adidas Copa Sense.3', 1620000.0000, 7, N'https://bit.ly/2SyVjTc', NULL, NULL, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [CategoryID]) VALUES (12, N'Giày adidas X Ghosted.3 TF', 1620000.0000, 3, N'https://bit.ly/3zmZt1b', NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([ID], [UserName], [PassWord], [Status]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [PassWord], [Status]) VALUES (2, N'minh', N'c92f1d1f2619172bf87a12e5915702a6', N'Blocked')
INSERT [dbo].[UserAccount] ([ID], [UserName], [PassWord], [Status]) VALUES (3, N'linh', N'892da3d819056410c05bca7747d22735', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [PassWord], [Status]) VALUES (4, N'admin1', N'21232f297a57a5a743894a0e4a801fc3', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [PassWord], [Status]) VALUES (6, N'thanh', N'e99a18c428cb38d5f260853678922e03', N'Active')
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
USE [master]
GO
ALTER DATABASE [TruongVanQuangMinhDB] SET  READ_WRITE 
GO
