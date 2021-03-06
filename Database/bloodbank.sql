USE [master]
GO
/****** Object:  Database [Blood_Bank_Management]    Script Date: 14/Dec/2020 1:27:52 PM ******/
CREATE DATABASE [Blood_Bank_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blood_Bank_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Blood_Bank_Management.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blood_Bank_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Blood_Bank_Management_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Blood_Bank_Management] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blood_Bank_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blood_Bank_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blood_Bank_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blood_Bank_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blood_Bank_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blood_Bank_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blood_Bank_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Blood_Bank_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blood_Bank_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blood_Bank_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blood_Bank_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Blood_Bank_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Blood_Bank_Management] SET QUERY_STORE = OFF
GO
USE [Blood_Bank_Management]
GO
/****** Object:  Table [dbo].[BloodDonors]    Script Date: 14/Dec/2020 1:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodDonors](
	[Username] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Donate_Serial] [int] IDENTITY(1,1) NOT NULL,
	[Blood_Group] [varchar](50) NOT NULL,
	[Last_Donate_Date] [date] NOT NULL,
 CONSTRAINT [PK_Blood_Donors] PRIMARY KEY CLUSTERED 
(
	[Donate_Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodStocks]    Script Date: 14/Dec/2020 1:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodStocks](
	[Blood_Group] [varchar](50) NOT NULL,
	[Stock] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Blood_Stock] PRIMARY KEY CLUSTERED 
(
	[Blood_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 14/Dec/2020 1:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Name] [varchar](50) NOT NULL,
	[Blood_Group] [varchar](50) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Profession] [varchar](50) NOT NULL,
	[Mobile_Number] [varchar](15) NOT NULL,
	[Gmail] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Profile_Picture] [image] NOT NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 14/Dec/2020 1:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Order_Serial] [int] IDENTITY(1,1) NOT NULL,
	[Order_Status] [varchar](50) NOT NULL,
	[Blood_Group] [varchar](50) NOT NULL,
	[Member_Status] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ServiceCharge] [int] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Order_Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/Dec/2020 1:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Status] [varchar](max) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodDonors]  WITH CHECK ADD  CONSTRAINT [FK_BloodDonors_Members] FOREIGN KEY([Username])
REFERENCES [dbo].[Members] ([Username])
GO
ALTER TABLE [dbo].[BloodDonors] CHECK CONSTRAINT [FK_BloodDonors_Members]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Members] FOREIGN KEY([Username])
REFERENCES [dbo].[Members] ([Username])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Members]
GO
USE [master]
GO
ALTER DATABASE [Blood_Bank_Management] SET  READ_WRITE 
GO
