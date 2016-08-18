USE [master]
GO
/****** Object:  Database [diagonostic_center_proj_1]    Script Date: 01-Aug-16 12:55:09 AM ******/
CREATE DATABASE [diagonostic_center_proj_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'diagonostic_center_proj_1', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\diagonostic_center_proj_1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'diagonostic_center_proj_1_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\diagonostic_center_proj_1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [diagonostic_center_proj_1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [diagonostic_center_proj_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET  MULTI_USER 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [diagonostic_center_proj_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [diagonostic_center_proj_1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [diagonostic_center_proj_1]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 01-Aug-16 12:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varbinary](50) NOT NULL,
	[DOB] [date] NULL,
	[Mobile_no] [varbinary](15) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_test]    Script Date: 01-Aug-16 12:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[Bill_no] [varchar](50) NOT NULL,
	[Print_date] [datetime] NOT NULL,
	[paid_amount] [varchar](10) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_patient_test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test_name]    Script Date: 01-Aug-16 12:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test_name](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Fee] [varchar](50) NOT NULL,
	[type_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_test_name] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test_type]    Script Date: 01-Aug-16 12:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test_type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_test_type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[test_name] ON 

INSERT [dbo].[test_name] ([Id], [Name], [Fee], [type_id], [created_at], [updated_at]) VALUES (2, N'RBS', N'150', 1, CAST(N'2016-07-25 18:20:48.000' AS DateTime), NULL)
INSERT [dbo].[test_name] ([Id], [Name], [Fee], [type_id], [created_at], [updated_at]) VALUES (3, N'S. Creatinine', N'350', 1, CAST(N'2016-07-25 19:15:29.000' AS DateTime), NULL)
INSERT [dbo].[test_name] ([Id], [Name], [Fee], [type_id], [created_at], [updated_at]) VALUES (1004, N'Test Name', N'150', 3, CAST(N'2016-07-30 21:59:41.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[test_name] OFF
SET IDENTITY_INSERT [dbo].[test_type] ON 

INSERT [dbo].[test_type] ([Id], [Name], [created_at], [updated_at]) VALUES (1, N'Blood', NULL, NULL)
INSERT [dbo].[test_type] ([Id], [Name], [created_at], [updated_at]) VALUES (2, N'X-Ray', NULL, NULL)
INSERT [dbo].[test_type] ([Id], [Name], [created_at], [updated_at]) VALUES (3, N'Echo', CAST(N'2016-07-25 13:53:40.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[test_type] OFF
ALTER TABLE [dbo].[patient_test]  WITH CHECK ADD  CONSTRAINT [FK_patient_test_patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([Id])
GO
ALTER TABLE [dbo].[patient_test] CHECK CONSTRAINT [FK_patient_test_patient]
GO
ALTER TABLE [dbo].[patient_test]  WITH CHECK ADD  CONSTRAINT [FK_patient_test_test_name] FOREIGN KEY([test_id])
REFERENCES [dbo].[test_name] ([Id])
GO
ALTER TABLE [dbo].[patient_test] CHECK CONSTRAINT [FK_patient_test_test_name]
GO
ALTER TABLE [dbo].[test_name]  WITH CHECK ADD  CONSTRAINT [FK_test_name_test_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[test_type] ([Id])
GO
ALTER TABLE [dbo].[test_name] CHECK CONSTRAINT [FK_test_name_test_type]
GO
USE [master]
GO
ALTER DATABASE [diagonostic_center_proj_1] SET  READ_WRITE 
GO
