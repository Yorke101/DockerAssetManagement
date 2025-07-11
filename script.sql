USE [master]
GO
/****** Object:  Database [AssetManagerDB]    Script Date: 2025/07/07 14:03:47 ******/
CREATE DATABASE [AssetManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssetManagerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssetManagerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssetManagerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssetManagerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AssetManagerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssetManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssetManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssetManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssetManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssetManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssetManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssetManagerDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssetManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssetManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssetManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssetManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssetManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssetManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssetManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssetManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssetManagerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssetManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssetManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssetManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssetManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssetManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssetManagerDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AssetManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssetManagerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssetManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssetManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssetManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssetManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssetManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssetManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssetManagerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssetManagerDB] SET QUERY_STORE = OFF
GO
USE [AssetManagerDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2025/07/07 14:03:47 ******/
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
/****** Object:  Table [dbo].[AssetAssignments]    Script Date: 2025/07/07 14:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetAssignments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[AssignedAt] [datetime2](7) NOT NULL,
	[UnassignedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_AssetAssignments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 2025/07/07 14:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[SerialNumber] [nvarchar](450) NOT NULL,
	[MaintenanceIntervalDays] [int] NOT NULL,
	[LastMaintenanceDate] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2025/07/07 14:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250704162905_InitialCreate', N'9.0.6')
GO
SET IDENTITY_INSERT [dbo].[AssetAssignments] ON 

INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (1, 1, 2, CAST(N'2025-07-04T18:52:36.0421700' AS DateTime2), CAST(N'2025-07-04T18:57:56.7574170' AS DateTime2))
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (2, 3, 5, CAST(N'2025-07-04T18:56:39.9470019' AS DateTime2), CAST(N'2025-07-04T21:59:45.4894123' AS DateTime2))
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (3, 5, 10, CAST(N'2025-07-04T20:23:30.1545795' AS DateTime2), NULL)
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (4, 2, 5, CAST(N'2025-07-04T21:06:17.2803605' AS DateTime2), NULL)
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (5, 26, 4, CAST(N'2025-07-04T21:47:45.8433043' AS DateTime2), NULL)
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (6, 8, 7, CAST(N'2025-07-04T21:49:12.5498126' AS DateTime2), CAST(N'2025-07-04T21:49:28.1693030' AS DateTime2))
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (7, 27, 9, CAST(N'2025-07-04T21:50:14.5036345' AS DateTime2), NULL)
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (8, 1, 8, CAST(N'2025-07-04T22:10:22.8859696' AS DateTime2), NULL)
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (9, 28, 5, CAST(N'2025-07-07T12:46:23.7700911' AS DateTime2), CAST(N'2025-07-07T12:46:49.6875777' AS DateTime2))
INSERT [dbo].[AssetAssignments] ([Id], [AssetId], [EmployeeId], [AssignedAt], [UnassignedAt]) VALUES (10, 3, 6, CAST(N'2025-07-07T12:48:06.5980848' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[AssetAssignments] OFF
GO
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (1, N'HP EliteBook', N'Laptop', N'HP-ELITE-001', 90, CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:47:43.7843050' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (2, N'Dell XPS 13', N'Laptop', N'DX13-001', 180, CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (3, N'HP EliteBook 840', N'Laptop', N'HP840-002', 180, CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (4, N'Lenovo ThinkPad X1', N'Laptop', N'LTPX1-003', 180, CAST(N'2025-06-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (5, N'Apple MacBook Pro', N'Laptop', N'MBP-004', 365, CAST(N'2025-04-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (6, N'Samsung Monitor 27"', N'Monitor', N'SM27-005', 365, CAST(N'2025-03-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (7, N'LG UltraWide 34"', N'Monitor', N'LG34-006', 365, CAST(N'2025-02-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (8, N'Logitech MX Master 3', N'Mouse', N'MXM3-007', 730, CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (9, N'Microsoft Surface Pro 7', N'Tablet', N'SP7-008', 180, CAST(N'2025-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (10, N'Canon LBP6030', N'Printer', N'CLBP-009', 365, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (11, N'Epson EcoTank L3150', N'Printer', N'EETL-010', 365, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (12, N'Cisco IP Phone 8845', N'Phone', N'CIP8845-011', 730, CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (13, N'Jabra Evolve2 65', N'Headset', N'JE265-012', 365, CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (14, N'Dell Dock WD19', N'Docking Station', N'DDWD19-013', 730, CAST(N'2024-10-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (15, N'Kingston SSD 1TB', N'Storage', N'KSSD1TB-014', 1095, CAST(N'2023-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (16, N'Seagate External HDD 2TB', N'Storage', N'SEHDD2TB-015', 1095, CAST(N'2024-01-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (17, N'Brother HL-L2350DW', N'Printer', N'BHL2350-016', 365, CAST(N'2025-03-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (18, N'Asus ZenBook 14', N'Laptop', N'AZB14-017', 180, CAST(N'2025-06-12T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (19, N'BenQ GW2480', N'Monitor', N'BQGW2480-018', 365, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (20, N'Apple iPad Air', N'Tablet', N'IPAIR-019', 365, CAST(N'2025-05-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (21, N'HP USB Keyboard', N'Keyboard', N'HPKB-020', 730, CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:50:20.6133333' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (22, N'MC BOOK', N'Laptop', N'MC-BOOK-MC-1', 90, CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T18:51:13.0342545' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (23, N'ASUS', N'LAPTOP', N'ASUS-AS_009', 90, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T19:51:32.8725154' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (24, N'Asus', N'Latps', N'L-O978', 90, CAST(N'2025-07-04T18:22:53.7600000' AS DateTime2), CAST(N'2025-07-04T20:23:08.6679250' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (25, N'Assus', N'laptop', N'5252', 90, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T20:41:51.3862205' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (26, N'HP Printer', N'Electornic', N'HP-P-424', 90, CAST(N'2025-07-04T19:40:04.4060000' AS DateTime2), CAST(N'2025-07-04T21:41:15.5477214' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (27, N'AAA', N'test', N'45454', 90, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T21:49:58.4117307' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (28, N'Apple', N'Electoric', N'A-110P', 70, CAST(N'2025-07-07T10:44:41.8790000' AS DateTime2), CAST(N'2025-07-07T12:45:15.2177569' AS DateTime2))
INSERT [dbo].[Assets] ([Id], [Name], [Category], [SerialNumber], [MaintenanceIntervalDays], [LastMaintenanceDate], [CreatedAt]) VALUES (29, N'Laptop Cooler', N'Test', N'l-1200-C', 90, CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T12:49:00.6510278' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Assets] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (1, N'Alice Mokoena', N'alice.mokoena@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (2, N'Brian Nkosi', N'brian.nkosi@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (3, N'Chantel van Wyk', N'chantel.vw@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (4, N'Dumisani Khumalo', N'dumisani.k@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (5, N'Emily Naidoo', N'emily.naidoo@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (6, N'Farouk Patel', N'farouk.patel@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (7, N'Grace Mthembu', N'grace.m@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (8, N'Hassan Abrahams', N'hassan.abrahams@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (9, N'Isabella Dlamini', N'isabella.d@example.com')
INSERT [dbo].[Employees] ([Id], [FullName], [Email]) VALUES (10, N'Jabulani Sithole', N'jabulani.s@example.com')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
/****** Object:  Index [IX_AssetAssignments_AssetId]    Script Date: 2025/07/07 14:03:47 ******/
CREATE NONCLUSTERED INDEX [IX_AssetAssignments_AssetId] ON [dbo].[AssetAssignments]
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssetAssignments_EmployeeId]    Script Date: 2025/07/07 14:03:47 ******/
CREATE NONCLUSTERED INDEX [IX_AssetAssignments_EmployeeId] ON [dbo].[AssetAssignments]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Assets_SerialNumber]    Script Date: 2025/07/07 14:03:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Assets_SerialNumber] ON [dbo].[Assets]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_Email]    Script Date: 2025/07/07 14:03:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_Email] ON [dbo].[Employees]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetAssignments]  WITH CHECK ADD  CONSTRAINT [FK_AssetAssignments_Assets_AssetId] FOREIGN KEY([AssetId])
REFERENCES [dbo].[Assets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssetAssignments] CHECK CONSTRAINT [FK_AssetAssignments_Assets_AssetId]
GO
ALTER TABLE [dbo].[AssetAssignments]  WITH CHECK ADD  CONSTRAINT [FK_AssetAssignments_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssetAssignments] CHECK CONSTRAINT [FK_AssetAssignments_Employees_EmployeeId]
GO
USE [master]
GO
ALTER DATABASE [AssetManagerDB] SET  READ_WRITE 
GO
