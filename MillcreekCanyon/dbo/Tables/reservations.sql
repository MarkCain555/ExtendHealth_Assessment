CREATE TABLE [dbo].[reservations] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [date_in]          DATE          NOT NULL,
    [date_out]         DATE          NOT NULL,
    [made_by]          VARCHAR (100) NOT NULL,
    [reserved_by]      VARCHAR (100) NOT NULL,
    [campsite_id]      INT           NOT NULL,
    [number_of_guests] INT           NOT NULL,
    CONSTRAINT [PK_reservations] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_reservations_campsites] FOREIGN KEY ([campsite_id]) REFERENCES [dbo].[campsites] ([Id])
);

