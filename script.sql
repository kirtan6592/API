USE [master]
GO
/****** Object:  Database [Employee]    Script Date: 12/14/2018 12:11:25 PM ******/
CREATE DATABASE [Employee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\Employee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\Employee_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Employee] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Employee] SET  MULTI_USER 
GO
ALTER DATABASE [Employee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Employee] SET QUERY_STORE = OFF
GO
USE [Employee]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Employee]
GO
/****** Object:  Table [dbo].[budgets]    Script Date: 12/14/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[budgets](
	[dept] [tinyint] NULL,
	[current_year] [decimal](10, 2) NULL,
	[previous_year] [decimal](10, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/14/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [nvarchar](5) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Company] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonDetails]    Script Date: 12/14/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonDetails](
	[PersonID] [nvarchar](5) NULL,
	[Address] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 12/14/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Mobile] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[budgets] ([dept], [current_year], [previous_year]) VALUES (1, CAST(100000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[budgets] ([dept], [current_year], [previous_year]) VALUES (2, NULL, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[budgets] ([dept], [current_year], [previous_year]) VALUES (3, CAST(0.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[budgets] ([dept], [current_year], [previous_year]) VALUES (4, NULL, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[budgets] ([dept], [current_year], [previous_year]) VALUES (5, CAST(300000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[Person] ([PersonID], [FirstName], [Company]) VALUES (N'Rupag', N'Rupali', N'Pearl Solutions')
INSERT [dbo].[Person] ([PersonID], [FirstName], [Company]) VALUES (N'test1', N'fname 1', NULL)
INSERT [dbo].[Person] ([PersonID], [FirstName], [Company]) VALUES (N'Vidvr', N'Vidya Vrat', N'Lionbridge Inc')
INSERT [dbo].[PersonDetails] ([PersonID], [Address]) VALUES (N'Vidvr', N'Bellevue WA 98007')
INSERT [dbo].[PersonDetails] ([PersonID], [Address]) VALUES (N'Rupag', N'Bellevue WA 98007')
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (1, N'Test 1', N'xyz', N'test@gmail.com', N'3/t, twin tower, USA', N'1234567890')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (3, N'test 2 update', N'test 2 lastname', N'test.email@gmail.com', N'1/O, Highe street, USA', N'123456789')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (6, N'test 3', N'test 3 ', N'test@gmail.com', N'test 3', N'1234567890')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (7, N'UT Firstname 7', N'UT Lastname 7', N'UT7@gmail.com', N'UT/7 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (8, N'UT Firstname 8', N'UT Lastname 8', N'UT8@gmail.com', N'UT/8 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (9, N'UT Firstname 9', N'UT Lastname 9', N'UT9@gmail.com', N'UT/9 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (10, N'UT Firstname 10', N'UT Lastname 10', N'UT10@gmail.com', N'UT/10 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (11, N'UT Firstname 11', N'UT Lastname 11', N'UT11@gmail.com', N'UT/11 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (12, N'UT Firstname 12', N'UT Lastname 12', N'UT12@gmail.com', N'UT/12 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (13, N'UT Firstname 13', N'UT Lastname 13', N'UT13@gmail.com', N'UT/13 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (14, N'UT Firstname 14', N'UT Lastname 14', N'UT14@gmail.com', N'UT/14 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (15, N'UT Firstname 15', N'UT Lastname 15', N'UT15@gmail.com', N'UT/15 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (16, N'UT Firstname 16', N'UT Lastname 16', N'UT16@gmail.com', N'UT/16 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (17, N'UT Firstname 17', N'UT Lastname 17', N'UT17@gmail.com', N'UT/17 Broad way, NJ,USA', N'1023456')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (19731, N'test httpheader', N't', N'test@gmail.com', N'test httpheader', N'1234')
INSERT [dbo].[tblEmployee] ([Id], [FirstName], [LastName], [Email], [Address], [Mobile]) VALUES (19732, N'zz', N'zz', N'test@gmail.com', N'zz', N'1223')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
ALTER TABLE [dbo].[PersonDetails]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
/****** Object:  StoredProcedure [dbo].[Sample_Procedure]    Script Date: 12/14/2018 12:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sample_Procedure] 
    @personId nvarchar(10),
    @firstName nvarchar(20),
	@company nvarchar(20)
AS
BEGIN
	DECLARE @errorCount int

	BEGIN TRANSACTION T1
    Insert into Person values (@personId,@firstName ,@company)

	set @errorCount = @@ERROR

	PRINT @errorCount

	IF @errorCount <> 0
		BEGIN ROLLBACK
			PRINT 'T1 is rollback'
		END
	ELSE
		BEGIN COMMIT
			PRINT 'T1 is commit'
		END
END

GO
USE [master]
GO
ALTER DATABASE [Employee] SET  READ_WRITE 
GO
