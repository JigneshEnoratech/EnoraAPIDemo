USE [master]
GO
/****** Object:  Database [EnoraAPIDemo]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  User [dev]    Script Date: 9/14/2023 19:36:49 ******/
CREATE USER [dev] FOR LOGIN [dev] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AccountLicense]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[AccountType]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[ApplicationPermission]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[ClientAccount]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 9/14/2023 19:36:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[RolePermission]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[StartupConfig]    Script Date: 9/14/2023 19:36:49 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 9/14/2023 19:36:49 ******/
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
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (1, NULL, N'Item', N'AddItem', 1)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (2, NULL, N'Item', N'UpdateItem', 1)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (3, NULL, N'Item', N'GetItemById', 1)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (4, NULL, N'Item', N'GetItemList', 1)
GO
INSERT [dbo].[ApplicationPermission] ([Id], [Name], [ControllerName], [ActionName], [PermissionId]) VALUES (5, NULL, N'Item', N'GetAllItemList', 1)
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
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (9, N'string', 1, 0, 0, CAST(N'2023-09-13T06:14:43.837' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (10, N'string', 1, 1, 0, CAST(N'2023-09-13T13:34:58.740' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (11, N'string', 1, 1, 0, CAST(N'2023-09-13T13:37:26.060' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (12, N'string', 1, 0, 0, CAST(N'2023-09-14T08:47:19.233' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ItemMaster] ([ID], [ItemName], [IsActive], [IsDelete], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DeletedBy], [DeletedDate]) VALUES (13, N'string', 1, 0, 1, CAST(N'2023-09-14T09:43:25.823' AS DateTime), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
GO
INSERT [dbo].[Permission] ([Id], [PermissionName], [IsDeleted], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive]) VALUES (1, N'Item', 0, 1, CAST(N'2023-09-14T15:09:10.767' AS DateTime), NULL, NULL, 1)
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
/****** Object:  StoredProcedure [dbo].[sp_GetItemList]    Script Date: 9/14/2023 19:36:49 ******/
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
