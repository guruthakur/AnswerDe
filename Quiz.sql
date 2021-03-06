USE [master]
GO
/****** Object:  Database [Quiz]    Script Date: 7/3/2017 6:34:46 PM ******/
CREATE DATABASE [Quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz', FILENAME = N'C:\Program Files\Microsoft SQL Server 2014\MSSQL12.SQL2014\MSSQL\DATA\Quiz.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server 2014\MSSQL12.SQL2014\MSSQL\DATA\Quiz_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quiz] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quiz] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Quiz] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Quiz]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OptionDetail]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionDetail](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptionQuestionId] [int] NULL,
	[OptionValue] [nvarchar](max) NULL,
	[IsCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionDetail]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionDetail](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[QUserId] [int] NULL,
	[QCategoryID] [int] NULL,
	[QuestionRef] [nvarchar](max) NULL,
	[QuestionCreated] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizDetail]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizDetail](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[QuizUserId] [int] NULL,
	[QuizStartDateTime] [datetime] NULL,
	[QuizEndDateTime] [datetime] NULL,
	[QuizCategoryId] [int] NULL,
	[QuizMarks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizLog]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[LQuizId] [int] NULL,
	[LQuestionId] [int] NULL,
	[LQuestionOption] [int] NULL,
	[IsCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 7/3/2017 6:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](150) NULL,
	[UserPassword] [nvarchar](150) NULL,
	[UserName] [nvarchar](200) NULL,
	[Contact] [nvarchar](15) NULL,
	[IsActive] [bit] NULL CONSTRAINT [UserDetail_IsActive]  DEFAULT ((1)),
	[UserCreated] [datetime] NULL DEFAULT (getutcdate()),
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

GO
INSERT [dbo].[UserDetail] ([UserId], [UserEmail], [UserPassword], [UserName], [Contact], [IsActive], [UserCreated]) VALUES (1, N'sd', N'sd', N'sd', N'sd', 1, CAST(N'2017-07-03 12:47:35.033' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserDeta__08638DF8F01F49DE]    Script Date: 7/3/2017 6:34:46 PM ******/
ALTER TABLE [dbo].[UserDetail] ADD UNIQUE NONCLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OptionDetail] ADD  DEFAULT ((0)) FOR [IsCorrect]
GO
ALTER TABLE [dbo].[QuestionDetail] ADD  DEFAULT (getutcdate()) FOR [QuestionCreated]
GO
ALTER TABLE [dbo].[QuestionDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[QuizDetail] ADD  DEFAULT (getutcdate()) FOR [QuizStartDateTime]
GO
ALTER TABLE [dbo].[QuizDetail] ADD  DEFAULT (NULL) FOR [QuizEndDateTime]
GO
ALTER TABLE [dbo].[QuizDetail] ADD  DEFAULT ((0)) FOR [QuizMarks]
GO
ALTER TABLE [dbo].[OptionDetail]  WITH CHECK ADD FOREIGN KEY([OptionQuestionId])
REFERENCES [dbo].[QuestionDetail] ([QuestionId])
GO
ALTER TABLE [dbo].[QuestionDetail]  WITH CHECK ADD FOREIGN KEY([QCategoryID])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[QuestionDetail]  WITH CHECK ADD FOREIGN KEY([QUserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD FOREIGN KEY([QuizCategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD FOREIGN KEY([QuizUserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[QuizLog]  WITH CHECK ADD FOREIGN KEY([LQuestionId])
REFERENCES [dbo].[QuestionDetail] ([QuestionId])
GO
ALTER TABLE [dbo].[QuizLog]  WITH CHECK ADD FOREIGN KEY([LQuestionOption])
REFERENCES [dbo].[OptionDetail] ([OptionId])
GO
ALTER TABLE [dbo].[QuizLog]  WITH CHECK ADD FOREIGN KEY([LQuizId])
REFERENCES [dbo].[QuizDetail] ([QuizId])
GO
USE [master]
GO
ALTER DATABASE [Quiz] SET  READ_WRITE 
GO
