-- ****************************************************************************
-- Пользователи
-- ****************************************************************************
SET IDENTITY_INSERT dbo.Users ON

INSERT INTO [dbo].[Users]
	([Id]
	,[Code]
	,[Name]
	,[Password]
	,[Salt]
	,[Phone]
	,[Email]
	,[CreationTime]
	,[LastLogin]
	,[Activated]
	,[SmsConfirmed])
VALUES
    -- Пароль 111111
	(1, 903, 'Administrator', 0x32A0AFBBAB1657B3F8AE6A38A4F2238FEC7B6C95CF3CF543C29332E76B74B4E7, 0x139CD7B357CDB97785AAEEFAFD240CBB, '+79111234567', '', GETDATE(), null, 1, 1)

SET IDENTITY_INSERT dbo.Users OFF

go

-- ****************************************************************************
-- Баннеры
-- ****************************************************************************
INSERT INTO [dbo].[Banners]
           ([Name]
           ,[Link]
           ,[Active]
           ,[NewTab]
           ,[DateStart]
           ,[DateEnd]
           ,[BannerContent]
           ,[ButtonContent])
     VALUES
           ('Домашная страница'
           ,'info/news'
           ,1
           ,0
           ,'20211010'
           ,'20210909'
           ,'Default content'
           ,'Подробнее')

go

-- ****************************************************************************
-- Статические страницы
-- ****************************************************************************
INSERT INTO dbo.[StaticPages]
	([Id]
	,[Title]
	,[Content])
VALUES    
	(1, 'Об акции', '<h1>Deafult page</h1>'),
	(2, 'Политика конфиденциальности', '<h1>Deafult page</h1>'),
	(3, 'Помощь', '<h1>Deafult page</h1>'),
	(4, 'Пользовательское соглашение', '<h1>Deafult page</h1>'),
	(5, 'Правила акции', '<h1>Deafult page</h1>'),
	(6, 'Лучший прогнозист', '<h1>Deafult page</h1>'),
	(7, 'О купонах', '<h1>Deafult page</h1>')

go

-- ****************************************************************************
-- Промокоды и призы
-- ****************************************************************************
-- PromoCategories
SET IDENTITY_INSERT dbo.PromoCategories ON

declare @i int = 1
while (@i <= 100)
begin
  insert into dbo.PromoCategories (Id, Name) values (@i, 'C' + cast(@i as nvarchar(5)))
  set @i = @i + 1
end

SET IDENTITY_INSERT dbo.PromoCategories OFF

-- Prizes
SET IDENTITY_INSERT dbo.Prizes ON

set @i = 1
while (@i <= 100)
begin
  declare @name nvarchar(100) = N'Промо' + cast(@i as nvarchar(5)) 

  insert into dbo.Prizes (Id, Type, Name, Title, Description, ImageId, ImageAltId, Points, Count, UserCount, PromoCategoryId, StartDate)
  values (@i, 'Auto', @name, @name, @name, null, null, 1000000, 1000, 1000, @i, getdate())

  set @i = @i + 1
end

SET IDENTITY_INSERT dbo.Prizes OFF

go

declare @i int = 1
while (@i <= 100)
begin
  declare @j int = 1
  while (@j <= 10)
  begin
    declare @promo nvarchar(100) = 'PROMO' + cast(@j as nvarchar(5)) + 'C' + cast(@i as nvarchar(5))

    insert into dbo.Promos(Name, CategoryId, OrderInCategory, ExpirationDate, GlobalPromoId)
    values (@promo, @i, @j, '2099-01-01', (@i - 1) * 10 + @j) -- GlobalPromoId = @i - 1) * 10 + @j - идентификатор промокода с кернела.

    set @j = @j + 1
  end

  set @i = @i + 1
end

go

-- ****************************************************************************
-- Квесты
-- ****************************************************************************
-------------------------------------------------------------------------------
-- Инициализация квестов.
-------------------------------------------------------------------------------

if not exists(select top 1 1 from dbo.Quests)
begin
	-- Цепочка 1
	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 1, N'Зарегистрироваться и привязать аккаунт БалтБет', N'Зарегистрироваться и привязать аккаунт БалтБет', 'Описание 1', 1, null, 1, null, 100, 0)

	declare @start_id int = @@identity

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 2, N'Поставить 1 золотых прогнозов', N'Поставить 1 золотых прогнозов', 'Описание 2', 204, @start_id, 1, null, 0, 200)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 3, N'Поставить 2 прогнозов "мне повезёт 3"', N'Поставить 2 прогнозов "мне повезёт 3"', 'Описание 3', 208, @@identity, 2, 1, 200, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 4, N'Поставить 3 золотых прогнозов', N'Поставить 3 золотых прогнозов', 'Описание 4', 204, @@identity, 3, null, 300, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 5, N'Поставить 2 прогнозов "мне повезёт 3"', N'Поставить 2 прогнозов "мне повезёт 3"', 'Описание 5', 208, @@identity, 2, null, 200, 200)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 6, N'Поставить 1 золотых прогнозов', N'Поставить 1 золотых прогнозов', 'Описание 6', 204, @@identity, 1, null, 500, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 7, N'Поставить 2 прогнозов "мне повезёт 3"', N'Поставить 2 прогнозов "мне повезёт 3"', 'Описание 7', 208, @@identity, 2, null, 0, 600)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 8, N'Поставить 3 золотых прогнозов', N'Поставить 3 золотых прогнозов', 'Описание 8', 204, @@identity, 3, null, 800, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 9, N'Поставить 2 прогнозов "мне повезёт 3"', N'Поставить 2 прогнозов "мне повезёт 3"', 'Описание 9', 208, @@identity, 2, 1, 500, 500)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 10, N'Поставить 1 золотых прогнозов', N'Поставить 1 золотых прогнозов', 'Описание 10', 204, @@identity, 1, null, 0, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (1, null, 11, N'Поставить 2 прогнозов "мне повезёт 3"', N'Поставить 2 прогнозов "мне повезёт 3"', 'Описание 11', 208, @@identity, 2, 1, 0, 1000)

	-- Цепочка 2
	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 1, N'Поставить 3 серебряных прогнозов', N'Поставить 3 серебряных прогнозов', 'Описание 12', 203, @start_id, 3, 2, 0, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 2, N'Поставить 2 прогнозов "мне повезёт 2"', N'Поставить 2 прогнозов "мне повезёт 2"', 'Описание 13', 207, @@identity, 2, null, 300, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 3, N'Поставить 1 серебряных прогнозов', N'Поставить 1 серебряных прогнозов', 'Описание 14', 203, @@identity, 1, null, 250, 150)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 4, N'Поставить 2 прогнозов "мне повезёт 2"', N'Поставить 2 прогнозов "мне повезёт 2"', 'Описание 15', 207, @@identity, 2, null, 400, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 5, N'Поставить 3 серебряных прогнозов', N'Поставить 3 серебряных прогнозов', 'Описание 16', 203, @@identity, 3, null, 0, 500)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 6, N'Поставить 2 прогнозов "мне повезёт 2"', N'Поставить 2 прогнозов "мне повезёт 2"', 'Описание 17', 207, @@identity, 2, 2, 0, 600)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 7, N'Поставить 1 серебряных прогнозов', N'Поставить 1 серебряных прогнозов', 'Описание 18', 203, @@identity, 1, null, 300, 700)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 8, N'Поставить 2 прогнозов "мне повезёт 2"', N'Поставить 2 прогнозов "мне повезёт 2"', 'Описание 19', 207, @@identity, 2, null, 1000, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 9, N'Поставить 3 серебряных прогнозов', N'Поставить 3 серебряных прогнозов', 'Описание 20', 203, @@identity, 3, 2, 800, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (2, null, 10, N'Поставить 2 прогнозов "мне повезёт 2"', N'Поставить 2 прогнозов "мне повезёт 2"', 'Описание 21', 207, @@identity, 2, null, 1000, 500)

	-- Цепочка 3
	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 1, N'Поставить 2 бронзовых прогнозов', N'Поставить 2 бронзовых прогнозов', 'Описание 22', 202, @start_id, 2, null, 100, 100)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 2, N'Поставить 1 прогнозов "мне повезёт 1"', N'Поставить 1 прогнозов "мне повезёт 1"', 'Описание 23', 206, @@identity, 1, null, 200, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 3, N'Поставить 2 бронзовых прогнозов', N'Поставить 2 бронзовых прогнозов', 'Описание 24', 202, @@identity, 2, 3, 0, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 4, N'Поставить 3 прогнозов "мне повезёт 1"', N'Поставить 3 прогнозов "мне повезёт 1"', 'Описание 25', 206, @@identity, 3, null, 300, 200)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 5, N'Поставить 2 бронзовых прогнозов', N'Поставить 2 бронзовых прогнозов', 'Описание 26', 202, @@identity, 2, null, 0, 400)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 6, N'Поставить 1 прогнозов "мне повезёт 1"', N'Поставить 1 прогнозов "мне повезёт 1"', 'Описание 27', 206, @@identity, 1, null, 0, 500)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 7, N'Поставить 2 бронзовых прогнозов', N'Поставить 2 бронзовых прогнозов', 'Описание 28', 202, @@identity, 2, 3, 300, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 8, N'Поставить 3 прогнозов "мне повезёт 1"', N'Поставить 3 прогнозов "мне повезёт 1"', 'Описание 29', 206, @@identity, 3, 3, 700, 0)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 9, N'Поставить 2 бронзовых прогнозов', N'Поставить 2 бронзовых прогнозов', 'Описание 30', 202, @@identity, 2, null, 600, 200)

	insert into dbo.Quests (Cell, Date, OrderInCell, Name, Comment, PrizeComment, QuestTypeId, DoAfterQuestId, ProgressTarget, PrizeId, GamePoints, PrizePoints)
    values (3, null, 10, N'Поставить 1 прогнозов "мне повезёт 1"', N'Поставить 1 прогнозов "мне повезёт 1"', 'Описание 31', 206, @@identity, 1, null, 400, 300)
end

-- Последнее время обновления прогресса
if not exists(select top 1 1 from qst.UpdateTime)
begin
  insert into qst.UpdateTime values(getdate())
end

-- Типы квестов
if not exists(select top 1 1 from qst.QuestTypes)
begin
  	insert into qst.QuestTypes values
		(1, N'Зарегистрироваться и привязать аккаунт БалтБет', ''),
		(102, N'Совершить N одиночных ставок с коэффициентом больше K и сумой больше M рублей', ''),
		(103, N'Совершить ставку на Суперэкспресс на сумму больше M рублей', ''),
		(104, N'Поставить N систем с коэффициентом больше K и сумой больше M рублей', ''),
		(105, N'Выиграть N ставок с коэффициентом больше K и сумой больше M рублей', ''),
		(106, N'Пополните баланс сайта или клиентского рабочего места на сумму от M рублей', ''),
		(201, N'Поставить N прогнозов', ''),
		(202, N'Поставить N бронзовых прогнозов', ''),
		(203, N'Поставить N серебряных прогнозов', ''),
		(204, N'Поставить N золотых прогнозов', ''),
		(205, N'Выиграть N прогнозов', ''),
		(206, N'Поставить N прогнозов "мне повезёт 1', ''),
		(207, N'Поставить N прогнозов "мне повезёт 2', ''),
		(208, N'Поставить N прогнозов "мне повезёт 3', ''),
		(209, N'Выиграть N прогнозов "мне повезёт 1', ''),
		(210, N'Выиграть N прогнозов "мне повезёт 2', ''),
		(211, N'Выиграть N прогнозов "мне повезёт 3', '')
end