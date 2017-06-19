﻿/*
Deployment script for test02

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "test02"
:setvar DefaultFilePrefix "test02"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Agent]...';


GO
CREATE TABLE [dbo].[Agent] (
    [AgentId]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [AgentName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED ([AgentId] ASC)
);


GO
PRINT N'Creating [dbo].[Listing]...';


GO
CREATE TABLE [dbo].[Listing] (
    [ListingId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [AgentId]        BIGINT        NOT NULL,
    [ListingName]    VARCHAR (50)  NOT NULL,
    [ListingAddress] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Listing] PRIMARY KEY CLUSTERED ([ListingId] ASC)
);


GO
PRINT N'Creating [dbo].[OpenHouse]...';


GO
CREATE TABLE [dbo].[OpenHouse] (
    [OpenHouseId]        BIGINT   IDENTITY (1, 1) NOT NULL,
    [ListingId]          BIGINT   NOT NULL,
    [OpenHouseBeginDate] DATETIME NOT NULL,
    [OpenHouseEndDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_OpenHouse] PRIMARY KEY CLUSTERED ([OpenHouseId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Listing_Agent]...';


GO
ALTER TABLE [dbo].[Listing]
    ADD CONSTRAINT [FK_Listing_Agent] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[Agent] ([AgentId]);


GO
PRINT N'Creating [dbo].[FK_OpenHouse_Listing]...';


GO
ALTER TABLE [dbo].[OpenHouse]
    ADD CONSTRAINT [FK_OpenHouse_Listing] FOREIGN KEY ([ListingId]) REFERENCES [dbo].[Listing] ([ListingId]);


GO
PRINT N'Creating [dbo].[sp_GetListingByID]...';


GO
CREATE PROCEDURE [dbo].[sp_GetListingByID]
	@ListingId int = 0
AS
	SELECT	a.AgentId
			,a.AgentName
			,l.ListingId
			,l.ListingName
			,l.ListingAddress
			,o.OpenHouseId
			,o.OpenHouseBeginDate
			,o.OpenHouseEndDate
	FROM	Agent a (nolock)
	JOIN	Listing l (nolock) on l.AgentId = a.AgentId 
	JOIN	OpenHouse o (nolock) on o.ListingId = l.ListingId
	WHERE	l.ListingId = @ListingId
	ORDER BY l.ListingId, o.OpenHouseId
GO
PRINT N'Creating [dbo].[sp_GetListings]...';


GO
CREATE PROCEDURE [dbo].[sp_GetListings]
AS
	SELECT	a.AgentId
			,a.AgentName
			,l.ListingId
			,l.ListingName
			,l.ListingAddress
			,o.OpenHouseId
			,o.OpenHouseBeginDate
			,o.OpenHouseEndDate
	FROM	Agent a (nolock)
	JOIN	Listing l (nolock) on l.AgentId = a.AgentId 
	JOIN	OpenHouse o (nolock) on o.ListingId = l.ListingId
	ORDER BY l.ListingId, o.OpenHouseId
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (1, N'Mike Miller')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (2, N'Chris Tucker')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (3, N'John Smith')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (4, N'Grace Johnson')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (5, N'Heather Gibb')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (6, N'James Miller')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (7, N'Ben Caplan')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (8, N'Chad Hardeman')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (9, N'Keith White')
INSERT [dbo].[Agent] ([AgentId], [AgentName]) VALUES (10, N'Mark Puetz')
SET IDENTITY_INSERT [dbo].[Agent] OFF

GO
SET IDENTITY_INSERT [dbo].[Listing] ON 

INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (1, 1, N'LST_FlowerCourt', N'31 Flower Court, Irvine 92612')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (2, 1, N'LST_MintDrive', N'42 Mint Drive, Tustin 92780')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (3, 1, N'LST_ChulaVista', N'51 Chula Vista, Irvine 92616')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (4, 1, N'LST_MapleDrive', N'1030 Maple Drive, Tustin 92780')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (5, 2, N'LST_OrangeBlossom', N'58 Orange Blossom Way, Irvine 92618')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (6, 2, N'LST_OakHill', N'41 Oak Hill Lane, Tustin 92780')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (7, 2, N'LST_FreshSpring', N'48 Fresh Spring Ave, Irvine 92620')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (8, 2, N'LST_Orchard', N'91 Orchard, Irvine 92618')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (9, 2, N'LST_SantaBarbara', N'103 Santa Barbara, Irvine 92606')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (10, 3, N'LST_BlueMountain', N'263 Blue Mountain Lake, Lake Forest 92630')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (11, 3, N'LST_LakeView', N'52 Lake View Dr, Lake Forest 92630')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (12, 3, N'LST_LavenderCourt', N'52 Lavender Court, Lake Forest 92630')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (13, 4, N'LST_CrystalCove', N'97 Crystal Cove, Newport Beach 92660')
INSERT [dbo].[Listing] ([ListingId], [AgentId], [ListingName], [ListingAddress]) VALUES (14, 4, N'LST_BlackBerry', N'24 Black Berry Lane, Yorba Linda 92886')
SET IDENTITY_INSERT [dbo].[Listing] OFF

GO
SET IDENTITY_INSERT [dbo].[OpenHouse] ON 

INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (1, 1, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (2, 1, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (3, 1, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (4, 2, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (5, 2, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (6, 3, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (7, 3, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (8, 3, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (9, 3, CAST(N'2017-06-09T13:00:00.000' AS DateTime), CAST(N'2017-06-09T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (10, 4, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (11, 4, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (12, 4, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (13, 5, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (14, 5, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (15, 6, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (16, 6, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (17, 6, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (18, 6, CAST(N'2017-06-09T13:00:00.000' AS DateTime), CAST(N'2017-06-09T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (19, 7, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (20, 7, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (21, 7, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (22, 8, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (23, 8, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (24, 9, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (25, 9, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (26, 9, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (27, 9, CAST(N'2017-06-09T13:00:00.000' AS DateTime), CAST(N'2017-06-09T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (28, 10, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (29, 10, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (30, 10, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (31, 11, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (32, 11, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (33, 12, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (34, 12, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (35, 12, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (36, 12, CAST(N'2017-06-09T13:00:00.000' AS DateTime), CAST(N'2017-06-09T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (37, 13, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (38, 13, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (39, 13, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (40, 13, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (41, 13, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (42, 13, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (43, 13, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (44, 13, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (45, 14, CAST(N'2017-06-01T13:00:00.000' AS DateTime), CAST(N'2017-06-01T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (46, 14, CAST(N'2017-06-02T13:00:00.000' AS DateTime), CAST(N'2017-06-02T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (47, 14, CAST(N'2017-06-03T13:00:00.000' AS DateTime), CAST(N'2017-06-03T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (48, 14, CAST(N'2017-06-04T13:00:00.000' AS DateTime), CAST(N'2017-06-04T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (49, 14, CAST(N'2017-06-05T13:00:00.000' AS DateTime), CAST(N'2017-06-05T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (50, 14, CAST(N'2017-06-06T13:00:00.000' AS DateTime), CAST(N'2017-06-06T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (51, 14, CAST(N'2017-06-07T13:00:00.000' AS DateTime), CAST(N'2017-06-07T16:00:00.000' AS DateTime))
INSERT [dbo].[OpenHouse] ([OpenHouseId], [ListingId], [OpenHouseBeginDate], [OpenHouseEndDate]) VALUES (52, 14, CAST(N'2017-06-08T13:00:00.000' AS DateTime), CAST(N'2017-06-08T16:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OpenHouse] OFF

GO

print 'Import Data Completed...'
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO