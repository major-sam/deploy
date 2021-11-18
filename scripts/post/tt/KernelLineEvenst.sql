use BaltBetM
SET QUOTED_IDENTIFIER ON
go
---КОПИРОВАНИЕ СПРАВОЧНЫХ ДАННЫХ---
EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
exec sp_msforeachtable "ALTER TABLE ? DISABLE TRIGGER  all"
go
--Очистка событий--
DELETE FROM EventGroupMembers 
go
DELETE FROM EventGroups
go
delete from eventbind
go
delete from coefs where LineID <>1
go
delete from EventMembers where LineID <>1
go
delete from events where LineID <>1
go
--Окончание очистки событий--
delete from EventTCoefTBind
go
delete from LineMemberBind
go
DELETE FROM EventResults
go
delete from coeftypes
go
delete from LineMembers
go
delete from Federations
go
delete from EventTypes
go
delete from market
go
set IDENTITY_INSERT MARKEt ON
insert into Market(ID, Name, IsMain, EventTypeID, SuperMarketID, SortOrder, BindDate, UserBindID, FactTypeKindId,MarketKindId,MarketMergeTypeId)
select ID, Name, IsMain, EventTypeID, SuperMarketID, SortOrder, BindDate, UserBindID, FactTypeKindId,MarketKindId,MarketMergeTypeId 
from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.Market
set IDENTITY_INSERT MARKEt OFF
go
insert into LineMemberBind
select ct.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.LineMemberBind ct
GO
insert into EventTCoefTBind
select ct.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.EventTCoefTBind ct
GO
insert into CoefTypes
select ct.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.CoefTypes ct
GO
INSERT INTO LineMembers
SELECT lm.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.LineMembers lm
GO
set IDENTITY_INSERT Federations ON
insert into Federations(ID,Name)
select ID, Name from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.Federations
set IDENTITY_INSERT Federations OFF
GO
insert into EventTypes
select ket.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.EventTypes ket
GO
exec sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
go
sp_msforeachtable @command1="print '?'", @command2="ALTER TABLE ? ENABLE TRIGGER  all"
go
---КОНЕЦ КОПИРОВАНИЯ СПРАВОЧНЫХ ДАННЫХ---

---Копирование событий---
insert into dbo.Events ([LineID],
	[LineMemberId],
	[WorkerId],
	[EventCreationTime],
	[EventStartTime],
	[EventActive],
	[EventFinished],
	[EventResultText],
	[MaxBetLimit],
	[MinBetLimit],
	[MaxBetAddLimit],
	[EventComment],
	[MinExpressCount],
	[MaxExpressCount],
	[ResultComment],
	[TopEvent],
	[EventScore],
	[EventPosition],
	[EventTV],
	[EventSource],
	[CommentMemberId],
	[ResultCommentMemberId],
	[InfoMemberId],
	[Live],
	[EventTypeGroupID],
	[EventName],
	[MarketGroupID],
	[ClientShow],
	[EventGroupId],
	[CommentVisibility],
	[InfoVisibility],
	[PlaceMemeberId],
	[StageMemeberId],
	[ResultFirstMemeberId],
	[FormatMemeberId],
	[ResultBatchMemeberId],
	[AdditionalTermsMemeberId],
	[LongLifeCoefs],
	[AcceptAllBets],
	[TranslateId],
	[BetStartDate],
	[BetEndDate],
	[IsBetFinished],
	[EventTypeID])
select [LineID],
	[LineMemberId],
	[WorkerId],
	[EventCreationTime],
	[EventStartTime],
	[EventActive],
	[EventFinished],
	[EventResultText],
	[MaxBetLimit],
	[MinBetLimit],
	[MaxBetAddLimit],
	[EventComment],
	[MinExpressCount],
	[MaxExpressCount],
	[ResultComment],
	[TopEvent],
	[EventScore],
	[EventPosition],
	[EventTV],
	[EventSource],
	[CommentMemberId],
	[ResultCommentMemberId],
	[InfoMemberId],
	[Live],
	[EventTypeGroupID],
	[EventName],
	[MarketGroupID],
	[ClientShow],
	[EventGroupId],
	[CommentVisibility],
	[InfoVisibility],
	[PlaceMemeberId],
	[StageMemeberId],
	[ResultFirstMemeberId],
	[FormatMemeberId],
	[ResultBatchMemeberId],
	[AdditionalTermsMemeberId],
	[LongLifeCoefs],
	[AcceptAllBets],
	[TranslateId],
	[BetStartDate],
	[BetEndDate],
	[IsBetFinished],
	[EventTypeID] 
from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.Events ct 
where ct.EventStartTime>=getdate() and ct.Live=0
go
insert into EventMembers
select ct.* from [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.EventMembers ct
INNER JOIN [srvapkbb3.gkbaltbet.local].BaltBetM.dbo.Events ev on ct.LineID = ev.LineID
where ev.EVENTSTARTTIME > GETDATE() AND ev.Live = 0