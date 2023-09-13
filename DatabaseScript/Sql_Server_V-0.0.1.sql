USE [master]
GO
/****** Object:  Database [EnoraAPIDemo]    Script Date: 9/13/2023 11:08:17 ******/
CREATE DATABASE [EnoraAPIDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnoraAPIDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EnoraAPIDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnoraAPIDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EnoraAPIDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnoraAPIDemo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnoraAPIDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnoraAPIDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EnoraAPIDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnoraAPIDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnoraAPIDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnoraAPIDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnoraAPIDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnoraAPIDemo] SET  MULTI_USER 
GO
ALTER DATABASE [EnoraAPIDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnoraAPIDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnoraAPIDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnoraAPIDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnoraAPIDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnoraAPIDemo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EnoraAPIDemo] SET QUERY_STORE = OFF
GO
USE [EnoraAPIDemo]
GO
/****** Object:  User [dev]    Script Date: 9/13/2023 11:08:17 ******/
CREATE USER [dev] FOR LOGIN [dev] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AccountLicense]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountLicense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientAccountId] [int] NULL,
	[ActivationDate] [datetime] NULL,
	[Day] [int] NULL,
	[Week] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[ExpiryDate] [datetime] NULL,
	[EmailSchema] [nvarchar](200) NULL,
	[NoOfDay] [int] NULL,
	[NoOfEntity] [int] NULL,
	[NoOfUser] [int] NULL,
	[IsEnable] [bit] NULL,
	[IsExpire] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_AccountLicense] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccountTypeName] [nvarchar](100) NULL,
	[AccountTypeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationPermission]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationPermission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_ApplicationPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientAccount]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[CompanyDescription] [nvarchar](500) NULL,
	[AccountTypeId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsAccountActive] [bit] NOT NULL,
 CONSTRAINT [PK_AccountMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PermissionMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[PermissionId] [int] NULL,
	[IsPermission] [bit] NULL,
 CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StartupConfig]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StartupConfig](
	[Name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DBVersion] [nvarchar](50) NULL,
 CONSTRAINT [PK_StartupConfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientAccountId] [int] NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[Password] [varchar](200) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[ProfilePhoto] [varchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[Token] [nvarchar](500) NULL,
	[EDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[IsAccountActive] [bit] NOT NULL,
	[IsOwner] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[APIKey] [nvarchar](100) NULL,
	[ISAPIEnable] [bit] NULL,
	[IsTNCApproved] [bit] NULL,
	[ISReleaseCheck] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountLicense] ON 
GO
INSERT [dbo].[AccountLicense] ([Id], [ClientAccountId], [ActivationDate], [Day], [Week], [Month], [Year], [ExpiryDate], [EmailSchema], [NoOfDay], [NoOfEntity], [NoOfUser], [IsEnable], [IsExpire], [CreatedBy], [CreatedDate]) VALUES (1, 1, CAST(N'2020-09-24T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'9999-12-31T00:00:00.000' AS DateTime), N'@capritechnosys.com', NULL, 1000, 99, 1, 0, 1, CAST(N'2020-09-24T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[AccountLicense] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 
GO
INSERT [dbo].[AccountType] ([id], [AccountTypeName], [AccountTypeDescription]) VALUES (1, N'Default', N'Default Account Type')
GO
INSERT [dbo].[AccountType] ([id], [AccountTypeName], [AccountTypeDescription]) VALUES (2, N'Client', N'Client Acoount Type')
GO
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationPermission] ON 
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (1, NULL, N'Home', N'Index', 1)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (2, NULL, N'MyCompany', N'Index', 2)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (3, NULL, N'RSSFeed', N'Index', 4)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (4, NULL, N'RSSFeed', N'UpdateNewsFeed', 5)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (5, NULL, N'Entities', N'Index', 6)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (6, NULL, N'Entities', N'Add', 9)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (7, NULL, N'Entities', N'Update', 7)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (8, NULL, N'Entities', N'Delete', 8)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (9, NULL, N'Policy', N'List', 10)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (10, NULL, N'Policy', N'Add', 11)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (11, NULL, N'Policy', N'Update', 12)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (12, NULL, N'Policy', N'Delete', 13)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (13, NULL, N'Job', N'List', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (14, NULL, N'Job', N'Add', 15)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (15, NULL, N'Job', N'Update', 16)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (16, NULL, N'Job', N'Delete', 17)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (17, NULL, N'Job', N'CancelJob', 18)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (18, NULL, N'ClientAccount', N'AccountList', 19)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (19, NULL, N'ClientAccount', N'AddAccount', 20)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (20, NULL, N'ClientAccount', N'ResendLink', 21)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (21, NULL, N'UserAccount', N'UserList', 22)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (22, NULL, N'UserAccount', N'AddUser', 23)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (23, NULL, N'UserAccount', N'ResendLink', 24)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (24, NULL, N'ScanResult', N'Index', 25)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (25, NULL, N'ScanResult', N'ShowResult', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (26, NULL, N'ScanResult', N'DownloadResult', 27)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (27, NULL, N'Wordlist', N'Index', 28)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (28, NULL, N'Wordlist', N'SaveWordList', 29)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (29, NULL, N'Glossary', N'Index', 30)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (30, NULL, N'Scanner', N'List', 31)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (31, NULL, N'Scanner', N'Add', 32)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (32, NULL, N'Scanner', N'Update', 33)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (33, NULL, N'Scanner', N'Delete', 34)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (34, NULL, N'SMTPConfig', N'List', 35)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (35, NULL, N'SMTPConfig', N'Add', 36)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (36, NULL, N'SMTPConfig', N'Update', 37)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (37, NULL, N'SMTPConfig', N'Delete', 38)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (38, NULL, N'Home', N'DarCache', 39)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (39, NULL, N'Job', N'GetJobList', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (40, NULL, N'Job', N'DetailGrid', 16)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (41, NULL, N'SMTPConfig', N'GetList', 35)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (42, NULL, N'Policy', N'Grid', 10)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (43, NULL, N'Policy', N'DetailGrid', 11)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (44, NULL, N'Policy', N'DetailGrid', 12)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (45, NULL, N'Entities', N'GetAssetList', 6)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (46, NULL, N'Scanner', N'Grid', 31)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (47, NULL, N'UserAccount', N'GetUserList', 22)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (48, NULL, N'ClientAccount', N'GetCompanyList', 19)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (49, NULL, N'Wordlist', N'GetList', 28)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (50, NULL, N'ClientAccount', N'ActivateAccount', 40)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (51, NULL, N'UserAccount', N'ResetPassword', 41)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (52, NULL, N'UserAccount', N'ChangeUserRole', 42)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (53, NULL, N'Guide', N'Index', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (54, NULL, N'Guide', N'Entity', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (55, NULL, N'Guide', N'GetEntityMasterData', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (56, NULL, N'Guide', N'CheckJobNameExists', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (57, NULL, N'Entities', N'GetEntityMasterData', 9)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (58, NULL, N'Entities', N'GetEntityMasterData', 7)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (59, NULL, N'Guide', N'ModuleConfirmation', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (60, NULL, N'ClientAccount', N'UpdateAccountLicense', 44)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (61, NULL, N'ClientAccount', N'RenewAccountLicense', 45)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (62, NULL, N'Policy', N'ViewPolicy', 10)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (63, NULL, N'ClientAccount', N'ViewLicense', 46)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (64, NULL, N'Wordlist', N'GetWordList', 28)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (65, NULL, N'Wordlist', N'DeleteWordlist', 47)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (66, NULL, N'Wordlist', N'GetCheckDefaultTerms', 28)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (67, NULL, N'Guide', N'WordList', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (68, NULL, N'Guide', N'JobAdd', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (69, NULL, N'Guide', N'EntityAdd', 43)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (70, NULL, N'UserAccount', N'DeleteUser', 48)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (71, NULL, N'UserAccount', N'APIProfile', 49)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (72, NULL, N'UserAccount', N'GenrateAPIKey', 50)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (73, NULL, N'UserAccount', N'ResetAPI', 51)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (74, NULL, N'UserAccount', N'Enable_DisableAPI', 52)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (75, NULL, N'Job', N'GetAllJobs', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (76, NULL, N'Job', N'GetJobById', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (77, NULL, N'Job', N'GetJobNameById', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (78, NULL, N'DashBoardWidget', N'GetLatestResultOfEntityByModule', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (79, NULL, N'DashBoardWidget', N'getSubdomainSummary', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (80, NULL, N'DashBoardWidget', N'GetResultWhoIsDetails', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (81, NULL, N'DashBoardWidget', N'getCertificateSummary', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (82, NULL, N'DashBoardWidget', N'GetNewsFeedById', 4)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (83, NULL, N'TermsAndCondition', N'Index', 53)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (84, NULL, N'TermsAndCondition', N'ViewTermsAndCondition', 53)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (85, NULL, N'Job', N'GetJobDataById', 14)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (86, NULL, N'DashBoardWidget', N'GetExecutiveSummary', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (87, NULL, N'Job', N'CreateJob', 15)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (88, NULL, N'Job', N'GetCreateJobTemplate', 15)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (89, NULL, N'Job', N'GetJobStatus', 15)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (90, NULL, N'DashBoardWidget', N'GetCompanyDetail', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (91, NULL, N'DashBoardWidget', N'GetCompanyExecutiveSummary', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (92, NULL, N'ScanResults', N'GetCompanyArchiveAnalysis', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (93, NULL, N'ReleaseNote', N'ViewReleaseNotes', 54)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (94, NULL, N'Job', N'ViewJob', 54)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (95, NULL, N'Entities', N'ViewEntity', 6)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (96, NULL, N'DashBoardWidget', N'GetExecutiveResult2Summary', 26)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (97, NULL, N'DashBoardWidget', N'GetCompanyExecutiveResult2Summary', 26)
GO
SET IDENTITY_INSERT [dbo].[ApplicationPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientAccount] ON 
GO
INSERT [dbo].[ClientAccount] ([id], [CompanyName], [CompanyDescription], [AccountTypeId], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive], [IsAccountActive]) VALUES (1, N'Enora Tech Demo', N'Enora Tech Demo', 1, 0, 1, CAST(N'2020-05-04T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ClientAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (3, N'Item 1', 1, 1, 1, CAST(N'2023-09-11T08:33:02.323' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (4, N'Item 2', 1, 1, 1, CAST(N'2023-09-11T08:44:33.570' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (5, N'Item 3', 1, 0, 1, CAST(N'2023-09-11T09:48:10.363' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (6, N'Item 4', 1, 0, 0, CAST(N'2023-09-11T10:08:05.823' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (7, N'Item 5', 1, 0, 0, CAST(N'2023-09-11T10:11:57.723' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (8, N'Item 6', 1, 0, 0, CAST(N'2023-09-11T10:21:52.613' AS DateTime), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'View Dashboard', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'View MyCompany', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'Add Widget', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (4, N'View News', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (5, N'update NEws', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (6, N'View Entity', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (7, N'Update Entity', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (8, N'Delete Entity', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (9, N'Add Entity', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (10, N'View Policy', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (11, N'Add Policy', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (12, N'Update Policy', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (13, N'Delete Policy', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (14, N'View Job', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (15, N'Add Job', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (16, N'Update Job', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (17, N'Delete Job', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (18, N'Cancel Job', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (19, N'View Account', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (20, N'Add Account', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (21, N'Resend Account Varification', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (22, N'View User', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (23, N'Add User', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (24, N'Resend User Varification', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (25, N'View Scan Report', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (26, N'View Show Report', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (27, N'View Downlolad Report', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (28, N'View WordList', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (29, N'Edit WordList', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (30, N'View Glossary', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (31, N'View Scanner', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (32, N'Add Scanner', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (33, N'Update Scanner', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (34, N'Delete Scanner', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (35, N'View SMTP', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (36, N'Add SMTP', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (37, N'Update SMTP', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (38, N'Delete SMTP', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (39, N'View DarCache', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (40, N'Activate DeActive Client Account', 0, 1, CAST(N'2020-05-28T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (41, N'Reset User Password', 0, 1, CAST(N'2020-05-28T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (42, N'Change User Role', 0, 1, CAST(N'2020-05-28T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (43, N'Use Guided Investigation', 0, 1, CAST(N'2020-05-29T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (44, N'Update License', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (45, N'Renew License', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (46, N'View License', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (47, N'Delete Wordlist', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (48, N'Delete User', 0, 1, CAST(N'2020-05-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (49, N'API Profile', 0, 1, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (50, N'Generate API Key', 0, 1, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (51, N'Reset API Key', 0, 1, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (52, N'Enable\Disable API', 0, 1, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (53, N'Terms and Conditions', 0, 1, CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (54, N'ReleaseNote', 0, 1, CAST(N'2020-07-14T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
INSERT [dbo].[Role] ([Id], [RoleName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'SuperAdmin', 0, 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Role] ([Id], [RoleName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (2, N'Admin', 0, 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Role] ([Id], [RoleName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (3, N'Normal User', 0, 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[Role] ([Id], [RoleName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (4, N'ReadOnly User', 0, 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[RolePermission] ON 
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (4, 1, 4, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (5, 1, 5, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (6, 1, 6, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (7, 1, 7, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (8, 1, 8, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (9, 1, 9, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (10, 1, 10, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (11, 1, 11, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (12, 1, 12, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (13, 1, 13, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (14, 1, 14, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (15, 1, 15, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (16, 1, 16, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (17, 1, 17, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (18, 1, 18, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (19, 1, 19, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (20, 1, 20, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (21, 1, 21, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (22, 1, 22, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (23, 1, 23, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (24, 1, 24, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (25, 1, 25, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (26, 1, 26, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (27, 1, 27, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (28, 1, 28, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (29, 1, 29, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (30, 1, 30, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (31, 1, 31, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (32, 1, 32, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (33, 1, 33, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (34, 1, 34, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (35, 1, 35, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (36, 1, 36, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (37, 1, 37, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (38, 1, 38, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (39, 2, 1, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (40, 2, 2, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (41, 2, 3, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (42, 2, 4, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (43, 2, 5, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (44, 2, 6, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (45, 2, 7, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (46, 2, 8, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (47, 2, 9, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (48, 2, 10, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (49, 2, 11, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (50, 2, 12, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (51, 2, 13, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (52, 2, 14, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (53, 2, 15, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (54, 2, 16, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (55, 2, 17, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (56, 2, 18, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (57, 2, 19, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (58, 2, 20, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (59, 2, 21, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (60, 2, 22, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (61, 2, 23, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (62, 2, 24, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (63, 2, 25, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (64, 2, 26, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (65, 2, 27, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (66, 2, 28, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (67, 2, 29, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (68, 2, 30, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (69, 2, 31, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (70, 2, 32, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (71, 2, 33, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (72, 2, 34, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (73, 2, 35, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (74, 2, 36, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (75, 2, 37, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (76, 2, 38, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (77, 3, 1, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (78, 3, 2, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (79, 3, 3, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (80, 3, 4, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (81, 3, 5, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (82, 3, 6, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (83, 3, 7, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (84, 3, 8, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (85, 3, 9, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (86, 3, 10, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (87, 3, 11, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (88, 3, 12, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (89, 3, 13, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (90, 3, 14, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (91, 3, 15, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (92, 3, 16, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (93, 3, 17, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (94, 3, 18, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (95, 3, 19, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (96, 3, 20, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (97, 3, 21, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (98, 3, 22, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (99, 3, 23, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (100, 3, 24, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (101, 3, 25, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (102, 3, 26, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (103, 3, 27, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (104, 3, 28, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (105, 3, 29, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (106, 3, 30, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (107, 3, 31, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (108, 3, 32, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (109, 3, 33, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (110, 3, 34, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (111, 3, 35, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (112, 3, 36, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (113, 3, 37, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (114, 3, 38, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (115, 4, 1, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (116, 4, 2, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (117, 4, 3, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (118, 4, 4, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (119, 4, 5, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (120, 4, 6, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (121, 4, 7, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (122, 4, 8, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (123, 4, 9, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (124, 4, 10, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (125, 4, 11, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (126, 4, 12, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (127, 4, 13, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (128, 4, 14, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (129, 4, 15, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (130, 4, 16, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (131, 4, 17, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (132, 4, 18, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (133, 4, 19, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (134, 4, 20, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (135, 4, 21, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (136, 4, 22, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (137, 4, 23, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (138, 4, 24, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (139, 4, 25, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (140, 4, 26, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (141, 4, 27, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (142, 4, 28, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (143, 4, 29, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (144, 4, 30, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (145, 4, 31, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (146, 4, 32, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (147, 4, 33, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (148, 4, 34, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (149, 4, 35, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (150, 4, 36, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (151, 4, 37, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (152, 4, 38, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (153, 1, 39, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (154, 2, 39, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (155, 3, 39, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (156, 4, 39, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (157, 1, 40, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (158, 1, 41, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (159, 1, 42, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (160, 2, 40, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (161, 2, 41, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (162, 2, 42, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (163, 3, 40, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (164, 3, 41, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (165, 3, 42, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (166, 4, 40, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (167, 4, 41, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (168, 4, 42, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (169, 1, 43, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (170, 2, 43, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (171, 3, 43, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (172, 4, 43, 0)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (173, 1, 44, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (174, 1, 45, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (175, 1, 46, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (176, 2, 46, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (177, 3, 46, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (178, 1, 47, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (179, 1, 48, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (180, 2, 48, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (181, 1, 49, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (182, 1, 50, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (183, 1, 51, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (184, 1, 52, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (185, 2, 49, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (186, 2, 50, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (187, 2, 51, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (188, 2, 52, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (189, 3, 49, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (190, 3, 50, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (191, 3, 51, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (192, 3, 52, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (193, 4, 49, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (194, 4, 50, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (195, 4, 51, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (196, 4, 52, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (197, 1, 53, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (198, 2, 53, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (199, 3, 53, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (200, 4, 53, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (201, 1, 54, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (202, 2, 54, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (203, 3, 54, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (204, 4, 54, 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [PermissionId], [IsPermission]) VALUES (205, 2, 47, 1)
GO
SET IDENTITY_INSERT [dbo].[RolePermission] OFF
GO
SET IDENTITY_INSERT [dbo].[StartupConfig] ON 
GO
INSERT [dbo].[StartupConfig] ([Name], [id], [DBVersion]) VALUES (N'http://localhost/', 1, N'1.20')
GO
SET IDENTITY_INSERT [dbo].[StartupConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [ClientAccountId], [UserId], [Password], [FirstName], [LastName], [ProfilePhoto], [RoleId], [Token], [EDate], [CreatedBy], [CreatedOn], [IsAccountActive], [IsOwner], [IsDeleted], [IsActive], [APIKey], [ISAPIEnable], [IsTNCApproved], [ISReleaseCheck]) VALUES (1, 1, N'Enora@yopmail.com', N'/G6I3UEy8JMxpXxqzO5W8S03zLtevbIuTV60rKpMfGs04WRMPre+nRqlu0DnTrsYwF0AAA==', N'John', N'doe', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [ISReleaseCheck]
GO
ALTER TABLE [dbo].[ApplicationPermission]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationPermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[ApplicationPermission] CHECK CONSTRAINT [FK_ApplicationPermission_Permission]
GO
ALTER TABLE [dbo].[ClientAccount]  WITH CHECK ADD  CONSTRAINT [FK_AccountMaster_AccountType] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([id])
GO
ALTER TABLE [dbo].[ClientAccount] CHECK CONSTRAINT [FK_AccountMaster_AccountType]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Permission]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Role]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetItemList]    Script Date: 9/13/2023 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_GetItemList] @start int,@length int,@searchValue nvarchar(200) = NULL ,@totalCount int out
AS   

    SET NOCOUNT ON;  
	

	IF (@searchValue Is Null OR @searchValue='')
	SET @searchValue='%' 
	ELSE 
	SET @searchValue='%' + @searchValue +'%'
SELECT * INTO #SelectItemData
	  FROM (SELECT A.[ID]
      ,ItemName
	  ,IsActive
	  ,IsDelete
      ,CreatedDate
	  ,CreatedBy
  FROM [dbo].[ItemMaster] AS A  
 
  Where A.IsDelete=0 and A.isactive=1) as EntityData
	
	IF @searchValue!='%'
					BEGIN
								SELECT * FROM  #SelectItemData WHERE #SelectItemData.ItemName LIKE @searchValue  ORDER BY #SelectItemData.ItemName ASC   OFFSET @start ROWS FETCH NEXT @length ROWS ONLY;
								set @totalCount=(SELECT COUNT(*) FROM  #SelectItemData WHERE #SelectItemData.ItemName LIKE @searchValue );
					END
					ELSE
					BEGIN 
								SELECT * FROM  #SelectItemData ORDER BY #SelectItemData.ItemName ASC OFFSET @start ROWS FETCH NEXT @length ROWS ONLY;
								set @totalCount=(SELECT COUNT(*) FROM  #SelectItemData);
					END
	drop table #SelectItemData
GO
USE [master]
GO
ALTER DATABASE [EnoraAPIDemo] SET  READ_WRITE 
GO
