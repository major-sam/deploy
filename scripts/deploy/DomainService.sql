
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09.09.2021 15:56:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildDomains]    Script Date: 09.09.2021 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildDomains](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Address] [nvarchar](1024) NOT NULL,
	[ActivationDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[State] [tinyint] NOT NULL,
	[ParentDomainId] [int] NOT NULL,
 CONSTRAINT [PK_ChildDomains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationEmployees]    Script Date: 09.09.2021 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationEmployees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[SecondName] [nvarchar](32) NOT NULL,
	[MidName] [nvarchar](32) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[Phone] [nvarchar](32) NULL,
 CONSTRAINT [PK_NotificationEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentDomains]    Script Date: 09.09.2021 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentDomains](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Address] [nvarchar](1024) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ActivationDate] [datetime2](7) NOT NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_ParentDomains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210909125438_Initial', N'5.0.9')
GO
ALTER TABLE [dbo].[ChildDomains]  WITH CHECK ADD  CONSTRAINT [FK_ChildDomains_ParentDomains_ParentDomainId] FOREIGN KEY([ParentDomainId])
REFERENCES [dbo].[ParentDomains] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChildDomains] CHECK CONSTRAINT [FK_ChildDomains_ParentDomains_ParentDomainId]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ParentDomains_Address] ON [dbo].[ParentDomains]
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
