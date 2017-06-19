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
