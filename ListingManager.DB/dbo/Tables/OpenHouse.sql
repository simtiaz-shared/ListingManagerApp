CREATE TABLE [dbo].[OpenHouse] (
    [OpenHouseId]        BIGINT   IDENTITY (1, 1) NOT NULL,
    [ListingId]          BIGINT   NOT NULL,
    [OpenHouseBeginDate] DATETIME NOT NULL,
    [OpenHouseEndDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_OpenHouse] PRIMARY KEY CLUSTERED ([OpenHouseId] ASC),
    CONSTRAINT [FK_OpenHouse_Listing] FOREIGN KEY ([ListingId]) REFERENCES [dbo].[Listing] ([ListingId])
);

