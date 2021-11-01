PRINT N'Creating Schema [qst]...';
if schema_id('qst') is null
begin
  execute('create schema qst')

  print 'Создана схема qst'
end


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
PRINT N'Creating Table [qst].[UpdateTime]...';


GO
CREATE TABLE [qst].[UpdateTime] (
    [LastUpdateTimeUtc] DATETIME NOT NULL
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
PRINT N'Creating Table [dbo].[AutoRatings]...';


GO
CREATE TABLE [dbo].[AutoRatings] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Period]           INT           NOT NULL,
    [CalculationDate]  DATE          NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_AutoRatings] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[AutoRatings].[IX_AutoRatings_CalculationDate_Period]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AutoRatings_CalculationDate_Period]
    ON [dbo].[AutoRatings]([CalculationDate] ASC, [Period] ASC);


GO
PRINT N'Creating Table [dbo].[Banners]...';


GO
CREATE TABLE [dbo].[Banners] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [Link]             NVARCHAR (100) NOT NULL,
    [Active]           BIT            NOT NULL,
    [NewTab]           BIT            NOT NULL,
    [DateStart]        DATETIME2 (7)  NOT NULL,
    [DateEnd]          DATETIME2 (7)  NOT NULL,
    [BannerContent]    NVARCHAR (500) NOT NULL,
    [ButtonContent]    NVARCHAR (50)  NOT NULL,
    [ImageId]          BIGINT         NULL,
    [MobileImageId]    BIGINT         NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[Banners].[IX_Banners_MobileImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Banners_MobileImageId]
    ON [dbo].[Banners]([MobileImageId] ASC);


GO
PRINT N'Creating Index [dbo].[Banners].[IX_Banners_ImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Banners_ImageId]
    ON [dbo].[Banners]([ImageId] ASC);


GO
PRINT N'Creating Table [dbo].[Coefs]...';


GO
CREATE TABLE [dbo].[Coefs] (
    [Id]               BIGINT          NOT NULL,
    [MarketId]         BIGINT          NOT NULL,
    [Name]             NVARCHAR (350)  NULL,
    [Description]      NVARCHAR (300)  NULL,
    [ShortDescription] NVARCHAR (300)  NULL,
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
PRINT N'Creating Index [dbo].[Coefs].[IX_Coefs_MarketId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Coefs_MarketId]
    ON [dbo].[Coefs]([MarketId] ASC);


GO
PRINT N'Creating Table [dbo].[Events]...';


GO
CREATE TABLE [dbo].[Events] (
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
PRINT N'Creating Index [dbo].[Events].[IX_Events_SportTypeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Events_SportTypeId]
    ON [dbo].[Events]([SportTypeId] ASC);


GO
PRINT N'Creating Table [dbo].[EventSportTypes]...';


GO
CREATE TABLE [dbo].[EventSportTypes] (
    [Id]               BIGINT         NOT NULL,
    [Name]             NVARCHAR (150) NULL,
    [FileId]           BIGINT         NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_EventSportTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[EventSportTypes].[IX_EventSportTypes_FileId]...';


GO
CREATE NONCLUSTERED INDEX [IX_EventSportTypes_FileId]
    ON [dbo].[EventSportTypes]([FileId] ASC);


GO
PRINT N'Creating Table [dbo].[ExpressCoefs]...';


GO
CREATE TABLE [dbo].[ExpressCoefs] (
    [ExpressId] BIGINT NOT NULL,
    [CoefId]    BIGINT NOT NULL,
    CONSTRAINT [PK_ExpressCoefs] PRIMARY KEY CLUSTERED ([ExpressId] ASC, [CoefId] ASC)
);


GO
PRINT N'Creating Index [dbo].[ExpressCoefs].[IX_ExpressCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_ExpressCoefs_CoefId]
    ON [dbo].[ExpressCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [dbo].[Expresses]...';


GO
CREATE TABLE [dbo].[Expresses] (
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
PRINT N'Creating Index [dbo].[Expresses].[IX_Expresses_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Expresses_EventId]
    ON [dbo].[Expresses]([EventId] ASC);


GO
PRINT N'Creating Table [dbo].[Files]...';


GO
CREATE TABLE [dbo].[Files] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [OriginalName]     NVARCHAR (100) NOT NULL,
    [Category]         INT            NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[Files].[IX_Files_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Files_Name]
    ON [dbo].[Files]([Name] ASC);


GO
PRINT N'Creating Table [dbo].[ForecasterEvents]...';


GO
CREATE TABLE [dbo].[ForecasterEvents] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [EventId]          BIGINT        NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_ForecasterEvents] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[ForecasterEvents].[IX_ForecasterEvents_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ForecasterEvents_EventId]
    ON [dbo].[ForecasterEvents]([EventId] ASC);


GO
PRINT N'Creating Table [dbo].[Forecasts]...';


GO
CREATE TABLE [dbo].[Forecasts] (
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
PRINT N'Creating Index [dbo].[Forecasts].[IX_Forecasts_SelectedEventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Forecasts_SelectedEventId]
    ON [dbo].[Forecasts]([SelectedEventId] ASC);


GO
PRINT N'Creating Index [dbo].[Forecasts].[IX_Forecasts_ReservedEventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Forecasts_ReservedEventId]
    ON [dbo].[Forecasts]([ReservedEventId] ASC);


GO
PRINT N'Creating Index [dbo].[Forecasts].[IX_Forecasts_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Forecasts_EventId]
    ON [dbo].[Forecasts]([EventId] ASC);


GO
PRINT N'Creating Table [dbo].[HistoryItems]...';


GO
CREATE TABLE [dbo].[HistoryItems] (
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
PRINT N'Creating Index [dbo].[HistoryItems].[IX_HistoryItems_UserQuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserQuestId]
    ON [dbo].[HistoryItems]([UserQuestId] ASC);


GO
PRINT N'Creating Index [dbo].[HistoryItems].[IX_HistoryItems_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserId]
    ON [dbo].[HistoryItems]([UserId] ASC);


GO
PRINT N'Creating Index [dbo].[HistoryItems].[IX_HistoryItems_UserForecastId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserForecastId]
    ON [dbo].[HistoryItems]([UserForecastId] ASC);


GO
PRINT N'Creating Index [dbo].[HistoryItems].[IX_HistoryItems_UserForecasterId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_UserForecasterId]
    ON [dbo].[HistoryItems]([UserForecasterId] ASC);


GO
PRINT N'Creating Index [dbo].[HistoryItems].[IX_HistoryItems_AutoRatingId]...';


GO
CREATE NONCLUSTERED INDEX [IX_HistoryItems_AutoRatingId]
    ON [dbo].[HistoryItems]([AutoRatingId] ASC);


GO
PRINT N'Creating Table [dbo].[Lotteries]...';


GO
CREATE TABLE [dbo].[Lotteries] (
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
PRINT N'Creating Table [dbo].[LotteryEvents]...';


GO
CREATE TABLE [dbo].[LotteryEvents] (
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
PRINT N'Creating Index [dbo].[LotteryEvents].[IX_LotteryEvents_LotteryId_EventId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_LotteryEvents_LotteryId_EventId]
    ON [dbo].[LotteryEvents]([LotteryId] ASC, [EventId] ASC);


GO
PRINT N'Creating Index [dbo].[LotteryEvents].[IX_LotteryEvents_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_LotteryEvents_EventId]
    ON [dbo].[LotteryEvents]([EventId] ASC);


GO
PRINT N'Creating Table [dbo].[MarketCombinations]...';


GO
CREATE TABLE [dbo].[MarketCombinations] (
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
PRINT N'Creating Table [dbo].[Markets]...';


GO
CREATE TABLE [dbo].[Markets] (
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
PRINT N'Creating Index [dbo].[Markets].[IX_Markets_EventId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Markets_EventId]
    ON [dbo].[Markets]([EventId] ASC);


GO
PRINT N'Creating Table [dbo].[News]...';


GO
CREATE TABLE [dbo].[News] (
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
PRINT N'Creating Table [dbo].[PrizePlaces]...';


GO
CREATE TABLE [dbo].[PrizePlaces] (
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
PRINT N'Creating Index [dbo].[PrizePlaces].[IX_PrizePlaces_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizePlaces_PrizeId]
    ON [dbo].[PrizePlaces]([PrizeId] ASC);


GO
PRINT N'Creating Table [dbo].[Prizes]...';


GO
CREATE TABLE [dbo].[Prizes] (
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
PRINT N'Creating Index [dbo].[Prizes].[IX_Prizes_PromoCategoryId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_PromoCategoryId]
    ON [dbo].[Prizes]([PromoCategoryId] ASC);


GO
PRINT N'Creating Index [dbo].[Prizes].[IX_Prizes_ImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_ImageId]
    ON [dbo].[Prizes]([ImageId] ASC);


GO
PRINT N'Creating Index [dbo].[Prizes].[IX_Prizes_ImageAltId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Prizes_ImageAltId]
    ON [dbo].[Prizes]([ImageAltId] ASC);


GO
PRINT N'Creating Table [dbo].[PrizeScales]...';


GO
CREATE TABLE [dbo].[PrizeScales] (
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
PRINT N'Creating Index [dbo].[PrizeScales].[IX_PrizeScales_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_PrizeId]
    ON [dbo].[PrizeScales]([PrizeId] ASC);


GO
PRINT N'Creating Index [dbo].[PrizeScales].[IX_PrizeScales_ImageId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_ImageId]
    ON [dbo].[PrizeScales]([ImageId] ASC);


GO
PRINT N'Creating Index [dbo].[PrizeScales].[IX_PrizeScales_ImageActiveId]...';


GO
CREATE NONCLUSTERED INDEX [IX_PrizeScales_ImageActiveId]
    ON [dbo].[PrizeScales]([ImageActiveId] ASC);


GO
PRINT N'Creating Table [dbo].[PromoCategories]...';


GO
CREATE TABLE [dbo].[PromoCategories] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (20) NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_PromoCategories] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Promos]...';


GO
CREATE TABLE [dbo].[Promos] (
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
PRINT N'Creating Index [dbo].[Promos].[IX_Promos_CategoryId_OrderInCategory]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Promos_CategoryId_OrderInCategory]
    ON [dbo].[Promos]([CategoryId] ASC, [OrderInCategory] ASC);


GO
PRINT N'Creating Table [dbo].[Quests]...';


GO
CREATE TABLE [dbo].[Quests] (
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
PRINT N'Creating Index [dbo].[Quests].[IX_Quests_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Quests_PrizeId]
    ON [dbo].[Quests]([PrizeId] ASC);


GO
PRINT N'Creating Index [dbo].[Quests].[IX_Quests_DoAfterQuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Quests_DoAfterQuestId]
    ON [dbo].[Quests]([DoAfterQuestId] ASC);


GO
PRINT N'Creating Index [dbo].[Quests].[IX_Quests_Cell_Date_OrderInCell]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Quests_Cell_Date_OrderInCell]
    ON [dbo].[Quests]([Cell] ASC, [Date] ASC, [OrderInCell] ASC) WHERE ([Date] IS NOT NULL AND [OrderInCell] IS NOT NULL);


GO
PRINT N'Creating Table [dbo].[Settings]...';


GO
CREATE TABLE [dbo].[Settings] (
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
PRINT N'Creating Index [dbo].[Settings].[IX_Settings_SettingTypeId_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Settings_SettingTypeId_Name]
    ON [dbo].[Settings]([SettingTypeId] ASC, [Name] ASC);


GO
PRINT N'Creating Table [dbo].[SettingTypes]...';


GO
CREATE TABLE [dbo].[SettingTypes] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_SettingTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[SettingTypes].[IX_SettingTypes_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SettingTypes_Name]
    ON [dbo].[SettingTypes]([Name] ASC);


GO
PRINT N'Creating Table [dbo].[StaticPages]...';


GO
CREATE TABLE [dbo].[StaticPages] (
    [Id]               BIGINT         NOT NULL,
    [Content]          NVARCHAR (MAX) NOT NULL,
    [Title]            NVARCHAR (100) NOT NULL,
    [PersistedVersion] ROWVERSION     NULL,
    [CreatedUtc]       DATETIME2 (7)  NOT NULL,
    [Created]          DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_StaticPages] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[UserForecastCoefs]...';


GO
CREATE TABLE [dbo].[UserForecastCoefs] (
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
PRINT N'Creating Index [dbo].[UserForecastCoefs].[IX_UserForecastCoefs_UserForecastId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_UserForecastId]
    ON [dbo].[UserForecastCoefs]([UserForecastId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecastCoefs].[IX_UserForecastCoefs_MarketId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_MarketId]
    ON [dbo].[UserForecastCoefs]([MarketId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecastCoefs].[IX_UserForecastCoefs_ExpressId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_ExpressId]
    ON [dbo].[UserForecastCoefs]([ExpressId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecastCoefs].[IX_UserForecastCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecastCoefs_CoefId]
    ON [dbo].[UserForecastCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [dbo].[UserForecasterCoefs]...';


GO
CREATE TABLE [dbo].[UserForecasterCoefs] (
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
PRINT N'Creating Index [dbo].[UserForecasterCoefs].[IX_UserForecasterCoefs_UserId_CoefId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserForecasterCoefs_UserId_CoefId]
    ON [dbo].[UserForecasterCoefs]([UserId] ASC, [CoefId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecasterCoefs].[IX_UserForecasterCoefs_UserForecasterId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasterCoefs_UserForecasterId]
    ON [dbo].[UserForecasterCoefs]([UserForecasterId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecasterCoefs].[IX_UserForecasterCoefs_CoefId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasterCoefs_CoefId]
    ON [dbo].[UserForecasterCoefs]([CoefId] ASC);


GO
PRINT N'Creating Table [dbo].[UserForecasters]...';


GO
CREATE TABLE [dbo].[UserForecasters] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserForecasters] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[UserForecasts]...';


GO
CREATE TABLE [dbo].[UserForecasts] (
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
PRINT N'Creating Index [dbo].[UserForecasts].[IX_UserForecasts_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserForecasts_UserId]
    ON [dbo].[UserForecasts]([UserId] ASC);


GO
PRINT N'Creating Index [dbo].[UserForecasts].[IX_UserForecasts_ForecastId_UserId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserForecasts_ForecastId_UserId]
    ON [dbo].[UserForecasts]([ForecastId] ASC, [UserId] ASC);


GO
PRINT N'Creating Table [dbo].[UserLinks]...';


GO
CREATE TABLE [dbo].[UserLinks] (
    [Id]               BIGINT        NOT NULL,
    [UserId]           BIGINT        NULL,
    [UserLinkType]     INT           NOT NULL,
    [PersistedVersion] ROWVERSION    NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [Created]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_UserLinks] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[UserLinks].[IX_UserLinks_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserLinks_UserId]
    ON [dbo].[UserLinks]([UserId] ASC);


GO
PRINT N'Creating Table [dbo].[UserPrizes]...';


GO
CREATE TABLE [dbo].[UserPrizes] (
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
PRINT N'Creating Index [dbo].[UserPrizes].[IX_UserPrizes_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizes_UserId]
    ON [dbo].[UserPrizes]([UserId] ASC);


GO
PRINT N'Creating Index [dbo].[UserPrizes].[IX_UserPrizes_PrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizes_PrizeId]
    ON [dbo].[UserPrizes]([PrizeId] ASC);


GO
PRINT N'Creating Table [dbo].[UserPrizeScaleDraws]...';


GO
CREATE TABLE [dbo].[UserPrizeScaleDraws] (
    [PrizeScaleId] BIGINT NOT NULL,
    [UserId]       BIGINT NOT NULL,
    CONSTRAINT [PK_UserPrizeScaleDraws] PRIMARY KEY CLUSTERED ([PrizeScaleId] ASC, [UserId] ASC)
);


GO
PRINT N'Creating Index [dbo].[UserPrizeScaleDraws].[IX_UserPrizeScaleDraws_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScaleDraws_UserId]
    ON [dbo].[UserPrizeScaleDraws]([UserId] ASC);


GO
PRINT N'Creating Table [dbo].[UserPrizeScales]...';


GO
CREATE TABLE [dbo].[UserPrizeScales] (
    [PrizeScaleId] BIGINT NOT NULL,
    [UserId]       BIGINT NOT NULL,
    [UserPrizeId]  BIGINT NULL,
    CONSTRAINT [PK_UserPrizeScales] PRIMARY KEY CLUSTERED ([PrizeScaleId] ASC, [UserId] ASC)
);


GO
PRINT N'Creating Index [dbo].[UserPrizeScales].[IX_UserPrizeScales_UserPrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScales_UserPrizeId]
    ON [dbo].[UserPrizeScales]([UserPrizeId] ASC);


GO
PRINT N'Creating Index [dbo].[UserPrizeScales].[IX_UserPrizeScales_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPrizeScales_UserId]
    ON [dbo].[UserPrizeScales]([UserId] ASC);


GO
PRINT N'Creating Table [dbo].[UserPromos]...';


GO
CREATE TABLE [dbo].[UserPromos] (
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
PRINT N'Creating Index [dbo].[UserPromos].[IX_UserPromos_UserPrizeId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPromos_UserPrizeId]
    ON [dbo].[UserPromos]([UserPrizeId] ASC);


GO
PRINT N'Creating Index [dbo].[UserPromos].[IX_UserPromos_PromoId_UserPrizeId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserPromos_PromoId_UserPrizeId]
    ON [dbo].[UserPromos]([PromoId] ASC, [UserPrizeId] ASC);


GO
PRINT N'Creating Table [dbo].[UserQuests]...';


GO
CREATE TABLE [dbo].[UserQuests] (
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
PRINT N'Creating Index [dbo].[UserQuests].[IX_UserQuests_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserQuests_UserId]
    ON [dbo].[UserQuests]([UserId] ASC);


GO
PRINT N'Creating Index [dbo].[UserQuests].[IX_UserQuests_QuestId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserQuests_QuestId]
    ON [dbo].[UserQuests]([QuestId] ASC);


GO
PRINT N'Creating Table [dbo].[Users]...';


GO
CREATE TABLE [dbo].[Users] (
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
    [SmsConfirmed]     BIT             NOT NULL,
    [PersistedVersion] ROWVERSION      NULL,
    [CreatedUtc]       DATETIME2 (7)   NOT NULL,
    [Created]          DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[Users].[IX_Users_Phone]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Phone]
    ON [dbo].[Users]([Phone] ASC);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[AutoRatings]...';


GO
ALTER TABLE [dbo].[AutoRatings]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[AutoRatings]...';


GO
ALTER TABLE [dbo].[AutoRatings]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Banners]...';


GO
ALTER TABLE [dbo].[Banners]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Banners]...';


GO
ALTER TABLE [dbo].[Banners]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Coefs]...';


GO
ALTER TABLE [dbo].[Coefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Coefs]...';


GO
ALTER TABLE [dbo].[Coefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Events]...';


GO
ALTER TABLE [dbo].[Events]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Events]...';


GO
ALTER TABLE [dbo].[Events]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[EventSportTypes]...';


GO
ALTER TABLE [dbo].[EventSportTypes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[EventSportTypes]...';


GO
ALTER TABLE [dbo].[EventSportTypes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Expresses]...';


GO
ALTER TABLE [dbo].[Expresses]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Expresses]...';


GO
ALTER TABLE [dbo].[Expresses]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Files]...';


GO
ALTER TABLE [dbo].[Files]
    ADD DEFAULT ((0)) FOR [Category];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Files]...';


GO
ALTER TABLE [dbo].[Files]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Files]...';


GO
ALTER TABLE [dbo].[Files]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[ForecasterEvents]...';


GO
ALTER TABLE [dbo].[ForecasterEvents]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[ForecasterEvents]...';


GO
ALTER TABLE [dbo].[ForecasterEvents]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Forecasts]...';


GO
ALTER TABLE [dbo].[Forecasts]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Forecasts]...';


GO
ALTER TABLE [dbo].[Forecasts]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT (sysutcdatetime()) FOR [SourceInitiatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT ((0)) FOR [WinStatus];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT ((0)) FOR [RewardGamePoints];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT ((0)) FOR [RewardPrizePoints];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[HistoryItems]...';


GO
ALTER TABLE [dbo].[HistoryItems]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Lotteries]...';


GO
ALTER TABLE [dbo].[Lotteries]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Lotteries]...';


GO
ALTER TABLE [dbo].[Lotteries]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[LotteryEvents]...';


GO
ALTER TABLE [dbo].[LotteryEvents]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[LotteryEvents]...';


GO
ALTER TABLE [dbo].[LotteryEvents]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[MarketCombinations]...';


GO
ALTER TABLE [dbo].[MarketCombinations]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[MarketCombinations]...';


GO
ALTER TABLE [dbo].[MarketCombinations]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Markets]...';


GO
ALTER TABLE [dbo].[Markets]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Markets]...';


GO
ALTER TABLE [dbo].[Markets]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[News]...';


GO
ALTER TABLE [dbo].[News]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[News]...';


GO
ALTER TABLE [dbo].[News]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PrizePlaces]...';


GO
ALTER TABLE [dbo].[PrizePlaces]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PrizePlaces]...';


GO
ALTER TABLE [dbo].[PrizePlaces]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Prizes]...';


GO
ALTER TABLE [dbo].[Prizes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Prizes]...';


GO
ALTER TABLE [dbo].[Prizes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PrizeScales]...';


GO
ALTER TABLE [dbo].[PrizeScales]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PrizeScales]...';


GO
ALTER TABLE [dbo].[PrizeScales]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PromoCategories]...';


GO
ALTER TABLE [dbo].[PromoCategories]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[PromoCategories]...';


GO
ALTER TABLE [dbo].[PromoCategories]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Promos]...';


GO
ALTER TABLE [dbo].[Promos]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Promos]...';


GO
ALTER TABLE [dbo].[Promos]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Quests]...';


GO
ALTER TABLE [dbo].[Quests]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Quests]...';


GO
ALTER TABLE [dbo].[Quests]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Settings]...';


GO
ALTER TABLE [dbo].[Settings]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Settings]...';


GO
ALTER TABLE [dbo].[Settings]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SettingTypes]...';


GO
ALTER TABLE [dbo].[SettingTypes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SettingTypes]...';


GO
ALTER TABLE [dbo].[SettingTypes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[StaticPages]...';


GO
ALTER TABLE [dbo].[StaticPages]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[StaticPages]...';


GO
ALTER TABLE [dbo].[StaticPages]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecastCoefs]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecastCoefs]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasterCoefs]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs]
    ADD DEFAULT (CONVERT([bit],(0))) FOR [IsBought];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasterCoefs]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs]
    ADD DEFAULT ((0)) FOR [Points];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasterCoefs]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasterCoefs]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasters]...';


GO
ALTER TABLE [dbo].[UserForecasters]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasters]...';


GO
ALTER TABLE [dbo].[UserForecasters]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasts]...';


GO
ALTER TABLE [dbo].[UserForecasts]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserForecasts]...';


GO
ALTER TABLE [dbo].[UserForecasts]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserLinks]...';


GO
ALTER TABLE [dbo].[UserLinks]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserLinks]...';


GO
ALTER TABLE [dbo].[UserLinks]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserPrizes]...';


GO
ALTER TABLE [dbo].[UserPrizes]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserPrizes]...';


GO
ALTER TABLE [dbo].[UserPrizes]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserPromos]...';


GO
ALTER TABLE [dbo].[UserPromos]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserPromos]...';


GO
ALTER TABLE [dbo].[UserPromos]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserQuests]...';


GO
ALTER TABLE [dbo].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [StateUpdatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserQuests]...';


GO
ALTER TABLE [dbo].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [ProgressUpdatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserQuests]...';


GO
ALTER TABLE [dbo].[UserQuests]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserQuests]...';


GO
ALTER TABLE [dbo].[UserQuests]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Users]...';


GO
ALTER TABLE [dbo].[Users]
    ADD DEFAULT (sysutcdatetime()) FOR [CreatedUtc];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Users]...';


GO
ALTER TABLE [dbo].[Users]
    ADD DEFAULT (sysdatetime()) FOR [Created];


GO
PRINT N'Creating Foreign Key [qst].[FK_QBets_QuestId]...';


GO
ALTER TABLE [qst].[QBets] WITH NOCHECK
    ADD CONSTRAINT [FK_QBets_QuestId] FOREIGN KEY ([QuestId]) REFERENCES [dbo].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [qst].[FK_QBets_QuestType]...';


GO
ALTER TABLE [qst].[QBets] WITH NOCHECK
    ADD CONSTRAINT [FK_QBets_QuestType] FOREIGN KEY ([QuestType]) REFERENCES [qst].[QuestTypes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Banners_Files_ImageId]...';


GO
ALTER TABLE [dbo].[Banners] WITH NOCHECK
    ADD CONSTRAINT [FK_Banners_Files_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Banners_Files_MobileImageId]...';


GO
ALTER TABLE [dbo].[Banners] WITH NOCHECK
    ADD CONSTRAINT [FK_Banners_Files_MobileImageId] FOREIGN KEY ([MobileImageId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Coefs_Markets_MarketId]...';


GO
ALTER TABLE [dbo].[Coefs] WITH NOCHECK
    ADD CONSTRAINT [FK_Coefs_Markets_MarketId] FOREIGN KEY ([MarketId]) REFERENCES [dbo].[Markets] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Events_EventSportTypes_SportTypeId]...';


GO
ALTER TABLE [dbo].[Events] WITH NOCHECK
    ADD CONSTRAINT [FK_Events_EventSportTypes_SportTypeId] FOREIGN KEY ([SportTypeId]) REFERENCES [dbo].[EventSportTypes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_EventSportTypes_Files_FileId]...';


GO
ALTER TABLE [dbo].[EventSportTypes] WITH NOCHECK
    ADD CONSTRAINT [FK_EventSportTypes_Files_FileId] FOREIGN KEY ([FileId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_ExpressCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [dbo].[ExpressCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_ExpressCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [dbo].[Coefs] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_ExpressCoefs_Expresses_ExpressId]...';


GO
ALTER TABLE [dbo].[ExpressCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_ExpressCoefs_Expresses_ExpressId] FOREIGN KEY ([ExpressId]) REFERENCES [dbo].[Expresses] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Expresses_Events_EventId]...';


GO
ALTER TABLE [dbo].[Expresses] WITH NOCHECK
    ADD CONSTRAINT [FK_Expresses_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_ForecasterEvents_Events_EventId]...';


GO
ALTER TABLE [dbo].[ForecasterEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_ForecasterEvents_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Forecasts_Events_EventId]...';


GO
ALTER TABLE [dbo].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_Forecasts_Events_ReservedEventId]...';


GO
ALTER TABLE [dbo].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_ReservedEventId] FOREIGN KEY ([ReservedEventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Forecasts_Events_SelectedEventId]...';


GO
ALTER TABLE [dbo].[Forecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_Forecasts_Events_SelectedEventId] FOREIGN KEY ([SelectedEventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_HistoryItems_AutoRatings_AutoRatingId]...';


GO
ALTER TABLE [dbo].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_AutoRatings_AutoRatingId] FOREIGN KEY ([AutoRatingId]) REFERENCES [dbo].[AutoRatings] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_HistoryItems_UserForecasters_UserForecasterId]...';


GO
ALTER TABLE [dbo].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserForecasters_UserForecasterId] FOREIGN KEY ([UserForecasterId]) REFERENCES [dbo].[UserForecasters] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_HistoryItems_UserForecasts_UserForecastId]...';


GO
ALTER TABLE [dbo].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserForecasts_UserForecastId] FOREIGN KEY ([UserForecastId]) REFERENCES [dbo].[UserForecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_HistoryItems_UserQuests_UserQuestId]...';


GO
ALTER TABLE [dbo].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_UserQuests_UserQuestId] FOREIGN KEY ([UserQuestId]) REFERENCES [dbo].[UserQuests] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_HistoryItems_Users_UserId]...';


GO
ALTER TABLE [dbo].[HistoryItems] WITH NOCHECK
    ADD CONSTRAINT [FK_HistoryItems_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_LotteryEvents_Events_EventId]...';


GO
ALTER TABLE [dbo].[LotteryEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_LotteryEvents_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_LotteryEvents_Lotteries_LotteryId]...';


GO
ALTER TABLE [dbo].[LotteryEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_LotteryEvents_Lotteries_LotteryId] FOREIGN KEY ([LotteryId]) REFERENCES [dbo].[Lotteries] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Markets_Events_EventId]...';


GO
ALTER TABLE [dbo].[Markets] WITH NOCHECK
    ADD CONSTRAINT [FK_Markets_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_PrizePlaces_Prizes_PrizeId]...';


GO
ALTER TABLE [dbo].[PrizePlaces] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizePlaces_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [dbo].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Prizes_Files_ImageAltId]...';


GO
ALTER TABLE [dbo].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_Files_ImageAltId] FOREIGN KEY ([ImageAltId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Prizes_Files_ImageId]...';


GO
ALTER TABLE [dbo].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_Files_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Prizes_PromoCategories_PromoCategoryId]...';


GO
ALTER TABLE [dbo].[Prizes] WITH NOCHECK
    ADD CONSTRAINT [FK_Prizes_PromoCategories_PromoCategoryId] FOREIGN KEY ([PromoCategoryId]) REFERENCES [dbo].[PromoCategories] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_PrizeScales_Files_ImageActiveId]...';


GO
ALTER TABLE [dbo].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Files_ImageActiveId] FOREIGN KEY ([ImageActiveId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_PrizeScales_Files_ImageId]...';


GO
ALTER TABLE [dbo].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Files_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Files] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_PrizeScales_Prizes_PrizeId]...';


GO
ALTER TABLE [dbo].[PrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_PrizeScales_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [dbo].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Promos_PromoCategories_CategoryId]...';


GO
ALTER TABLE [dbo].[Promos] WITH NOCHECK
    ADD CONSTRAINT [FK_Promos_PromoCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[PromoCategories] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Quests_Prizes_PrizeId]...';


GO
ALTER TABLE [dbo].[Quests] WITH NOCHECK
    ADD CONSTRAINT [FK_Quests_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [dbo].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Quests_Quests_DoAfterQuestId]...';


GO
ALTER TABLE [dbo].[Quests] WITH NOCHECK
    ADD CONSTRAINT [FK_Quests_Quests_DoAfterQuestId] FOREIGN KEY ([DoAfterQuestId]) REFERENCES [dbo].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Settings_SettingTypes_SettingTypeId]...';


GO
ALTER TABLE [dbo].[Settings] WITH NOCHECK
    ADD CONSTRAINT [FK_Settings_SettingTypes_SettingTypeId] FOREIGN KEY ([SettingTypeId]) REFERENCES [dbo].[SettingTypes] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecastCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [dbo].[Coefs] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecastCoefs_Expresses_ExpressId]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Expresses_ExpressId] FOREIGN KEY ([ExpressId]) REFERENCES [dbo].[Expresses] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecastCoefs_Markets_MarketId]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_Markets_MarketId] FOREIGN KEY ([MarketId]) REFERENCES [dbo].[Markets] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecastCoefs_UserForecasts_UserForecastId]...';


GO
ALTER TABLE [dbo].[UserForecastCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecastCoefs_UserForecasts_UserForecastId] FOREIGN KEY ([UserForecastId]) REFERENCES [dbo].[UserForecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecasterCoefs_Coefs_CoefId]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_Coefs_CoefId] FOREIGN KEY ([CoefId]) REFERENCES [dbo].[Coefs] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecasterCoefs_UserForecasters_UserForecasterId]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_UserForecasters_UserForecasterId] FOREIGN KEY ([UserForecasterId]) REFERENCES [dbo].[UserForecasters] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecasterCoefs_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserForecasterCoefs] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasterCoefs_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecasts_Forecasts_ForecastId]...';


GO
ALTER TABLE [dbo].[UserForecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasts_Forecasts_ForecastId] FOREIGN KEY ([ForecastId]) REFERENCES [dbo].[Forecasts] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserForecasts_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserForecasts] WITH NOCHECK
    ADD CONSTRAINT [FK_UserForecasts_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserLinks_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserLinks] WITH NOCHECK
    ADD CONSTRAINT [FK_UserLinks_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizes_Prizes_PrizeId]...';


GO
ALTER TABLE [dbo].[UserPrizes] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizes_Prizes_PrizeId] FOREIGN KEY ([PrizeId]) REFERENCES [dbo].[Prizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizes_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserPrizes] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizes_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId]...';


GO
ALTER TABLE [dbo].[UserPrizeScaleDraws] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId] FOREIGN KEY ([PrizeScaleId]) REFERENCES [dbo].[PrizeScales] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizeScaleDraws_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserPrizeScaleDraws] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScaleDraws_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizeScales_PrizeScales_PrizeScaleId]...';


GO
ALTER TABLE [dbo].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_PrizeScales_PrizeScaleId] FOREIGN KEY ([PrizeScaleId]) REFERENCES [dbo].[PrizeScales] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizeScales_UserPrizes_UserPrizeId]...';


GO
ALTER TABLE [dbo].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_UserPrizes_UserPrizeId] FOREIGN KEY ([UserPrizeId]) REFERENCES [dbo].[UserPrizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPrizeScales_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserPrizeScales] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPrizeScales_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPromos_Promos_PromoId]...';


GO
ALTER TABLE [dbo].[UserPromos] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPromos_Promos_PromoId] FOREIGN KEY ([PromoId]) REFERENCES [dbo].[Promos] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserPromos_UserPrizes_UserPrizeId]...';


GO
ALTER TABLE [dbo].[UserPromos] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPromos_UserPrizes_UserPrizeId] FOREIGN KEY ([UserPrizeId]) REFERENCES [dbo].[UserPrizes] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserQuests_Quests_QuestId]...';


GO
ALTER TABLE [dbo].[UserQuests] WITH NOCHECK
    ADD CONSTRAINT [FK_UserQuests_Quests_QuestId] FOREIGN KEY ([QuestId]) REFERENCES [dbo].[Quests] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserQuests_Users_UserId]...';


GO
ALTER TABLE [dbo].[UserQuests] WITH NOCHECK
    ADD CONSTRAINT [FK_UserQuests_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]);


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
	inner join dbo.UserLinks u with(forceseek) on u.Id=s.AccountId
	inner join qst.QBets t on t.QuestType=s.QuestType
	inner join dbo.UserQuests uq with(forceseek) on uq.UserId=u.UserId
	inner join dbo.Quests q with(forceseek) on q.Id=uq.QuestId
		and q.QuestTypeId=s.QuestType
		and t.QuestId=q.Id
	where
		s.BetSum>=t.BetSum
		and s.CoefValue>=t.BetCoef
		and uq.State=1
	group by uq.Id
end
GO
PRINT N'Creating Procedure [qst].[calc_forecasts]...';


GO

-------------------------------------------------------------------------------
-- Подсчет прогресса квестов по прогнозам
-------------------------------------------------------------------------------
create procedure qst.calc_forecasts
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
	from dbo.UserForecasts u
	inner join dbo.Forecasts f on f.Id=u.ForecastId
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
	from dbo.UserForecasts u
	inner join dbo.UserForecastCoefs fc on fc.UserForecastId=u.Id
	inner join dbo.Coefs c on c.Id= fc.CoefId
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
		from dbo.UserForecasts uf
		inner join dbo.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join dbo.Expresses x on x.Id=fc.ExpressId
		inner join dbo.Coefs c on c.Id= fc.CoefId
		where uf.Id in (
			select distinct ff.UserForecastId
			from dbo.UserForecastCoefs ff
			inner join dbo.Coefs cc on cc.Id= ff.CoefId
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
		from dbo.UserForecasts uf
		inner join dbo.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join dbo.Expresses x on x.Id=fc.ExpressId
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
		from dbo.UserForecasts uf
		inner join dbo.UserForecastCoefs fc on fc.UserForecastId=uf.Id
		inner join dbo.Expresses x on x.Id=fc.ExpressId
		inner join dbo.Coefs c on c.Id= fc.CoefId
		where uf.Id in (
			-- прогнозы, у которых есть выигравшие исходы
			select distinct ff.UserForecastId
			from dbo.UserForecastCoefs ff
			inner join dbo.Coefs cc on cc.Id= ff.CoefId
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
	inner join dbo.UserQuests uq with(forceseek) on uq.UserId=a.UserId 
	inner join dbo.Quests q with(forceseek) on q.Id=uq.QuestId
		and q.QuestTypeId=a.QuestTypeId
	where
		uq.State=1

	drop table #amount
end
GO
PRINT N'Creating Procedure [qst].[calc_deposits]...';


GO

-------------------------------------------------------------------------------
-- Подсчет выполнения квестов по депозитам
-- Заменить в 1 месте название БД BaltbetM на актуальное
-------------------------------------------------------------------------------
create procedure qst.calc_deposits
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
inner join dbo.UserLinks u with(forceseek) on u.Id=s.AccountId
inner join dbo.UserQuests uq with(forceseek) on uq.UserId=u.UserId and uq.State=1
inner join dbo.Quests q with(forceseek) on q.Id=uq.QuestId and q.QuestTypeId=401
group by uq.Id
end
GO
PRINT N'Creating Procedure [qst].[update_quests]...';


GO

-------------------------------------------------------------------------------
-- Обновление соcтояния квестов (запускается периодически)
-------------------------------------------------------------------------------
create procedure qst.update_quests
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
	from dbo.UserLinks u
	inner join dbo.UserQuests uq on uq.UserId=u.UserId and uq.State=1
	inner join dbo.Quests q on q.Id=uq.QuestId and q.QuestTypeId=1

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
	from dbo.Users u
	inner join (
		select Id, UserId
		from dbo.UserQuests
		where QuestId in (select Id from dbo.Quests where QuestTypeId=302)
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
	inner join dbo.UserQuests uq on uq.Id=p.UserQuestId
	inner join dbo.Quests q on q.Id=uq.QuestId
	left join dbo.Quests lq on lq.Id=q.DoAfterQuestId
	left join dbo.UserQuests luq on luq.QuestId=lq.Id and luq.UserId=uq.UserId
	where luq.State=3 or q.DoAfterQuestId is null

	drop table #progress

	update qst.UpdateTime set LastUpdateTimeUtc = @end_time_utc
end
GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [qst].[QBets] WITH CHECK CHECK CONSTRAINT [FK_QBets_QuestId];

ALTER TABLE [qst].[QBets] WITH CHECK CHECK CONSTRAINT [FK_QBets_QuestType];

ALTER TABLE [dbo].[Banners] WITH CHECK CHECK CONSTRAINT [FK_Banners_Files_ImageId];

ALTER TABLE [dbo].[Banners] WITH CHECK CHECK CONSTRAINT [FK_Banners_Files_MobileImageId];

ALTER TABLE [dbo].[Coefs] WITH CHECK CHECK CONSTRAINT [FK_Coefs_Markets_MarketId];

ALTER TABLE [dbo].[Events] WITH CHECK CHECK CONSTRAINT [FK_Events_EventSportTypes_SportTypeId];

ALTER TABLE [dbo].[EventSportTypes] WITH CHECK CHECK CONSTRAINT [FK_EventSportTypes_Files_FileId];

ALTER TABLE [dbo].[ExpressCoefs] WITH CHECK CHECK CONSTRAINT [FK_ExpressCoefs_Coefs_CoefId];

ALTER TABLE [dbo].[ExpressCoefs] WITH CHECK CHECK CONSTRAINT [FK_ExpressCoefs_Expresses_ExpressId];

ALTER TABLE [dbo].[Expresses] WITH CHECK CHECK CONSTRAINT [FK_Expresses_Events_EventId];

ALTER TABLE [dbo].[ForecasterEvents] WITH CHECK CHECK CONSTRAINT [FK_ForecasterEvents_Events_EventId];

ALTER TABLE [dbo].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_EventId];

ALTER TABLE [dbo].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_ReservedEventId];

ALTER TABLE [dbo].[Forecasts] WITH CHECK CHECK CONSTRAINT [FK_Forecasts_Events_SelectedEventId];

ALTER TABLE [dbo].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_AutoRatings_AutoRatingId];

ALTER TABLE [dbo].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserForecasters_UserForecasterId];

ALTER TABLE [dbo].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserForecasts_UserForecastId];

ALTER TABLE [dbo].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_UserQuests_UserQuestId];

ALTER TABLE [dbo].[HistoryItems] WITH CHECK CHECK CONSTRAINT [FK_HistoryItems_Users_UserId];

ALTER TABLE [dbo].[LotteryEvents] WITH CHECK CHECK CONSTRAINT [FK_LotteryEvents_Events_EventId];

ALTER TABLE [dbo].[LotteryEvents] WITH CHECK CHECK CONSTRAINT [FK_LotteryEvents_Lotteries_LotteryId];

ALTER TABLE [dbo].[Markets] WITH CHECK CHECK CONSTRAINT [FK_Markets_Events_EventId];

ALTER TABLE [dbo].[PrizePlaces] WITH CHECK CHECK CONSTRAINT [FK_PrizePlaces_Prizes_PrizeId];

ALTER TABLE [dbo].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_Files_ImageAltId];

ALTER TABLE [dbo].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_Files_ImageId];

ALTER TABLE [dbo].[Prizes] WITH CHECK CHECK CONSTRAINT [FK_Prizes_PromoCategories_PromoCategoryId];

ALTER TABLE [dbo].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Files_ImageActiveId];

ALTER TABLE [dbo].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Files_ImageId];

ALTER TABLE [dbo].[PrizeScales] WITH CHECK CHECK CONSTRAINT [FK_PrizeScales_Prizes_PrizeId];

ALTER TABLE [dbo].[Promos] WITH CHECK CHECK CONSTRAINT [FK_Promos_PromoCategories_CategoryId];

ALTER TABLE [dbo].[Quests] WITH CHECK CHECK CONSTRAINT [FK_Quests_Prizes_PrizeId];

ALTER TABLE [dbo].[Quests] WITH CHECK CHECK CONSTRAINT [FK_Quests_Quests_DoAfterQuestId];

ALTER TABLE [dbo].[Settings] WITH CHECK CHECK CONSTRAINT [FK_Settings_SettingTypes_SettingTypeId];

ALTER TABLE [dbo].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Coefs_CoefId];

ALTER TABLE [dbo].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Expresses_ExpressId];

ALTER TABLE [dbo].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_Markets_MarketId];

ALTER TABLE [dbo].[UserForecastCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecastCoefs_UserForecasts_UserForecastId];

ALTER TABLE [dbo].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_Coefs_CoefId];

ALTER TABLE [dbo].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_UserForecasters_UserForecasterId];

ALTER TABLE [dbo].[UserForecasterCoefs] WITH CHECK CHECK CONSTRAINT [FK_UserForecasterCoefs_Users_UserId];

ALTER TABLE [dbo].[UserForecasts] WITH CHECK CHECK CONSTRAINT [FK_UserForecasts_Forecasts_ForecastId];

ALTER TABLE [dbo].[UserForecasts] WITH CHECK CHECK CONSTRAINT [FK_UserForecasts_Users_UserId];

ALTER TABLE [dbo].[UserLinks] WITH CHECK CHECK CONSTRAINT [FK_UserLinks_Users_UserId];

ALTER TABLE [dbo].[UserPrizes] WITH CHECK CHECK CONSTRAINT [FK_UserPrizes_Prizes_PrizeId];

ALTER TABLE [dbo].[UserPrizes] WITH CHECK CHECK CONSTRAINT [FK_UserPrizes_Users_UserId];

ALTER TABLE [dbo].[UserPrizeScaleDraws] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScaleDraws_PrizeScales_PrizeScaleId];

ALTER TABLE [dbo].[UserPrizeScaleDraws] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScaleDraws_Users_UserId];

ALTER TABLE [dbo].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_PrizeScales_PrizeScaleId];

ALTER TABLE [dbo].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_UserPrizes_UserPrizeId];

ALTER TABLE [dbo].[UserPrizeScales] WITH CHECK CHECK CONSTRAINT [FK_UserPrizeScales_Users_UserId];

ALTER TABLE [dbo].[UserPromos] WITH CHECK CHECK CONSTRAINT [FK_UserPromos_Promos_PromoId];

ALTER TABLE [dbo].[UserPromos] WITH CHECK CHECK CONSTRAINT [FK_UserPromos_UserPrizes_UserPrizeId];

ALTER TABLE [dbo].[UserQuests] WITH CHECK CHECK CONSTRAINT [FK_UserQuests_Quests_QuestId];

ALTER TABLE [dbo].[UserQuests] WITH CHECK CHECK CONSTRAINT [FK_UserQuests_Users_UserId];


GO
PRINT N'Update complete.';


GO
