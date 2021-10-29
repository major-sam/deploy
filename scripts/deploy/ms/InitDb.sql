SET IDENTITY_INSERT mkt.Users ON

INSERT INTO [mkt].[Users]
	([Id]
	,[Code]
	,[Name]
	,[Password]
	,[Salt]
	,[Phone]
	,[Email]
	,[CreationTime]
	,[LastLogin]
	,[Activated])
VALUES
    -- Пароль 111111
	(1, 903, 'Administrator', 0x32A0AFBBAB1657B3F8AE6A38A4F2238FEC7B6C95CF3CF543C29332E76B74B4E7, 0x139CD7B357CDB97785AAEEFAFD240CBB, '+79111234567', '', GETDATE(), null, 1)

SET IDENTITY_INSERT mkt.Users OFF