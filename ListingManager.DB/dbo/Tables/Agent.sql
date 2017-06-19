CREATE TABLE [dbo].[Agent] (
    [AgentId]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [AgentName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED ([AgentId] ASC)
);

