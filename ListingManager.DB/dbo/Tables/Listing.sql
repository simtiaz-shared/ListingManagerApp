CREATE TABLE [dbo].[Listing] (
    [ListingId]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [AgentId]        BIGINT        NOT NULL,
    [ListingName]    VARCHAR (50)  NOT NULL,
    [ListingAddress] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Listing] PRIMARY KEY CLUSTERED ([ListingId] ASC),
    CONSTRAINT [FK_Listing_Agent] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[Agent] ([AgentId])
);

