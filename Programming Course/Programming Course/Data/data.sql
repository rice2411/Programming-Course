USE [RiceCodeGym]
GO
/****** Object:  User [rice2411_SQLLogin_1]    Script Date: 7/16/2020 7:53:24 PM ******/
CREATE USER [rice2411_SQLLogin_1] FOR LOGIN [rice2411_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [rice2411_SQLLogin_1]
GO
/****** Object:  Schema [rice2411_SQLLogin_1]    Script Date: 7/16/2020 7:53:24 PM ******/
CREATE SCHEMA [rice2411_SQLLogin_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/16/2020 7:53:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[billId] [nvarchar](450) NOT NULL,
	[couresId] [nvarchar](450) NULL,
	[employeeId] [nvarchar](450) NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
	[customerAddress] [nvarchar](max) NULL,
	[customerName] [nvarchar](max) NULL,
	[customerPhoneNumber] [nvarchar](max) NULL,
	[couresName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[cartId] [nvarchar](450) NOT NULL,
	[courseImage] [nvarchar](max) NULL,
	[courseName] [nvarchar](max) NULL,
	[coursePrice] [nvarchar](max) NULL,
	[user] [nvarchar](max) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseId] [nvarchar](450) NOT NULL,
	[image] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[price] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](1) NULL,
	[street] [varchar](1) NULL,
	[city] [varchar](1) NULL,
	[state] [varchar](1) NULL,
	[credit_limit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/16/2020 7:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employeeId] [nvarchar](450) NOT NULL,
	[name] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
	[department] [int] NOT NULL,
	[email] [nvarchar](max) NULL,
	[role] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702031938_CreateDB', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200703035604_UpdateTableEmployee', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200703092346_UpdateColumnRole', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200704032139_UpdateBillTable', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200704032753_RemoveEmployeeColoumn', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200704082712_UpdateBillTable', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200704092854_AddColoumn', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200709042726_UpdateDB', N'3.1.5')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2d48126c-85d8-48c4-b69e-fbf8e11ff968', N'System Admin', N'SYSTEM ADMIN', N'a94b09ca-f700-4821-96bd-2f6639bd5cb0')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'32acf5c2-8266-45e3-a535-c61b20c4df43', N'Sale', N'SALE', N'5fefdd2a-3a53-4355-9eb8-5c60f0da0c33')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5d478412-cf35-4a98-acca-d854cd78195a', N'Admin', N'ADMIN', N'f6ec0f63-14ca-469e-b673-02e7c6a446b1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5c8f21bb-2435-400e-89f8-dc35bb078bb5', N'32acf5c2-8266-45e3-a535-c61b20c4df43')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'931834b4-4ea0-482f-93ef-338b76a0d387', N'5d478412-cf35-4a98-acca-d854cd78195a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a12c267a-e544-461a-9941-b47a9ebe8805', N'2d48126c-85d8-48c4-b69e-fbf8e11ff968')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'050ce18e-cc16-4fa2-91fb-2821ffdced32', N'user123', N'USER123', N'pentappingminh@gmail.com', N'PENTAPPINGMINH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJAWY+SgOXsr7jyOXuBfYJw2UEcorNGnz7uewdNnJDoKlj+cEI0RXLLfBepmQ4ibEw==', N'PDRD4OGTDVFNYXAPZWNTRN4MHAVMFMYE', N'70103276-5ecd-4ace-9e39-7168d3b94f3e', N'1234567', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5c8f21bb-2435-400e-89f8-dc35bb078bb5', N'rice24', N'RICE24', N'nhattrang@gmail.com', N'NHATTRANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDk0SDc93U6PTDOG++q5QbhD6GOoZYr4JaFCUbbdUNk4bMxPdVWl12YExGKVfKn40g==', N'NGWYAJ46XWDY5PFOS47BRG6JR7477TWH', N'158838d4-a03e-4856-9ca1-995d7db65a34', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70ed8509-446f-445a-aa99-3b15b50f9e99', N'khoa.nguyen@codegym.vn', N'KHOA.NGUYEN@CODEGYM.VN', N'khoa.nguyen@codegym.vn', N'KHOA.NGUYEN@CODEGYM.VN', 0, N'AQAAAAEAACcQAAAAEAmEEe8S0103Jqn2dGkVq09NP/llQr0ueapZVKdTxTsQvXAlhnHq9FEkUGiPLeuffg==', N'KFAIHUVZ3SE6FABTVAW4EQCRZMX4HEZ6', N'9a20146a-70ff-412d-8b76-11f29a4cb923', N'34534', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'931834b4-4ea0-482f-93ef-338b76a0d387', N'rice241', N'RICE241', N'trang.ho@codegym.vn', N'TRANG.HO@CODEGYM.VN', 0, N'AQAAAAEAACcQAAAAEGqDrm3ilD3LoIZewe38V/CYGySoKjsBBoa6EDsBRWNeO6EJ1V8NA3wbfz2bU2LqAA==', N'EMFVYVW7RTWUY3R4CLP2LIFTNCFCSILQ', N'b3739a55-6f18-4dd1-8b0e-0cfe1798613c', N'1231312312', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a12c267a-e544-461a-9941-b47a9ebe8805', N'rice2411', N'RICE2411', N'tonthatanhminhktpm@gmail.com', N'TONTHATANHMINHKTPM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMlFJ2ayTO84VVL3aVQ/CoDWIAGMsAe9udBiEeRGQixmSkftWkaYS0Bdvpr5pONrqA==', N'X6TY3RUYE7IVO2OI7JN7IWNUXDAH5R3A', N'dc3b109f-0089-479d-bb1c-ac1fcacfed03', N'0123456789', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a1b3273a-92cd-46d9-89ab-8b0df7b727af', N'rice', N'RICE', N'nhattrang@gmail.com', N'NHATTRANG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECosjZNJzz0zZZN3VWUYOHh4cdvWqcR84Q56Cjfna1Fk8YIFtZtK+Ka0e94ndBTx2g==', N'HQNJU7TXXEFZTSC7NADHGDCGZXEYVBSU', N'a2fe5728-4ba5-4376-9009-402641ae4a35', N'rice2411', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'14da970b-f927-420a-a2df-08139b7e4315', N'C02', NULL, NULL, NULL, NULL, NULL, N'PHP')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'196c4237-a409-4f2f-8af0-183887811ce5', N'C04', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'PYTHON')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'3995a0f1-8af6-40be-84f8-2d0dc8942646', N'C03', NULL, NULL, N'28 NTP', N'Khoa Nguyen', N'948659846', N'.NET')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'74a92058-9cc9-4797-b722-4fc5648a2803', N'C03', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'.NET')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'7c5bb3f5-623e-4b83-a741-239c0dd57ceb', N'C03', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'.NET')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'c417b1ae-3232-4d6f-9191-59f0d8fca06a', N'C04', NULL, NULL, N'28 nguyen tri phuong', N'Nguyen quang', N'123456789', N'PYTHON')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'c6c25bdb-294a-4eea-bcfa-83e262cc4bc1', N'C03', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'.NET')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'ca114281-a61b-48b4-a3d8-63062ad7590d', N'C04', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'PYTHON')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'db4886ef-4a77-49df-95d0-11cdf153a16b', N'C06', NULL, NULL, N'28 nguyen tri phuong', N'Nguyen quang', N'1234567', N'RUBY')
INSERT [dbo].[Bills] ([billId], [couresId], [employeeId], [ApplicationUserId], [customerAddress], [customerName], [customerPhoneNumber], [couresName]) VALUES (N'f290a48f-80aa-41c6-a3be-d2c3083a2f31', N'C02', NULL, NULL, N'ajsdas', N'minh', N'1231231asd', N'PHP')
GO
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'4e22c0aa-e4c9-43f8-9f05-947affd533fa', N'957ad107-d050-4206-9ac8-7df5cbdac74d_logoRuby.webp', N'RUBY', N'100000000', N'rice')
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'58a0cb64-d7e0-4e71-8157-a6f9d5971d4e', N'php.png', N'PHP', N'28000000', N'rice241')
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'7827bbe6-5a06-4cf3-a64c-7fb8017a3dc5', N'python.png', N'PYTHON', N'100000', NULL)
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'78b9bd35-fe28-4c68-b8a4-e46997e07cdb', N'dotnet.png', NULL, NULL, N'rice2411')
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'bd9f305c-52bb-421b-9d41-362f2c418e1a', N'dotnet.png', N'.NET', N'28000000', NULL)
INSERT [dbo].[Carts] ([cartId], [courseImage], [courseName], [coursePrice], [user]) VALUES (N'c07443c3-6d1a-462d-9a13-f0829a391b09', N'dotnet.png', N'.NET', N'28000000', N'rice2411')
GO
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C01', N'81db9e34-79a9-4549-8a7f-0dc59b056050_java.jpg', N'JAVA', 28000000, N'Chương trình CGC Java giúp học viên làm chủ các kiến thức lập trình nói chung và Java web nói riêng. Hoàn thành khoá học học viên có đủ năng lực của một lập trình viên chuyên nghiệp, có thể tham gia trực tiếp vào các dự án phần mềm tại doanh nghiệp hoặc tự mình xây dựng các ứng dụng phục vụ cho các mục đích khác nhau')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C02', N'php.png', N'PHP', 28000000, N'Khóa học CGC PHP giúp học viên làm chủ các kiến thức lập trình nói chung và ngôn ngữ lập trình PHP nói riêng. Hoàn thành khoá học học viên có đủ năng lực của một lập trình viên chuyên nghiệp, có thể tham gia trực tiếp vào các dự án phần mềm tại doanh nghiệp hoặc tự mình xây dựng các website và ứng dụng phục vụ cho các mục đích khác nhau.')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C03', N'dotnet.png', N'.NET', 28000000, N'Chương trình Bootcamp .NET giúp học viên làm chủ các kiến thức lập trình nói chung và ASP.NET Core web nói riêng. Hoàn thành khoá học học viên có đủ năng lực của một lập trình viên chuyên nghiệp, có thể tham gia trực tiếp vào các dự án phần mềm tại doanh nghiệp hoặc tự mình xây dựng các ứng dụng phục vụ cho các mục đích khác nhau.')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C04', N'python.png', N'PYTHON', 100000, N'Python là một ngôn ngữ lập trình mã nguồn mở đa mục đích, có hỗ trợ các phong cách lập trình cốt lõi khác nhau, mà triết lý thiết kế của nó rất thuận lợi cho việc đọc hiểu code, đơn giản và rõ ràng. Ở Việt Nam, Python có lẽ còn khá mới mẻ với ngôn ngữ lập trình này nhưng trên thế giới thì nó là ngôn ngữ được sử dụng nhiều nhất vượt qua cả JAVA, C++...')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C05', N'dddf24bd-3b7a-459d-989e-257ecb2ec4f2_the-c-programming-language-computer-icons-computer-programming-source-code-png-favpng-AjeAtPSwUPUTUpvix6NJaxQSx_t.jpg', N'C++', 10000000, N'C++ là một loại ngôn ngữ lập trình bậc trung. Đây là ngôn ngữ lập trình đa năng được tạo ra bởi Bjarne Stroustrup như một phần mở rộng của ngôn ngữ lập trình C, hoặc "C với các lớp Class", Ngôn ngữ đã được mở rộng đáng kể theo thời gian và C ++ hiện đại có các tính năng: lập trình tổng quát, lập trình hướng đối tượng, .')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C06', N'957ad107-d050-4206-9ac8-7df5cbdac74d_logoRuby.webp', N'RUBY', 100000000, N'Ruby là một ngôn ngữ lập trình hướng đối tượng, có khả năng phản ứng. Theo tác giả, Ruby chịu ảnh hưởng bởi Perl, Smalltalk, Eiffel, Ada và Lisp. Ruby là ngôn ngữ thông dịch và hướng đối tượng. Ruby cung cấp nhiều mẫu hình lập trình, bao gồm lập trình hàm, hướng đối tượng, mệnh lệnh, phản xạ')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C07', N'46bea3ac-5658-41dd-bf1d-59d66c21da54_python.png', N'PYTHON 2', 100000, N'Python là ngôn ngữ lập trình hướng đối tượng bậc cao, dùng để phát triển website và nhiều ứng dụng khác nhau. Với cú pháp cực kì đơn giản và thanh lịch, Python là lựa chọn hoàn hảo cho những ai lần đầu tiên học lập trình.')
INSERT [dbo].[Course] ([courseId], [image], [name], [price], [description]) VALUES (N'C08', N'56d6bf8f-a025-48dd-933f-5274945e829c_Microsoft_.NET_logo.png', N'.NET ADVANCED', 1000000, N'Chương trình Bootcamp .NET giúp học viên làm chủ các kiến thức lập trình nói chung và ASP.NET Core web nói riêng. Hoàn thành khoá học học viên có đủ năng lực của một lập trình viên chuyên nghiệp, có thể tham gia trực tiếp vào các dự án phần mềm tại doanh nghiệp hoặc tự mình xây dựng các ứng dụng phục vụ cho các mục đích khác nhau.')
GO
INSERT [dbo].[Employees] ([employeeId], [name], [avatar], [department], [email], [role]) VALUES (N'E01', N'Tôn Thất Anh Minh', N'emp1.png', 0, N'tonthatanhminhktpm@gmail.com', NULL)
INSERT [dbo].[Employees] ([employeeId], [name], [avatar], [department], [email], [role]) VALUES (N'E02', N'Tôn Thất Anh Minhh', N'8179087c-5beb-4a83-91d6-0d268e10f793_105643770_307184903657965_7306809731427712829_o.jpg', 1, N'nhi.nguyen@codegym.vn', NULL)
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Course_couresId] FOREIGN KEY([couresId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Course_couresId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Employees_employeeId] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([employeeId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Employees_employeeId]
GO
