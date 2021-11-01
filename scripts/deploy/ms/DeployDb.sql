GO
PRINT N'Creating Schema [mkt]...';
if schema_id('mkt') is null
begin
  execute('create schema mkt')

  print 'Создана схема mkt'
end

GO
PRINT N'Creating Schema [qst]...';
if schema_id('qst') is null
begin
  execute('create schema qst')

  print 'Создана схема qst'
end


GO
PRINT N'Creating Table [mkt].[UserQuests]...';


GO
CREATE TABLE [mkt].[UserQuests] (
    [Id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [StateUpdatedUtc]    DATETIME2 (7) NOT NULL,
    [ProgressUpdatedUtc] DATETIME2 (7) NOT NULL,
    [UserId]             BIGINT        NOT NULL,
    [QuestId]            BIGINT        NOT NULL,
    [Progress]           INT           NOT NULL,
    [State]              INT           NOT NULL,
    [PersistedVersion]   ROWVERSION    NULL,
    [CreatedUtc]         DATETIME2 (7) NOT NULL,
    [Created]            DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserQuests] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserQuests].[IX_UserQuests_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserQuests_UserId]
    ON [mkt].[UserQuests]([UserId] ASC);


GO
PRINT N'Creating Index [mkt].[UserQuests].[IX_UserQuests_QuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserQuests_QuestId]
    ON [mkt].[UserQuests]([QuestId] ASC);


GO
PRINT N'Creating Table [mkt].[UserLinks]...';


GO
CREATE TABLE [mkt].[UserLinks] (
    [Id]               BIGINT        NOT NULL,
    [UserId]           BIGINT        NULL,
    [UserLinkType]     INT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserLinks] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserLinks].[IX_UserLinks_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserLinks_UserId]
    ON [mkt].[UserLinks]([UserId] ASC);


GO
PRINT N'Creating Table [mkt].[Quests]...';


GO
CREATE TABLE [mkt].[Quests] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Cell]             INT            NOT NULL,
    [Date]             DATE           NULL,
    [OrderInCell]      INT            NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [Comment]          NVARCHAR (250) NOT NULL,
    [PrizeComment]     NVARCHAR (250) NOT NULL,
    [QuestTypeId]      BIGINT         NOT NULL,
    [DoAfterQuestId]   BIGINT         NULL,
    [ProgressTarget]   INT            NOT NULL,
    [PrizeId]          BIGINT         NULL,
    [GamePoints]       INT            NOT NULL,
    [PrizePoints]      INT            NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Quests] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Quests].[IX_Quests_DoAfterQuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Quests_DoAfterQuestId]
    ON [mkt].[Quests]([DoAfterQuestId] ASC);


GO
PRINT N'Creating Index [mkt].[Quests].[IX_Quests_Cell_Date_OrderInCell]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Quests_Cell_Date_OrderInCell]
    ON [mkt].[Quests]([Cell] ASC, [Date] ASC, [OrderInCell] ASC) WHERE ([Date] IS NOT NULL AND [OrderInCell] IS NOT NULL);


GO
PRINT N'Creating Index [mkt].[Quests].[IX_Quests_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Quests_PrizeId]
    ON [mkt].[Quests]([PrizeId] ASC);


GO
PRINT N'Creating Table [mkt].[PrizeScales]...';


GO
CREATE TABLE [mkt].[PrizeScales] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (200) NULL,
    [Points]           INT            NOT NULL,
    [ImageId]          BIGINT         NOT NULL,
    [ImageActiveId]    BIGINT         NOT NULL,
    [HandOutDate]      DATETIME2 (7)  NULL,
    [PrizeId]          BIGINT         NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_PrizeScales] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[PrizeScales].[IX_PrizeScales_ImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_ImageId]
    ON [mkt].[PrizeScales]([ImageId] ASC);


GO
PRINT N'Creating Index [mkt].[PrizeScales].[IX_PrizeScales_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_PrizeId]
    ON [mkt].[PrizeScales]([PrizeId] ASC);


GO
PRINT N'Creating Index [mkt].[PrizeScales].[IX_PrizeScales_ImageActiveId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_ImageActiveId]
    ON [mkt].[PrizeScales]([ImageActiveId] ASC);


GO
PRINT N'Creating Table [mkt].[UserForecastCoefs]...';


GO
CREATE TABLE [mkt].[UserForecastCoefs] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserForecastId]   BIGINT        NOT NULL,
    [MarketId]         BIGINT        NULL,
    [ExpressId]        BIGINT        NULL,
    [CoefId]           BIGINT        NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserForecastCoefs] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserForecastCoefs].[IX_UserForecastCoefs_UserForecastId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_UserForecastId]
    ON [mkt].[UserForecastCoefs]([UserForecastId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecastCoefs].[IX_UserForecastCoefs_MarketId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_MarketId]
    ON [mkt].[UserForecastCoefs]([MarketId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecastCoefs].[IX_UserForecastCoefs_ExpressId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_ExpressId]
    ON [mkt].[UserForecastCoefs]([ExpressId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecastCoefs].[IX_UserForecastCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_CoefId]
    ON [mkt].[UserForecastCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [mkt].[Expresses]...';


GO
CREATE TABLE [mkt].[Expresses] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [EventId]          BIGINT        NOT NULL,
    [ExpressType]      INT           NOT NULL,
    [Active]           BIT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Expresses] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Expresses].[IX_Expresses_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Expresses_EventId]
    ON [mkt].[Expresses]([EventId] ASC);


GO
PRINT N'Creating Table [mkt].[ExpressCoefs]...';


GO
CREATE TABLE [mkt].[ExpressCoefs] (
    [ExpressId] BIGINT NOT NULL,
    [CoefId]    BIGINT NOT NULL,
    CONSTRAINT [PK_ExpressCoefs] PRIMARY KEY CLUSTERED ([ExpressId] ASC, [CoefId] ASC)
);


GO
PRINT N'Creating Index [mkt].[ExpressCoefs].[IX_ExpressCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_ExpressCoefs_CoefId]
    ON [mkt].[ExpressCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [mkt].[PrizePlaces]...';


GO
CREATE TABLE [mkt].[PrizePlaces] (
    [Id]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [Period]            INT           NOT NULL,
    [Place]             INT           NOT NULL,
    [PrizeId]           BIGINT        NULL,
    [RewardGamePoints]  INT           NOT NULL,
    [RewardPrizePoints] INT           NOT NULL,
    [DateStart]         DATE          NOT NULL,
    [DateEnd]           DATE          NOT NULL,
    [PersistedVersion]  ROWVERSION    NULL,
    [CreatedUtc]        DATETIME2 (7) NOT NULL,
    [Created]           DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_PrizePlaces] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[PrizePlaces].[IX_PrizePlaces_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizePlaces_PrizeId]
    ON [mkt].[PrizePlaces]([PrizeId] ASC);


GO
PRINT N'Creating Table [mkt].[UserForecasts]...';


GO
CREATE TABLE [mkt].[UserForecasts] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [ForecastId]       BIGINT        NOT NULL,
    [UserId]           BIGINT        NOT NULL,
    [CreationTime]     DATETIME2 (7) NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserForecasts] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserForecasts].[IX_UserForecasts_ForecastId_UserId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserForecasts_ForecastId_UserId]
    ON [mkt].[UserForecasts]([ForecastId] ASC, [UserId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecasts].[IX_UserForecasts_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasts_UserId]
    ON [mkt].[UserForecasts]([UserId] ASC);


GO
PRINT N'Creating Table [mkt].[UserPrizes]...';


GO
CREATE TABLE [mkt].[UserPrizes] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    [Source]           INT            NOT NULL,
    [PrizeId]          BIGINT         NOT NULL,
    [UserId]           BIGINT         NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_UserPrizes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserPrizes].[IX_UserPrizes_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizes_UserId]
    ON [mkt].[UserPrizes]([UserId] ASC);


GO
PRINT N'Creating Index [mkt].[UserPrizes].[IX_UserPrizes_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizes_PrizeId]
    ON [mkt].[UserPrizes]([PrizeId] ASC);


GO
PRINT N'Creating Table [mkt].[Users]...';


GO
CREATE TABLE [mkt].[Users] (
    [Id]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [Code]             BIGINT          NOT NULL,
    [Name]             NVARCHAR (100)  NULL,
    [Password]         VARBINARY (MAX) NOT NULL,
    [Salt]             VARBINARY (MAX) NOT NULL,
    [Phone]            NVARCHAR (20)   NOT NULL,
    [Email]            NVARCHAR (100)  NULL,
    [CreationTime]     DATETIME2 (7)   NOT NULL,
    [LastLogin]        DATETIME2 (7)   NULL,
    [Activated]        BIT             NOT NULL,
    [PersistedVersion] ROWVERSION      NULL,
    [CreatedUtc]       DATETIME2 (7)   NOT NULL,
    [Created]          DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Users].[IX_Users_Phone]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Phone]
    ON [mkt].[Users]([Phone] ASC);


GO
PRINT N'Creating Table [mkt].[Markets]...';


GO
CREATE TABLE [mkt].[Markets] (
    [Id]               BIGINT         NOT NULL,
    [GlobalMarketId]   INT            NOT NULL,
    [EventId]          BIGINT         NOT NULL,
    [Name]             NVARCHAR (100) NULL,
    [Active]           BIT            NOT NULL,
    [Parameter]        INT            NULL,
    [UseForecast]      BIT            NOT NULL,
    [UseForecaster]    BIT            NOT NULL,
    [IsFull]           BIT            NOT NULL,
    [MarketType]       INT            NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Markets] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Markets].[IX_Markets_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Markets_EventId]
    ON [mkt].[Markets]([EventId] ASC);


GO
PRINT N'Creating Table [mkt].[Forecasts]...';


GO
CREATE TABLE [mkt].[Forecasts] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [EventId]          BIGINT        NOT NULL,
    [ReservedEventId]  BIGINT        NULL,
    [SelectedEventId]  BIGINT        NULL,
    [Rank]             INT           NULL,
    [ShowDate]         DATE          NOT NULL,
    [StartTime]        TIME (7)      NOT NULL,
    [EndTime]          TIME (7)      NOT NULL,
    [IsValid]          BIT           NOT NULL,
    [Deleted]          BIT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Forecasts] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Forecasts].[IX_Forecasts_SelectedEventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Forecasts_SelectedEventId]
    ON [mkt].[Forecasts]([SelectedEventId] ASC);


GO
PRINT N'Creating Index [mkt].[Forecasts].[IX_Forecasts_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Forecasts_EventId]
    ON [mkt].[Forecasts]([EventId] ASC);


GO
PRINT N'Creating Index [mkt].[Forecasts].[IX_Forecasts_ReservedEventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Forecasts_ReservedEventId]
    ON [mkt].[Forecasts]([ReservedEventId] ASC);


GO
PRINT N'Creating Table [mkt].[EventSportTypes]...';


GO
CREATE TABLE [mkt].[EventSportTypes] (
    [Id]               BIGINT         NOT NULL,
    [Name]             NVARCHAR (150) NULL,
    [FileId]           BIGINT         NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_EventSportTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[EventSportTypes].[IX_EventSportTypes_FileId]...';


GO
CREATE NONCLUSTERED INDEX [IX_EventSportTypes_FileId]
    ON [mkt].[EventSportTypes]([FileId] ASC);


GO
PRINT N'Creating Table [mkt].[Events]...';


GO
CREATE TABLE [mkt].[Events] (
    [Id]               BIGINT         NOT NULL,
    [Name]             NVARCHAR (250) NULL,
    [Description]      NVARCHAR (700) NULL,
    [Active]           BIT            NOT NULL,
    [StartTime]        DATETIME2 (7)  NOT NULL,
    [SportTypeId]      BIGINT         NOT NULL,
    [EventTypeId]      BIGINT         NOT NULL,
    [WebLink]          NVARCHAR (200) NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Events].[IX_Events_SportTypeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Events_SportTypeId]
    ON [mkt].[Events]([SportTypeId] ASC);


GO
PRINT N'Creating Table [mkt].[Coefs]...';


GO
CREATE TABLE [mkt].[Coefs] (
    [Id]               BIGINT          NOT NULL,
    [MarketId]         BIGINT          NOT NULL,
    [Name]             NVARCHAR (350)  NULL,
    [Description]      NVARCHAR (300)  NULL,
    [Active]           BIT             NOT NULL,
    [Value]            DECIMAL (18, 2) NOT NULL,
    [WinStatus]        INT             NOT NULL,
    [WinStatusUtc]     DATETIME2 (7)   NULL,
    [TypeId]           INT             NOT NULL,
    [PersistedVersion] ROWVERSION      NULL,
    [CreatedUtc]       DATETIME2 (7)   NOT NULL,
    [Created]          DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Coefs] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Coefs].[IX_Coefs_MarketId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Coefs_MarketId]
    ON [mkt].[Coefs]([MarketId] ASC);


GO
PRINT N'Creating Table [mkt].[Prizes]...';


GO
CREATE TABLE [mkt].[Prizes] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Type]             NVARCHAR (100) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [Title]            NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    [ImageId]          BIGINT         NULL,
    [ImageAltId]       BIGINT         NULL,
    [Points]           INT            NOT NULL,
    [Count]            INT            NOT NULL,
    [UserCount]        INT            NOT NULL,
    [PromoCategoryId]  BIGINT         NULL,
    [StartDate]        DATETIME2 (7)  NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Prizes].[IX_Prizes_ImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_ImageId]
    ON [mkt].[Prizes]([ImageId] ASC);


GO
PRINT N'Creating Index [mkt].[Prizes].[IX_Prizes_ImageAltId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_ImageAltId]
    ON [mkt].[Prizes]([ImageAltId] ASC);


GO
PRINT N'Creating Index [mkt].[Prizes].[IX_Prizes_PromoCategoryId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_PromoCategoryId]
    ON [mkt].[Prizes]([PromoCategoryId] ASC);


GO
PRINT N'Creating Table [mkt].[HistoryItems]...';


GO
CREATE TABLE [mkt].[HistoryItems] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]             BIGINT         NOT NULL,
    [Source]             INT            NOT NULL,
    [SourceInitiatedUtc] DATETIME2 (7)  NOT NULL,
    [Description]        NVARCHAR (MAX) NULL,
    [WinStatus]          INT            NOT NULL,
    [RewardGamePoints]   INT            NOT NULL,
    [RewardPrizePoints]  INT            NOT NULL,
    [UserForecastId]     BIGINT         NULL,
    [UserQuestId]        BIGINT         NULL,
    [UserForecasterId]   BIGINT         NULL,
    [AutoRatingId]       BIGINT         NULL,
    [PersistedVersion]   ROWVERSION     NULL,
    [CreatedUtc]         DATETIME2 (7)  NOT NULL,
    [Created]            DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_HistoryItems] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[HistoryItems].[IX_HistoryItems_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserId]
    ON [mkt].[HistoryItems]([UserId] ASC);


GO
PRINT N'Creating Index [mkt].[HistoryItems].[IX_HistoryItems_UserForecastId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserForecastId]
    ON [mkt].[HistoryItems]([UserForecastId] ASC);


GO
PRINT N'Creating Index [mkt].[HistoryItems].[IX_HistoryItems_UserQuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserQuestId]
    ON [mkt].[HistoryItems]([UserQuestId] ASC);


GO
PRINT N'Creating Index [mkt].[HistoryItems].[IX_HistoryItems_UserForecasterId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserForecasterId]
    ON [mkt].[HistoryItems]([UserForecasterId] ASC);


GO
PRINT N'Creating Index [mkt].[HistoryItems].[IX_HistoryItems_AutoRatingId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_AutoRatingId]
    ON [mkt].[HistoryItems]([AutoRatingId] ASC);


GO
PRINT N'Creating Table [mkt].[SettingTypes]...';


GO
CREATE TABLE [mkt].[SettingTypes] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_SettingTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[SettingTypes].[IX_SettingTypes_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SettingTypes_Name]
    ON [mkt].[SettingTypes]([Name] ASC);


GO
PRINT N'Creating Table [mkt].[Settings]...';


GO
CREATE TABLE [mkt].[Settings] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [SettingTypeId]    BIGINT         NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [Value]            NVARCHAR (MAX) NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Settings].[IX_Settings_SettingTypeId_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Settings_SettingTypeId_Name]
    ON [mkt].[Settings]([SettingTypeId] ASC, [Name] ASC);


GO
PRINT N'Creating Table [mkt].[Files]...';


GO
CREATE TABLE [mkt].[Files] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [OriginalName]     NVARCHAR (100) NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Files].[IX_Files_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Files_Name]
    ON [mkt].[Files]([Name] ASC);


GO
PRINT N'Creating Table [mkt].[Lotteries]...';


GO
CREATE TABLE [mkt].[Lotteries] (
    [Id]               BIGINT        NOT NULL,
    [Size]             TINYINT       NOT NULL,
    [StartDate]        DATE          NOT NULL,
    [EndDate]          DATE          NOT NULL,
    [Active]           BIT           NOT NULL,
    [Deleted]          BIT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Lotteries] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [mkt].[LotteryEvents]...';


GO
CREATE TABLE [mkt].[LotteryEvents] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [LotteryId]        BIGINT        NOT NULL,
    [EventId]          BIGINT        NOT NULL,
    [Deleted]          BIT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_LotteryEvents] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[LotteryEvents].[IX_LotteryEvents_LotteryId_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_LotteryEvents_LotteryId_EventId]
    ON [mkt].[LotteryEvents]([LotteryId] ASC, [EventId] ASC);


GO
PRINT N'Creating Index [mkt].[LotteryEvents].[IX_LotteryEvents_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_LotteryEvents_EventId]
    ON [mkt].[LotteryEvents]([EventId] ASC);


GO
PRINT N'Creating Table [mkt].[MarketCombinations]...';


GO
CREATE TABLE [mkt].[MarketCombinations] (
    [Id]               BIGINT          NOT NULL,
    [EventTypeId]      BIGINT          NOT NULL,
    [MarketType]       INT             NOT NULL,
    [MinValue]         DECIMAL (18, 2) NOT NULL,
    [MaxValue]         DECIMAL (18, 2) NOT NULL,
    [Combinations]     NVARCHAR (MAX)  NULL,
    [PersistedVersion] ROWVERSION      NULL,
    [CreatedUtc]       DATETIME2 (7)   NOT NULL,
    [Created]          DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_MarketCombinations] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [mkt].[AutoRatings]...';


GO
CREATE TABLE [mkt].[AutoRatings] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Period]           INT           NOT NULL,
    [CalculationDate]  DATE          NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_AutoRatings] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[AutoRatings].[IX_AutoRatings_CalculationDate_Period]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AutoRatings_CalculationDate_Period]
    ON [mkt].[AutoRatings]([CalculationDate] ASC, [Period] ASC);


GO
PRINT N'Creating Table [mkt].[UserForecasterCoefs]...';


GO
CREATE TABLE [mkt].[UserForecasterCoefs] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserForecasterId] BIGINT        NOT NULL,
    [UserId]           BIGINT        NOT NULL,
    [CoefId]           BIGINT        NOT NULL,
    [IsBought]         BIT           NOT NULL,
    [Points]           INT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserForecasterCoefs] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserForecasterCoefs].[IX_UserForecasterCoefs_UserId_CoefId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserForecasterCoefs_UserId_CoefId]
    ON [mkt].[UserForecasterCoefs]([UserId] ASC, [CoefId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecasterCoefs].[IX_UserForecasterCoefs_UserForecasterId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasterCoefs_UserForecasterId]
    ON [mkt].[UserForecasterCoefs]([UserForecasterId] ASC);


GO
PRINT N'Creating Index [mkt].[UserForecasterCoefs].[IX_UserForecasterCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasterCoefs_CoefId]
    ON [mkt].[UserForecasterCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [mkt].[UserForecasters]...';


GO
CREATE TABLE [mkt].[UserForecasters] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserForecasters] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [mkt].[UserPrizeScaleDraws]...';


GO
CREATE TABLE [mkt].[UserPrizeScaleDraws] (
    [PrizeScaleId] BIGINT NOT NULL,
    [UserId]       BIGINT NOT NULL,
    CONSTRAINT [PK_UserPrizeScaleDraws] PRIMARY KEY CLUSTERED ([PrizeScaleId] ASC, [UserId] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserPrizeScaleDraws].[IX_UserPrizeScaleDraws_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScaleDraws_UserId]
    ON [mkt].[UserPrizeScaleDraws]([UserId] ASC);


GO
PRINT N'Creating Table [mkt].[UserPrizeScales]...';


GO
CREATE TABLE [mkt].[UserPrizeScales] (
    [PrizeScaleId] BIGINT NOT NULL,
    [UserId]       BIGINT NOT NULL,
    [UserPrizeId]  BIGINT NULL,
    CONSTRAINT [PK_UserPrizeScales] PRIMARY KEY CLUSTERED ([PrizeScaleId] ASC, [UserId] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserPrizeScales].[IX_UserPrizeScales_UserPrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScales_UserPrizeId]
    ON [mkt].[UserPrizeScales]([UserPrizeId] ASC);


GO
PRINT N'Creating Index [mkt].[UserPrizeScales].[IX_UserPrizeScales_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScales_UserId]
    ON [mkt].[UserPrizeScales]([UserId] ASC);


GO
PRINT N'Creating Table [mkt].[PromoCategories]...';


GO
CREATE TABLE [mkt].[PromoCategories] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (20) NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_PromoCategories] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [mkt].[Promos]...';


GO
CREATE TABLE [mkt].[Promos] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (20) NULL,
    [CategoryId]       BIGINT        NOT NULL,
    [OrderInCategory]  INT           NOT NULL,
    [ExpirationDate]   DATETIME2 (7) NOT NULL,
    [GlobalPromoId]    INT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Promos] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[Promos].[IX_Promos_CategoryId_OrderInCategory]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Promos_CategoryId_OrderInCategory]
    ON [mkt].[Promos]([CategoryId] ASC, [OrderInCategory] ASC);


GO
PRINT N'Creating Table [mkt].[UserPromos]...';


GO
CREATE TABLE [mkt].[UserPromos] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [PromoId]          BIGINT        NOT NULL,
    [UserPrizeId]      BIGINT        NOT NULL,
    [IssueDate]        DATETIME2 (7) NOT NULL,
    [KernelActivated]  BIT           NOT NULL,
    [IsUniActivated]   BIT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserPromos] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[UserPromos].[IX_UserPromos_UserPrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPromos_UserPrizeId]
    ON [mkt].[UserPromos]([UserPrizeId] ASC);


GO
PRINT N'Creating Index [mkt].[UserPromos].[IX_UserPromos_PromoId_UserPrizeId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserPromos_PromoId_UserPrizeId]
    ON [mkt].[UserPromos]([PromoId] ASC, [UserPrizeId] ASC);


GO
PRINT N'Creating Table [mkt].[ForecasterEvents]...';


GO
CREATE TABLE [mkt].[ForecasterEvents] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [EventId]          BIGINT        NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_ForecasterEvents] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [mkt].[ForecasterEvents].[IX_ForecasterEvents_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ForecasterEvents_EventId]
    ON [mkt].[ForecasterEvents]([EventId] ASC);


GO
PRINT N'Creating Table [mkt].[News]...';


GO
CREATE TABLE [mkt].[News] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Active]           BIT            NOT NULL,
    [Title]            NVARCHAR (500) NOT NULL,
    [TitleAdditional]  NVARCHAR (500) NOT NULL,
    [Text]             NVARCHAR (MAX) NOT NULL,
    [PublicDate]       DATETIME2 (7)  NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [qst].[QuestTypes]...';


GO
CREATE TABLE [qst].[QuestTypes] (
    [Id]      INT             NOT NULL,
    [Name]    NVARCHAR (255)  NOT NULL,
    [Comment] NVARCHAR (1023) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [qst].[QBets]...';


GO
CREATE TABLE [qst].[QBets] (
    [QuestId]   BIGINT          NOT NULL,
    [QuestType] INT             NOT NULL,
    [BetSum]    NUMERIC (12, 2) NULL,
    [BetCoef]   NUMERIC (12, 2) NULL,
    [BetCount]  INT             NULL
);


GO
PRINT N'Creating Table [qst].[UpdateTime]...';


GO
CREATE TABLE [qst].[UpdateTime] (
    [LastUpdateTimeUtc] DATETIME NOT NULL
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserQuests]...';


GO
ALTER TABLE [mkt].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [StateUpdatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserQuests]...';


GO
ALTER TABLE [mkt].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [ProgressUpdatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserQuests]...';


GO
ALTER TABLE [mkt].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserQuests]...';


GO
ALTER TABLE [mkt].[UserQuests]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserLinks]...';


GO
ALTER TABLE [mkt].[UserLinks]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserLinks]...';


GO
ALTER TABLE [mkt].[UserLinks]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Quests]...';


GO
ALTER TABLE [mkt].[Quests]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Quests]...';


GO
ALTER TABLE [mkt].[Quests]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PrizeScales]...';


GO
ALTER TABLE [mkt].[PrizeScales]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PrizeScales]...';


GO
ALTER TABLE [mkt].[PrizeScales]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecastCoefs]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecastCoefs]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Expresses]...';


GO
ALTER TABLE [mkt].[Expresses]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Expresses]...';


GO
ALTER TABLE [mkt].[Expresses]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PrizePlaces]...';


GO
ALTER TABLE [mkt].[PrizePlaces]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PrizePlaces]...';


GO
ALTER TABLE [mkt].[PrizePlaces]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasts]...';


GO
ALTER TABLE [mkt].[UserForecasts]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasts]...';


GO
ALTER TABLE [mkt].[UserForecasts]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserPrizes]...';


GO
ALTER TABLE [mkt].[UserPrizes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserPrizes]...';


GO
ALTER TABLE [mkt].[UserPrizes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Users]...';


GO
ALTER TABLE [mkt].[Users]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Users]...';


GO
ALTER TABLE [mkt].[Users]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Markets]...';


GO
ALTER TABLE [mkt].[Markets]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Markets]...';


GO
ALTER TABLE [mkt].[Markets]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Forecasts]...';


GO
ALTER TABLE [mkt].[Forecasts]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Forecasts]...';


GO
ALTER TABLE [mkt].[Forecasts]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[EventSportTypes]...';


GO
ALTER TABLE [mkt].[EventSportTypes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[EventSportTypes]...';


GO
ALTER TABLE [mkt].[EventSportTypes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Events]...';


GO
ALTER TABLE [mkt].[Events]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Events]...';


GO
ALTER TABLE [mkt].[Events]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Coefs]...';


GO
ALTER TABLE [mkt].[Coefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Coefs]...';


GO
ALTER TABLE [mkt].[Coefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Prizes]...';


GO
ALTER TABLE [mkt].[Prizes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Prizes]...';


GO
ALTER TABLE [mkt].[Prizes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT (sysutcdatetime()) FOR [SourceInitiatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT ((0)) FOR [WinStatus];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT ((0)) FOR [RewardGamePoints];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT ((0)) FOR [RewardPrizePoints];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[HistoryItems]...';


GO
ALTER TABLE [mkt].[HistoryItems]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[SettingTypes]...';


GO
ALTER TABLE [mkt].[SettingTypes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[SettingTypes]...';


GO
ALTER TABLE [mkt].[SettingTypes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Settings]...';


GO
ALTER TABLE [mkt].[Settings]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Settings]...';


GO
ALTER TABLE [mkt].[Settings]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Files]...';


GO
ALTER TABLE [mkt].[Files]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Files]...';


GO
ALTER TABLE [mkt].[Files]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Lotteries]...';


GO
ALTER TABLE [mkt].[Lotteries]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Lotteries]...';


GO
ALTER TABLE [mkt].[Lotteries]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[LotteryEvents]...';


GO
ALTER TABLE [mkt].[LotteryEvents]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[LotteryEvents]...';


GO
ALTER TABLE [mkt].[LotteryEvents]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[MarketCombinations]...';


GO
ALTER TABLE [mkt].[MarketCombinations]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[MarketCombinations]...';


GO
ALTER TABLE [mkt].[MarketCombinations]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[AutoRatings]...';


GO
ALTER TABLE [mkt].[AutoRatings]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[AutoRatings]...';


GO
ALTER TABLE [mkt].[AutoRatings]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasterCoefs]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs]
    ADD DEFAULT (CONVERT([bit],(0))) FOR [IsBought];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasterCoefs]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs]
    ADD DEFAULT ((0)) FOR [Points];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasterCoefs]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasterCoefs]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasters]...';


GO
ALTER TABLE [mkt].[UserForecasters]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserForecasters]...';


GO
ALTER TABLE [mkt].[UserForecasters]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PromoCategories]...';


GO
ALTER TABLE [mkt].[PromoCategories]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[PromoCategories]...';


GO
ALTER TABLE [mkt].[PromoCategories]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Promos]...';


GO
ALTER TABLE [mkt].[Promos]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[Promos]...';


GO
ALTER TABLE [mkt].[Promos]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserPromos]...';


GO
ALTER TABLE [mkt].[UserPromos]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[UserPromos]...';


GO
ALTER TABLE [mkt].[UserPromos]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[ForecasterEvents]...';


GO
ALTER TABLE [mkt].[ForecasterEvents]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[ForecasterEvents]...';


GO
ALTER TABLE [mkt].[ForecasterEvents]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[News]...';


GO
ALTER TABLE [mkt].[News]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [mkt].[News]...';


GO
ALTER TABLE [mkt].[News]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserQuests_Quests_QuestId]...';


GO
ALTER TABLE [mkt].[UserQuests] WITH NOCHECK
    ADD CONSTRAINT [FK_UserQuests_Quests_QuestId] FOREIGN KEY ([QuestId]) REFERENCES [mkt].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserQuests_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserQuests] WITH NOCHECK
    ADD CONSTRAINT [FK_UserQuests_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserLinks_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_UserLinks_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Quests_Prizes_PrizeId]...';


GO
ALTER TABLE [mkt].[Quests] WITH NOCHECK
    ADD CONSTRAINT [FK_Quests_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [mkt].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Quests_Quests_DoAfterQuestId]...';


GO
ALTER TABLE [mkt].[Quests] WITH NOCHECK
    ADD CONSTRAINT [FK_Quests_Quests_DoAfterQuestId] FOREIGN KEY ([DoAfterQuestId]) REFERENCES [mkt].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_PrizeScales_Files_ImageActiveId]...';


GO
ALTER TABLE [mkt].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Files_ImageActiveId] FOREIGN KEY ([ImageActiveId]) REFERENCES [mkt].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_PrizeScales_Files_ImageId]...';


GO
ALTER TABLE [mkt].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Files_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [mkt].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_PrizeScales_Prizes_PrizeId]...';


GO
ALTER TABLE [mkt].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [mkt].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecastCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [mkt].[Coefs] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecastCoefs_Expresses_ExpressId]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Expresses_ExpressId] FOREIGN KEY ([ExpressId]) REFERENCES [mkt].[Expresses] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecastCoefs_Markets_MarketId]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Markets_MarketId] FOREIGN KEY ([MarketId]) REFERENCES [mkt].[Markets] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecastCoefs_UserForecasts_UserForecastId]...';


GO
ALTER TABLE [mkt].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_UserForecasts_UserForecastId] FOREIGN KEY ([UserForecastId]) REFERENCES [mkt].[UserForecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Expresses_Events_EventId]...';


GO
ALTER TABLE [mkt].[Expresses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expresses_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_ExpressCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [mkt].[ExpressCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_ExpressCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [mkt].[Coefs] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [mkt].[FK_ExpressCoefs_Expresses_ExpressId]...';


GO
ALTER TABLE [mkt].[ExpressCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_ExpressCoefs_Expresses_ExpressId] FOREIGN KEY ([ExpressId]) REFERENCES [mkt].[Expresses] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_PrizePlaces_Prizes_PrizeId]...';


GO
ALTER TABLE [mkt].[PrizePlaces] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizePlaces_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [mkt].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecasts_Forecasts_ForecastId]...';


GO
ALTER TABLE [mkt].[UserForecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasts_Forecasts_ForecastId] FOREIGN KEY ([ForecastId]) REFERENCES [mkt].[Forecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecasts_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserForecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasts_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizes_Prizes_PrizeId]...';


GO
ALTER TABLE [mkt].[UserPrizes] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizes_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [mkt].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizes_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserPrizes] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizes_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Markets_Events_EventId]...';


GO
ALTER TABLE [mkt].[Markets] WITH NOCHECK
    ADD CONSTRAINT [FK_Markets_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Forecasts_Events_EventId]...';


GO
ALTER TABLE [mkt].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [mkt].[Events] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [mkt].[FK_Forecasts_Events_ReservedEventId]...';


GO
ALTER TABLE [mkt].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_ReservedEventId] FOREIGN KEY ([ReservedEventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Forecasts_Events_SelectedEventId]...';


GO
ALTER TABLE [mkt].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_SelectedEventId] FOREIGN KEY ([SelectedEventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_EventSportTypes_Files_FileId]...';


GO
ALTER TABLE [mkt].[EventSportTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_EventSportTypes_Files_FileId] FOREIGN KEY ([FileId]) REFERENCES [mkt].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Events_EventSportTypes_SportTypeId]...';


GO
ALTER TABLE [mkt].[Events] WITH NOCHECK
    ADD CONSTRAINT [FK_Events_EventSportTypes_SportTypeId] FOREIGN KEY ([SportTypeId]) REFERENCES [mkt].[EventSportTypes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Coefs_Markets_MarketId]...';


GO
ALTER TABLE [mkt].[Coefs] WITH NOCHECK
    ADD CONSTRAINT [FK_Coefs_Markets_MarketId] FOREIGN KEY ([MarketId]) REFERENCES [mkt].[Markets] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Prizes_Files_ImageAltId]...';


GO
ALTER TABLE [mkt].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_Files_ImageAltId] FOREIGN KEY ([ImageAltId]) REFERENCES [mkt].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Prizes_Files_ImageId]...';


GO
ALTER TABLE [mkt].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_Files_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [mkt].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Prizes_PromoCategories_PromoCategoryId]...';


GO
ALTER TABLE [mkt].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_PromoCategories_PromoCategoryId] FOREIGN KEY ([PromoCategoryId]) REFERENCES [mkt].[PromoCategories] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_HistoryItems_AutoRatings_AutoRatingId]...';


GO
ALTER TABLE [mkt].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_AutoRatings_AutoRatingId] FOREIGN KEY ([AutoRatingId]) REFERENCES [mkt].[AutoRatings] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_HistoryItems_UserForecasters_UserForecasterId]...';


GO
ALTER TABLE [mkt].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserForecasters_UserForecasterId] FOREIGN KEY ([UserForecasterId]) REFERENCES [mkt].[UserForecasters] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_HistoryItems_UserForecasts_UserForecastId]...';


GO
ALTER TABLE [mkt].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserForecasts_UserForecastId] FOREIGN KEY ([UserForecastId]) REFERENCES [mkt].[UserForecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_HistoryItems_UserQuests_UserQuestId]...';


GO
ALTER TABLE [mkt].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserQuests_UserQuestId] FOREIGN KEY ([UserQuestId]) REFERENCES [mkt].[UserQuests] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_HistoryItems_Users_UserId]...';


GO
ALTER TABLE [mkt].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Settings_SettingTypes_SettingTypeId]...';


GO
ALTER TABLE [mkt].[Settings] WITH NOCHECK
    ADD CONSTRAINT [FK_Settings_SettingTypes_SettingTypeId] FOREIGN KEY ([SettingTypeId]) REFERENCES [mkt].[SettingTypes] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [mkt].[FK_LotteryEvents_Events_EventId]...';


GO
ALTER TABLE [mkt].[LotteryEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_LotteryEvents_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_LotteryEvents_Lotteries_LotteryId]...';


GO
ALTER TABLE [mkt].[LotteryEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_LotteryEvents_Lotteries_LotteryId] FOREIGN KEY ([LotteryId]) REFERENCES [mkt].[Lotteries] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecasterCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [mkt].[Coefs] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecasterCoefs_UserForecasters_UserForecasterId]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_UserForecasters_UserForecasterId] FOREIGN KEY ([UserForecasterId]) REFERENCES [mkt].[UserForecasters] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserForecasterCoefs_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId]...';


GO
ALTER TABLE [mkt].[UserPrizeScaleDraws] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId] FOREIGN KEY ([PrizeScaleId]) REFERENCES [mkt].[PrizeScales] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizeScaleDraws_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserPrizeScaleDraws] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScaleDraws_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizeScales_PrizeScales_PrizeScaleId]...';


GO
ALTER TABLE [mkt].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_PrizeScales_PrizeScaleId] FOREIGN KEY ([PrizeScaleId]) REFERENCES [mkt].[PrizeScales] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizeScales_UserPrizes_UserPrizeId]...';


GO
ALTER TABLE [mkt].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_UserPrizes_UserPrizeId] FOREIGN KEY ([UserPrizeId]) REFERENCES [mkt].[UserPrizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPrizeScales_Users_UserId]...';


GO
ALTER TABLE [mkt].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [mkt].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_Promos_PromoCategories_CategoryId]...';


GO
ALTER TABLE [mkt].[Promos] WITH NOCHECK
    ADD CONSTRAINT [FK_Promos_PromoCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [mkt].[PromoCategories] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPromos_Promos_PromoId]...';


GO
ALTER TABLE [mkt].[UserPromos] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPromos_Promos_PromoId] FOREIGN KEY ([PromoId]) REFERENCES [mkt].[Promos] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_UserPromos_UserPrizes_UserPrizeId]...';


GO
ALTER TABLE [mkt].[UserPromos] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPromos_UserPrizes_UserPrizeId] FOREIGN KEY ([UserPrizeId]) REFERENCES [mkt].[UserPrizes] ([Id]);


GO
PRINT N'Creating Foreign Key [mkt].[FK_ForecasterEvents_Events_EventId]...';


GO
ALTER TABLE [mkt].[ForecasterEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_ForecasterEvents_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [mkt].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [qst].[FK_QBets_QuestId]...';


GO
ALTER TABLE [qst].[QBets] WITH NOCHECK
    ADD CONSTRAINT [FK_QBets_QuestId] FOREIGN KEY ([QuestId]) REFERENCES [mkt].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [qst].[FK_QBets_QuestType]...';


GO
ALTER TABLE [qst].[QBets] WITH NOCHECK
    ADD CONSTRAINT [FK_QBets_QuestType] FOREIGN KEY ([QuestType]) REFERENCES [qst].[QuestTypes] ([Id]);


GO
PRINT N'Creating Procedure [qst].[calc_deposits]...';


GO

-------------------------------------------------------------------------------
-- Подсчет выполнения квестов по депозитам
-- Заменить в 1 месте название БД BaltbetM на актуальное
-------------------------------------------------------------------------------
CREATE procedure qst.calc_deposits
    @begin_time datetime,
    @end_time datetime
as
begin
set nocount on;

select
	uq.Id
    ,sum(s.TransactionValue) as 'Amount'
from (
    select
        r.AccountId, r.TransactionValue
    from BaltbetM.dbo.Transactions r -- 1/1 - BaltbetM
    where
        r.TransactionDateTime>=@begin_time and r.TransactionDateTime<@end_time
        and r.TransactionTypeId=7
        and r.Accepted=1
) s
inner join mkt.UserLinks u with(forceseek) on u.Id=s.AccountId
inner join mkt.UserQuests uq with(forceseek) on uq.UserId=u.UserId and uq.State=1
inner join mkt.Quests q with(forceseek) on q.Id=uq.QuestId and q.QuestTypeId=401
group by uq.Id
end
GO
PRINT N'Creating Procedure [qst].[calc_forecasts]...';


GO

-------------------------------------------------------------------------------
-- Подсчет прогресса квестов по прогнозам
-------------------------------------------------------------------------------
CREATE procedure qst.calc_forecasts
	@begin_time datetime,
	@end_time datetime
as
begin
	set nocount on;

	declare @begin_time_utc datetime = dateadd(hour, -3, @begin_time)
	declare @end_time_utc datetime = dateadd(hour, -3, @end_time)

	create table #amount (
		QuestTypeId int not null,
		UserId bigint not null,
		Amount int not null
	)


	-- Обычные прогнозы
	---------------------------------------
	create table #forecasts (
		UserId bigint not null,
		Rank int not null,
		Amount int not null
	)

	-- Стата по Поставить N прогнозов
	insert into #forecasts
	select u.UserId, f.Rank, count(1) as 'Amount'
	from mkt.UserForecasts u
	inner join mkt.Forecasts f on f.Id=u.ForecastId
	where u.CreationTime>=@begin_time and u.CreationTime<@end_time
	group by u.UserId, f.Rank


	insert into #amount
	select
		t.QuestTypeId, t.UserId, sum(t.Amount) as 'Amount'
	from (
	-- Поставить N прогнозов
	select 201 as 'QuestTypeId', UserId, count(1) as 'Amount'
	from #forecasts
	group by UserId

	union all

	-- Поставить N бронзовых прогнозов
	select 202, UserId, Amount
	from #forecasts
	where Rank=3

	union all

	-- Поставить N серебряных прогнозов
	select 203, UserId, Amount
	from #forecasts
	where Rank=2

	union all

	-- Поставить N золотых прогнозов
	select 204, UserId, Amount
	from #forecasts
	where Rank=1

	union all

	-- Простые прогнозы
	select 205, u.UserId, count(1) as 'Amount'
	from mkt.UserForecasts u
	inner join mkt.UserForecastCoefs fc on fc.UserForecastId=u.Id
	inner join mkt.Coefs c on c.Id= fc.CoefId
	where
		c.WinStatus=1
		and c.WinStatusUtc>=@begin_time_utc and c.WinStatusUtc<@end_time_utc
		and fc.MarketId is not null
	group by u.UserId

	union all

	-- Экспрессы
	select 205, q.UserId, count(1) as 'Amount'
	from (
		select uf.UserId, fc.ExpressId
		from mkt.UserForecasts uf
		inner join mkt.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join mkt.Expresses x on x.Id=fc.ExpressId
		inner join mkt.Coefs c on c.Id= fc.CoefId
		where uf.Id in (
			select distinct ff.UserForecastId
			from mkt.UserForecastCoefs ff
			inner join mkt.Coefs cc on cc.Id= ff.CoefId
			where cc.WinStatusUtc>=@begin_time_utc and cc.WinStatusUtc<@end_time_utc
				and ff.ExpressId is not null
			group by ff.UserForecastId
			)
		group by uf.UserId, fc.ExpressId
		having count(1)=count(case when c.WinStatus=1 then 1 end)	
	) q
	group by q.UserId

	) t
	group by t.QuestTypeId, t.UserId


	drop table #forecasts



	-- Прогнозы "Мне повезёт 1/2/3"
	---------------------------------------
	create table #expresses (
		UserId bigint not null,
		ExpressType int not null,
		Amount int not null
	)

	-- Стата по Поставить N прогнозов "мне повезёт"
	insert into #expresses
	select f.UserId, f.ExpressType, count(1)
	from (
		select distinct uf.UserId, x.ExpressType, uf.Id
		from mkt.UserForecasts uf
		inner join mkt.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join mkt.Expresses x on x.Id=fc.ExpressId
		where uf.CreationTime>=@begin_time and uf.CreationTime<@end_time
	) f
	group by f.UserId, f.ExpressType


	insert into #amount
	select
		t.QuestTypeId, t.UserId, t.Amount
	from (
	-- Поставить N прогнозов "мне повезёт 1'
	select 206 as 'QuestTypeId' , UserId, Amount
	from #expresses
	where ExpressType=1

	union all

	-- Поставить N прогнозов "мне повезёт 2'
	select 207, UserId, Amount
	from #expresses
	where ExpressType=2

	union all

	-- Поставить N прогнозов "мне повезёт 3'
	select 208, UserId, Amount
	from #expresses
	where ExpressType=3
	) t


	truncate table #expresses

	-- Стата по Выиграть N прогнозов "мне повезёт"
	insert into #expresses
	select q.UserId, q.ExpressType, count(1) as 'WinCount'
	from (
		-- прогнозы, в которых кол-во выигравших исходов равно общему кол-ву исходов (все исходы выиграли)
		select uf.UserId, fc.ExpressId, x.ExpressType
		from mkt.UserForecasts uf
		inner join mkt.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join mkt.Expresses x on x.Id=fc.ExpressId
		inner join mkt.Coefs c on c.Id= fc.CoefId
		where uf.Id in (
			-- прогнозы, у которых есть выигравшие исходы
			select distinct ff.UserForecastId
			from mkt.UserForecastCoefs ff
			inner join mkt.Coefs cc on cc.Id= ff.CoefId
			where cc.WinStatusUtc>=@begin_time_utc and cc.WinStatusUtc<@end_time_utc
				and ff.ExpressId is not null
			group by ff.UserForecastId
			)
		group by uf.UserId, fc.ExpressId, x.ExpressType
		having count(1)=count(case when c.WinStatus=1 then 1 end)	
	) q
	group by q.UserId, q.ExpressType


	insert into #amount
	select
		t.QuestTypeId, t.UserId, t.Amount
	from (
	-- Выиграть N прогнозов "мне повезёт 1
	select 209 as 'QuestTypeId', UserId, Amount
	from #expresses
	where ExpressType=1

	union all

	-- Выиграть N прогнозов "мне повезёт 2
	select 210, UserId, Amount
	from #expresses
	where ExpressType=2

	union all

	-- Выиграть N прогнозов "мне повезёт 3
	select 211, UserId, Amount
	from #expresses
	where ExpressType=3
	) t

	drop table #expresses

	select
		uq.Id, a.Amount
	from #amount a
	inner join mkt.UserQuests uq with(forceseek) on uq.UserId=a.UserId 
	inner join mkt.Quests q with(forceseek) on q.Id=uq.QuestId
		and q.QuestTypeId=a.QuestTypeId
	where
		uq.State=1

	drop table #amount
end
GO
PRINT N'Creating Procedure [qst].[calc_bets]...';


GO

-------------------------------------------------------------------------------
-- Подсчет прогресса квестов по ставкам
-- Заменить в 5 местах название БД BaltbetM на актуальное
-------------------------------------------------------------------------------
create procedure qst.calc_bets
	@begin_time datetime,
	@end_time datetime
as
begin
	set nocount on;

	select
		uq.Id, count(1) as 'Amount'
	from (
		-- Поставленные
		select
			b.AccountId
			,b.BetSum
			,case
				when b.BetTypeID in (0,1,2) then b.CoefValue
				when b.BetTypeID=8 then 1
				else 0 end as 'CoefValue'
			,case
				when b.BetTypeID in (0,1) then 102
				when b.BetTypeID=8 then 103
				when b.BetTypeID=2 then 104
					 else 0 end as 'QuestType'
		from BaltbetM.dbo.Bets b with(index(WorkerGroupped))
		where
			b.BetCreationTime>=@begin_time and b.BetCreationTime<@end_time
			and b.BetTypeID in (0,1,2,8)
			and b.BetDeleted=1
			and (b.PayType not in (4,7,20,256) or b.PayType is null)
			and b.SoldDate is null
			and b.BetSum<>b.BetWinSum

		union all

		-- Выигранные (без суперэкспрессов)
		select
			b.AccountId
			,b.BetSum
			,b.CoefValue
			,105 as 'QuestType'
		from BaltbetM.dbo.Bets b with(index(Pribil_3))
		where
			b.BetResultTime>=@begin_time and b.BetResultTime<@end_time
			and b.BetWin=1
			and b.BetDeleted=1
			and b.BetTypeID in (0,1,2)
			and (b.PayType not in (4,7,20,256) or b.PayType is null)
			and b.SoldDate is null
			and b.BetSum<>b.BetWinSum
	) s
	inner join mkt.UserLinks u with(forceseek) on u.Id=s.AccountId
	inner join qst.QBets t on t.QuestType=s.QuestType
	inner join mkt.UserQuests uq with(forceseek) on uq.UserId=u.UserId
	inner join mkt.Quests q with(forceseek) on q.Id=uq.QuestId
		and q.QuestTypeId=s.QuestType
		and t.QuestId=q.Id
	where
		s.BetSum>=t.BetSum
		and s.CoefValue>=t.BetCoef
		and uq.State=1
	group by uq.Id
end
GO
PRINT N'Creating Procedure [qst].[update_quests]...';


GO

-------------------------------------------------------------------------------
-- Обновление соcтояния квестов (запускается периодически)
-------------------------------------------------------------------------------
CREATE procedure qst.update_quests
as
begin
	set nocount on;

	create table #progress (
		UserQuestId int not null,
		Amount int not null
	)

	declare @end_time_utc datetime = dateadd(minute, -1, getutcdate())

	-- Переводим время в мск, так хранятся ставки и депозиты
	declare @begin_time datetime = dateadd(hour, 3, (select LastUpdateTimeUtc from qst.UpdateTime))
	declare @end_time datetime = dateadd(hour, 3, @end_time_utc)

	-- Квест на привязку аккаунта
	insert into #progress
	select
		distinct uq.Id, 1 as 'Amount'
	from mkt.UserLinks u
	inner join mkt.UserQuests uq on uq.UserId=u.UserId and uq.State=1
	inner join mkt.Quests q on q.Id=uq.QuestId and q.QuestTypeId=1

	-- Квесты по ставкам 
	insert into #progress
	exec qst.calc_bets @begin_time, @end_time

	-- Квесты по прогнозам 
	insert into #progress
	exec qst.calc_forecasts @begin_time, @end_time

	-- Квесты по депозитам 
	insert into #progress
	exec qst.calc_deposits @begin_time, @end_time

	-- Квест Ввести e-mail

	insert into #progress
	select uq.Id, 1
	from mkt.Users u
	inner join (
		select Id, UserId
		from mkt.UserQuests
		where QuestId in (select Id from mkt.Quests where QuestTypeId=302)
			and State=1
	) uq on uq.UserId=u.Id
	where Email<>''

	-- Обновляем прогресс и соcтояние квестов
	update uq
	set
		uq.Progress = case when uq.Progress + p.Amount > q.ProgressTarget then q.ProgressTarget else uq.Progress + p.Amount end,
		uq.State = case when uq.Progress + p.Amount >= q.ProgressTarget then 2 else uq.State end,
		uq.ProgressUpdatedUtc = @end_time_utc,
		uq.StateUpdatedUtc = case when uq.Progress + p.Amount >= q.ProgressTarget then @end_time_utc else uq.StateUpdatedUtc end
	from #progress p
	inner join mkt.UserQuests uq on uq.Id=p.UserQuestId
	inner join mkt.Quests q on q.Id=uq.QuestId
	left join mkt.Quests lq on lq.Id=q.DoAfterQuestId
	left join mkt.UserQuests luq on luq.QuestId=lq.Id and luq.UserId=uq.UserId
	where luq.State=3 or q.DoAfterQuestId is null

	drop table #progress

	update qst.UpdateTime set LastUpdateTimeUtc = @end_time_utc
end
GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [mkt].[UserQuests] WITH CHECK CHECK CONSTRAINT [FK_UserQuests_Quests_QuestId];

ALTER TABLE [mkt].[UserQuests] WITH CHECK CHECK CONSTRAINT [FK_UserQuests_Users_UserId];

ALTER TABLE [mkt].[UserLinks] WITH CHECK CHECK CONSTRAINT [FK_UserLinks_Users_UserId];

ALTER TABLE [mkt].[Quests] WITH CHECK CHECK CONSTRAINT [FK_Quests_Prizes_PrizeId];

ALTER TABLE [mkt].[Quests] WITH CHECK CHECK CONSTRAINT [FK_Quests_Quests_DoAfterQuestId];

ALTER TABLE [mkt].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Files_ImageActiveId];

ALTER TABLE [mkt].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Files_ImageId];

ALTER TABLE [mkt].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Prizes_PrizeId];

ALTER TABLE [mkt].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Coefs_CoefId];

ALTER TABLE [mkt].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Expresses_ExpressId];

ALTER TABLE [mkt].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Markets_MarketId];

ALTER TABLE [mkt].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_UserForecasts_UserForecastId];

ALTER TABLE [mkt].[Expresses] WITH CHECK CHECK CONSTRAINT [FK_Expresses_Events_EventId];

ALTER TABLE [mkt].[ExpressCoefs] WITH CHECK CHECK CONSTRAINT [FK_ExpressCoefs_Coefs_CoefId];

ALTER TABLE [mkt].[ExpressCoefs] WITH CHECK CHECK CONSTRAINT [FK_ExpressCoefs_Expresses_ExpressId];

ALTER TABLE [mkt].[PrizePlaces] WITH CHECK CHECK CONSTRAINT [FK_PrizePlaces_Prizes_PrizeId];

ALTER TABLE [mkt].[UserForecasts] WITH CHECK CHECK CONSTRAINT [FK_UserForecasts_Forecasts_ForecastId];

ALTER TABLE [mkt].[UserForecasts] WITH CHECK CHECK CONSTRAINT [FK_UserForecasts_Users_UserId];

ALTER TABLE [mkt].[UserPrizes] WITH CHECK CHECK CONSTRAINT [FK_UserPrizes_Prizes_PrizeId];

ALTER TABLE [mkt].[UserPrizes] WITH CHECK CHECK CONSTRAINT [FK_UserPrizes_Users_UserId];

ALTER TABLE [mkt].[Markets] WITH CHECK CHECK CONSTRAINT [FK_Markets_Events_EventId];

ALTER TABLE [mkt].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_EventId];

ALTER TABLE [mkt].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_ReservedEventId];

ALTER TABLE [mkt].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_SelectedEventId];

ALTER TABLE [mkt].[EventSportTypes] WITH CHECK CHECK CONSTRAINT [FK_EventSportTypes_Files_FileId];

ALTER TABLE [mkt].[Events] WITH CHECK CHECK CONSTRAINT [FK_Events_EventSportTypes_SportTypeId];

ALTER TABLE [mkt].[Coefs] WITH CHECK CHECK CONSTRAINT [FK_Coefs_Markets_MarketId];

ALTER TABLE [mkt].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_Files_ImageAltId];

ALTER TABLE [mkt].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_Files_ImageId];

ALTER TABLE [mkt].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_PromoCategories_PromoCategoryId];

ALTER TABLE [mkt].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_AutoRatings_AutoRatingId];

ALTER TABLE [mkt].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserForecasters_UserForecasterId];

ALTER TABLE [mkt].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserForecasts_UserForecastId];

ALTER TABLE [mkt].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserQuests_UserQuestId];

ALTER TABLE [mkt].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_Users_UserId];

ALTER TABLE [mkt].[Settings] WITH CHECK CHECK CONSTRAINT [FK_Settings_SettingTypes_SettingTypeId];

ALTER TABLE [mkt].[LotteryEvents] WITH CHECK CHECK CONSTRAINT [FK_LotteryEvents_Events_EventId];

ALTER TABLE [mkt].[LotteryEvents] WITH CHECK CHECK CONSTRAINT [FK_LotteryEvents_Lotteries_LotteryId];

ALTER TABLE [mkt].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_Coefs_CoefId];

ALTER TABLE [mkt].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_UserForecasters_UserForecasterId];

ALTER TABLE [mkt].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_Users_UserId];

ALTER TABLE [mkt].[UserPrizeScaleDraws] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId];

ALTER TABLE [mkt].[UserPrizeScaleDraws] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScaleDraws_Users_UserId];

ALTER TABLE [mkt].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_PrizeScales_PrizeScaleId];

ALTER TABLE [mkt].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_UserPrizes_UserPrizeId];

ALTER TABLE [mkt].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_Users_UserId];

ALTER TABLE [mkt].[Promos] WITH CHECK CHECK CONSTRAINT [FK_Promos_PromoCategories_CategoryId];

ALTER TABLE [mkt].[UserPromos] WITH CHECK CHECK CONSTRAINT [FK_UserPromos_Promos_PromoId];

ALTER TABLE [mkt].[UserPromos] WITH CHECK CHECK CONSTRAINT [FK_UserPromos_UserPrizes_UserPrizeId];

ALTER TABLE [mkt].[ForecasterEvents] WITH CHECK CHECK CONSTRAINT [FK_ForecasterEvents_Events_EventId];

ALTER TABLE [qst].[QBets] WITH CHECK CHECK CONSTRAINT [FK_QBets_QuestId];

ALTER TABLE [qst].[QBets] WITH CHECK CHECK CONSTRAINT [FK_QBets_QuestType];


GO
PRINT N'Update complete.';


GO
