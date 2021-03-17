CREATE TABLE [dbo].[campsites] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [name]       VARCHAR (3)  NOT NULL,
    [location]   VARCHAR (10) NOT NULL,
    [max_guests] INT          NOT NULL,
    CONSTRAINT [PK_campsites] PRIMARY KEY CLUSTERED ([Id] ASC)
);

