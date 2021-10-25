                                                                                 
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[0].Amount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[0].Amount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'AccountSettings.DefaultBetAdditionalAmountsContainer[0].Amount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[1].Amount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 500
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[1].Amount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'AccountSettings.DefaultBetAdditionalAmountsContainer[1].Amount', 500, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[2].Amount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'AccountSettings.DefaultBetAdditionalAmountsContainer[2].Amount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'AccountSettings.DefaultBetAdditionalAmountsContainer[2].Amount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'AccountSettings.IsAdditionalBetAmountEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'AccountSettings.IsAdditionalBetAmountEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'AccountSettings.IsAdditionalBetAmountEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'AccountSettings.MaxAdditionalBetAmountCount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 3
    WHERE Name = 'AccountSettings.MaxAdditionalBetAmountCount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'AccountSettings.MaxAdditionalBetAmountCount', 3, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'BetsSettings.IsDuplicateBetCheckEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'BetsSettings.IsDuplicateBetCheckEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'BetsSettings.IsDuplicateBetCheckEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'ExternalAuthSettings.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'ExternalAuthSettings.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'ExternalAuthSettings.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'ExternalAuthSettings.TrustDomains[0].Domain')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'baltbet://'
    WHERE Name = 'ExternalAuthSettings.TrustDomains[0].Domain'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'ExternalAuthSettings.TrustDomains[0].Domain', 'baltbet://', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.CKFinderSettings.ImageHost')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:443'
    WHERE Name = 'Global.CKFinderSettings.ImageHost'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.CKFinderSettings.ImageHost', 'https://VM-N2-WS3.gkbaltbet.local:443', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.BaltBetClientStatistics.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.GlobalLog.BaltBetClientStatistics.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.BaltBetClientStatistics.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.BaltBetClientStatistics.StatisticsHandlerUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:13443/st'
    WHERE Name = 'Global.GlobalLog.BaltBetClientStatistics.StatisticsHandlerUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.BaltBetClientStatistics.StatisticsHandlerUrl', 'https://VM-N2-WS3.gkbaltbet.local:13443/st', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'True'
    WHERE Name = 'Global.GlobalLog.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.IsEnabled', 'True', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.DefaultDeadLetterLog4NetLoggerNameFormat')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'globalLog-deadletter_{logger}'
    WHERE Name = 'Global.GlobalLog.RabbitMq.DefaultDeadLetterLog4NetLoggerNameFormat'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.DefaultDeadLetterLog4NetLoggerNameFormat', 'globalLog-deadletter_{logger}', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.DeadLetterLog4NetLoggerNameFormat')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'globalLog-deadletter_{logger}'
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.DeadLetterLog4NetLoggerNameFormat'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.GlobalLogger.DeadLetterLog4NetLoggerNameFormat', 'globalLog-deadletter_{logger}', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.GlobalLogger.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Name')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'global'
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Name'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.GlobalLogger.Name', 'global', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.IsDurable')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.IsDurable'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.IsDurable', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.Name')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'global-log'
    WHERE Name = 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.Name'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.RabbitMq.GlobalLogger.Queue.Name', 'global-log', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.GlobalLog.ServiceName')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'UNI-RU'
    WHERE Name = 'Global.GlobalLog.ServiceName'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.GlobalLog.ServiceName', 'UNI-RU', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.IsCrossSiteLoginEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.IsCrossSiteLoginEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.IsCrossSiteLoginEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.KernelRedisConnectionString')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'localhost'
    WHERE Name = 'Global.KernelRedisConnectionString'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.KernelRedisConnectionString', 'localhost', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.MessagesServiceSettings.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.MessagesServiceSettings.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.MessagesServiceSettings.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.MessagesServiceSettings.URL')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:4442/'
    WHERE Name = 'Global.MessagesServiceSettings.URL'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.MessagesServiceSettings.URL', 'https://VM-N2-WS3.gkbaltbet.local:4442/', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.NotificationServiceSettings.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'false'
    WHERE Name = 'Global.NotificationServiceSettings.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.NotificationServiceSettings.IsEnabled', 'false', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.NotificationServiceSettings.PushNotificationsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.NotificationServiceSettings.PushNotificationsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.NotificationServiceSettings.PushNotificationsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.RabbitMq.AccountBus.ConnectionString')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'host=localhost;publisherConfirms=true;timeout=5'
    WHERE Name = 'Global.RabbitMq.AccountBus.ConnectionString'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.RabbitMq.AccountBus.ConnectionString', 'host=localhost;publisherConfirms=true;timeout=5', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.RabbitMq.AccountBus.Exchange')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Exchange.AccountNotifications.Ru'
    WHERE Name = 'Global.RabbitMq.AccountBus.Exchange'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.RabbitMq.AccountBus.Exchange', 'Exchange.AccountNotifications.Ru', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.RabbitMq.AccountBus.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.RabbitMq.AccountBus.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.RabbitMq.AccountBus.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.SignalR.Host.AllowCors')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Global.SignalR.Host.AllowCors'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.SignalR.Host.AllowCors', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.SignalR.Host.Endpoint')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://localhost:8153'
    WHERE Name = 'Global.SignalR.Host.Endpoint'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.SignalR.Host.Endpoint', 'https://localhost:8153', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.SignalR.Remote.Endpoint')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:8491/'
    WHERE Name = 'Global.SignalR.Remote.Endpoint'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.SignalR.Remote.Endpoint', 'https://VM-N2-WS3.gkbaltbet.local:8491/', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.SignalR.Type')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Remote'
    WHERE Name = 'Global.SignalR.Type'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.SignalR.Type', 'Remote', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.StartPage')
UPDATE [UniRu].Settings.SiteOptions SET Value = '/live'
    WHERE Name = 'Global.StartPage'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.StartPage', '/live', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.TimeBookingWebApiBaseAddress')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'http://localhost:63298'
    WHERE Name = 'Global.TimeBookingWebApiBaseAddress'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.TimeBookingWebApiBaseAddress', 'http://localhost:63298', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.WcfClient.PpsClientId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 7773
    WHERE Name = 'Global.WcfClient.PpsClientId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.WcfClient.PpsClientId', 7773, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.WcfClient.WcfServicesHostAddress')
UPDATE [UniRu].Settings.SiteOptions SET Value = '172.16.6.109'
    WHERE Name = 'Global.WcfClient.WcfServicesHostAddress'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.WcfClient.WcfServicesHostAddress', '172.16.6.109', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.WcfClient.WcfServicesHostIdentityDns')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'test.wcf.host'
    WHERE Name = 'Global.WcfClient.WcfServicesHostIdentityDns'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.WcfClient.WcfServicesHostIdentityDns', 'test.wcf.host', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Global.WcfClient.WorkerId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 57
    WHERE Name = 'Global.WcfClient.WorkerId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Global.WcfClient.WorkerId', 57, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Login.IsCaptchaEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'false'
    WHERE Name = 'Login.IsCaptchaEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Login.IsCaptchaEnabled', 'false', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Login.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Login.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Login.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Login.LoginUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = '/'
    WHERE Name = 'Login.LoginUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Login.LoginUrl', '/', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Modal.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Modal.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Modal.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'OAuth.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.LastLogoutUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:449/account/logout/last'
    WHERE Name = 'OAuth.LastLogoutUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.LastLogoutUrl', 'https://VM-N2-WS3.gkbaltbet.local:449/account/logout/last', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.TokenUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://VM-N2-WS3.gkbaltbet.local:449/oauth/token'
    WHERE Name = 'OAuth.TokenUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.TokenUrl', 'https://VM-N2-WS3.gkbaltbet.local:449/oauth/token', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.UniClient.Id')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'site.uni.ru'
    WHERE Name = 'OAuth.UniClient.Id'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.UniClient.Id', 'site.uni.ru', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.UniClient.Secret')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Qwerty1z'
    WHERE Name = 'OAuth.UniClient.Secret'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.UniClient.Secret', 'Qwerty1z', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.WebApiClient.Id')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'webapi.uni.ru'
    WHERE Name = 'OAuth.WebApiClient.Id'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.WebApiClient.Id', 'webapi.uni.ru', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'OAuth.WebApiClient.Secret')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Qwerty1z'
    WHERE Name = 'OAuth.WebApiClient.Secret'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'OAuth.WebApiClient.Secret', 'Qwerty1z', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.AiGames.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'false'
    WHERE Name = 'Pages.AiGames.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.AiGames.IsEnabled', 'false', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.DefaultSportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Soccer'
    WHERE Name = 'Pages.Home.DefaultSportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.DefaultSportTypeId', 'Soccer', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsFaqsSportWidgetVisible')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsFaqsSportWidgetVisible'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsFaqsSportWidgetVisible', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsHotEventsLiveWidgetVisible')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsHotEventsLiveWidgetVisible'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsHotEventsLiveWidgetVisible', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsHotEventsPrematchWidgetVisible')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsHotEventsPrematchWidgetVisible'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsHotEventsPrematchWidgetVisible', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsHotReviewsWidgetVisible')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsHotReviewsWidgetVisible'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsHotReviewsWidgetVisible', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.IsSportTopEventsWidgetVisible')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.IsSportTopEventsWidgetVisible'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.IsSportTopEventsWidgetVisible', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.Sports[0].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Home.Sports[0].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.Sports[0].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.Sports[0].SportString')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'hockey'
    WHERE Name = 'Pages.Home.Sports[0].SportString'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.Sports[0].SportString', 'hockey', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.Sports[0].SportTitle')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Хоккей'
    WHERE Name = 'Pages.Home.Sports[0].SportTitle'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.Sports[0].SportTitle', 'Хоккей', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Home.Sports[0].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Hockey'
    WHERE Name = 'Pages.Home.Sports[0].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Home.Sports[0].SportTypeId', 'Hockey', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Live.IsEventExpandable')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Pages.Live.IsEventExpandable'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Live.IsEventExpandable', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Live.LightFetchTimeoutAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:2.500'
    WHERE Name = 'Pages.Live.LightFetchTimeoutAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Live.LightFetchTimeoutAuth', '0.0:0:2.500', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Live.LightFetchTimeoutNotAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:10.0'
    WHERE Name = 'Pages.Live.LightFetchTimeoutNotAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Live.LightFetchTimeoutNotAuth', '0.0:0:10.0', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Pages.Live.MaxExpandedEventsCount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 15
    WHERE Name = 'Pages.Live.MaxExpandedEventsCount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Pages.Live.MaxExpandedEventsCount', 15, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.History.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.History.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.History.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.History.PageSize')
UPDATE [UniRu].Settings.SiteOptions SET Value = 10
    WHERE Name = 'Payment.History.PageSize'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.History.PageSize', 10, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Card.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.Card.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Card.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Card.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Invoice.Card.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Card.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Card.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.Card.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Card.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Mobile.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.Mobile.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Mobile.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Mobile.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Invoice.Mobile.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Mobile.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Mobile.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.Mobile.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Mobile.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.OnlineBanksSettings.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.OnlineBanksSettings.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.OnlineBanksSettings.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Qiwi.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.Qiwi.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Qiwi.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Qiwi.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Invoice.Qiwi.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Qiwi.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Qiwi.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.Qiwi.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Qiwi.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Terminals.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.Terminals.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Terminals.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.WebMoney.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.WebMoney.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.WebMoney.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.WebMoney.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Invoice.WebMoney.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.WebMoney.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.WebMoney.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.WebMoney.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.WebMoney.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Yandex.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Invoice.Yandex.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Yandex.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Yandex.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Invoice.Yandex.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Yandex.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Invoice.Yandex.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Invoice.Yandex.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Invoice.Yandex.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Card.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.Card.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Card.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Card.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Payout.Card.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Card.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Card.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Payout.Card.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Card.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Mobile.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.Mobile.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Mobile.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Mobile.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Payout.Mobile.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Mobile.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Mobile.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Payout.Mobile.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Mobile.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Qiwi.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.Qiwi.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Qiwi.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Qiwi.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Payout.Qiwi.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Qiwi.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Qiwi.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Payout.Qiwi.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Qiwi.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.WebMoney.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.WebMoney.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.WebMoney.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.WebMoney.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Payout.WebMoney.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.WebMoney.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.WebMoney.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Payout.WebMoney.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.WebMoney.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Yandex.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Payment.Payout.Yandex.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Yandex.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Yandex.MaxAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 1000
    WHERE Name = 'Payment.Payout.Yandex.MaxAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Yandex.MaxAmount', 1000, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Payment.Payout.Yandex.MinAmount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 100
    WHERE Name = 'Payment.Payout.Yandex.MinAmount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Payment.Payout.Yandex.MinAmount', 100, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.MaxDocumentSize')
UPDATE [UniRu].Settings.SiteOptions SET Value = 10
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.MaxDocumentSize'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.DocumentUploadSettings.MaxDocumentSize', 10, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionCompletingPassportAddress')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}'
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionCompletingPassportAddress'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionCompletingPassportAddress', 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionResultsAddress')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'http://localhost:8123/api/AccountFiles/Cps/passports/{0}'
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionResultsAddress'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionResultsAddress', 'http://localhost:8123/api/AccountFiles/Cps/passports/{0}', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.UploadingDocumentAddress')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'http://localhost:8123/api/AccountFiles/Cps/Upload/{0}/{1}/{2}'
    WHERE Name = 'PlayerIdentificationSettings.DocumentUploadSettings.UploadingDocumentAddress'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.DocumentUploadSettings.UploadingDocumentAddress', 'http://localhost:8123/api/AccountFiles/Cps/Upload/{0}/{1}/{2}', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.IsProfileReducedIdentificationEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.IsProfileReducedIdentificationEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.IsProfileReducedIdentificationEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.IsRegistrationReducedIdentificationEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.IsRegistrationReducedIdentificationEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.IsRegistrationReducedIdentificationEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[0].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'CpsDataComparison'
    WHERE Name = 'PlayerIdentificationSettings.Options[0].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[0].IdentificationRequestType', 'CpsDataComparison', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[0].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[0].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[0].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[1].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'DocumentPhotoUpload'
    WHERE Name = 'PlayerIdentificationSettings.Options[1].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[1].IdentificationRequestType', 'DocumentPhotoUpload', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[1].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[1].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[1].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[2].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'VoximplantConference'
    WHERE Name = 'PlayerIdentificationSettings.Options[2].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[2].IdentificationRequestType', 'VoximplantConference', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[2].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[2].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[2].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[3].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'ЕСИА'
    WHERE Name = 'PlayerIdentificationSettings.Options[3].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[3].IdentificationRequestType', 'ЕСИА', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[3].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[3].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[3].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[4].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'ТребуетсяРегистрацияНаППС'
    WHERE Name = 'PlayerIdentificationSettings.Options[4].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[4].IdentificationRequestType', 'ТребуетсяРегистрацияНаППС', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[4].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[4].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[4].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[5].IdentificationRequestType')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'СМЭВMessagerConference'
    WHERE Name = 'PlayerIdentificationSettings.Options[5].IdentificationRequestType'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[5].IdentificationRequestType', 'СМЭВMessagerConference', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'PlayerIdentificationSettings.Options[5].IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'PlayerIdentificationSettings.Options[5].IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'PlayerIdentificationSettings.Options[5].IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'ReCaptcha.Captcha.PrivateKey')
UPDATE [UniRu].Settings.SiteOptions SET Value = '6LdDGRYUAAAAAPy8qadCmdaiHEgrpwgBlmka7SnE'
    WHERE Name = 'ReCaptcha.Captcha.PrivateKey'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'ReCaptcha.Captcha.PrivateKey', '6LdDGRYUAAAAAPy8qadCmdaiHEgrpwgBlmka7SnE', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'ReCaptcha.Captcha.PublicKey')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'NUL6LdDGRYUAAAAAM43b7Z-v56zVhagJ5oDzYV02GkEL'
    WHERE Name = 'ReCaptcha.Captcha.PublicKey'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'ReCaptcha.Captcha.PublicKey', 'NUL6LdDGRYUAAAAAM43b7Z-v56zVhagJ5oDzYV02GkEL', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'ReCaptcha.VerifyUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://www.google.com/recaptcha/api/siteverify'
    WHERE Name = 'ReCaptcha.VerifyUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'ReCaptcha.VerifyUrl', 'https://www.google.com/recaptcha/api/siteverify', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Registration.InSessionDataEncrptionPassphrase')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Qwerty1z'
    WHERE Name = 'Registration.InSessionDataEncrptionPassphrase'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Registration.InSessionDataEncrptionPassphrase', 'Qwerty1z', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Registration.IsCaptchaEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'false'
    WHERE Name = 'Registration.IsCaptchaEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Registration.IsCaptchaEnabled', 'false', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Registration.IsEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Registration.IsEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Registration.IsEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Registration.IsEsiaRegistrationIdentificationEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Registration.IsEsiaRegistrationIdentificationEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Registration.IsEsiaRegistrationIdentificationEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Registration.RegistrationPromotionCount')
UPDATE [UniRu].Settings.SiteOptions SET Value = 3
    WHERE Name = 'Registration.RegistrationPromotionCount'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Registration.RegistrationPromotionCount', 3, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[0].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Soccer'
    WHERE Name = 'Sport.Sports[0].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[0].SportTypeId', 'Soccer', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[1].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Hockey'
    WHERE Name = 'Sport.Sports[1].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[1].SportTypeId', 'Hockey', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[2].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'BasketBall'
    WHERE Name = 'Sport.Sports[2].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[2].SportTypeId', 'BasketBall', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[3].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Tennis'
    WHERE Name = 'Sport.Sports[3].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[3].SportTypeId', 'Tennis', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[4].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Volleyball'
    WHERE Name = 'Sport.Sports[4].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[4].SportTypeId', 'Volleyball', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[5].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Boxing'
    WHERE Name = 'Sport.Sports[5].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[5].SportTypeId', 'Boxing', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[6].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Baseball'
    WHERE Name = 'Sport.Sports[6].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[6].SportTypeId', 'Baseball', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[7].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Gandball'
    WHERE Name = 'Sport.Sports[7].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[7].SportTypeId', 'Gandball', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[8].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Loteries'
    WHERE Name = 'Sport.Sports[8].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[8].SportTypeId', 'Loteries', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Sport.Sports[9].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'CyberSport'
    WHERE Name = 'Sport.Sports[9].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Sport.Sports[9].SportTypeId', 'CyberSport', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Superexpress.IsPackageBetEnabled')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'Superexpress.IsPackageBetEnabled'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Superexpress.IsPackageBetEnabled', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'SupportContacts.SupportEmail')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'report@baltbet.ru'
    WHERE Name = 'SupportContacts.SupportEmail'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'SupportContacts.SupportEmail', 'report@baltbet.ru', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'SupportContacts.SupportPhoneNumber')
UPDATE [UniRu].Settings.SiteOptions SET Value = '8-800-700-29-90'
    WHERE Name = 'SupportContacts.SupportPhoneNumber'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'SupportContacts.SupportPhoneNumber', '8-800-700-29-90', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'UpdateApk.AndroidUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://apkupdater.baltbet.ru:1415/com.baltbet.clientapp'
    WHERE Name = 'UpdateApk.AndroidUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'UpdateApk.AndroidUrl', 'https://apkupdater.baltbet.ru:1415/com.baltbet.clientapp', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'UpdateApk.CheckUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://apkupdater-test.bb-webapps.com:1443/api/check/'
    WHERE Name = 'UpdateApk.CheckUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'UpdateApk.CheckUrl', 'https://apkupdater-test.bb-webapps.com:1443/api/check/', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'UpdateApk.IosUrl')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'https://apps.apple.com/us/app/id1531690217'
    WHERE Name = 'UpdateApk.IosUrl'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'UpdateApk.IosUrl', 'https://apps.apple.com/us/app/id1531690217', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'WebApi.EnableRegistrationAndIdentificationStubs')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'true'
    WHERE Name = 'WebApi.EnableRegistrationAndIdentificationStubs'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'WebApi.EnableRegistrationAndIdentificationStubs', 'true', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Events.TopLiveRefreshIntervalAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:3.0'
    WHERE Name = 'Widgets.Events.TopLiveRefreshIntervalAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Events.TopLiveRefreshIntervalAuth', '0.0:0:3.0', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Events.TopLiveRefreshIntervalNotAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:10.0'
    WHERE Name = 'Widgets.Events.TopLiveRefreshIntervalNotAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Events.TopLiveRefreshIntervalNotAuth', '0.0:0:10.0', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Hot.LiveRefreshIntervalAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:3.0'
    WHERE Name = 'Widgets.Hot.LiveRefreshIntervalAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Hot.LiveRefreshIntervalAuth', '0.0:0:3.0', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Hot.LiveRefreshIntervalNotAuth')
UPDATE [UniRu].Settings.SiteOptions SET Value = '0.0:0:10.0'
    WHERE Name = 'Widgets.Hot.LiveRefreshIntervalNotAuth'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Hot.LiveRefreshIntervalNotAuth', '0.0:0:10.0', 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Interesting.MaxDays')
UPDATE [UniRu].Settings.SiteOptions SET Value = 30
    WHERE Name = 'Widgets.Interesting.MaxDays'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Interesting.MaxDays', 30, 0);  
--------------------------------------------------------------------------------          
                                                                                         
IF EXISTS (SELECT * FROM [UniRu].Settings.SiteOptions
    WHERE Name = 'Widgets.Interesting.Sports[0].SportTypeId')
UPDATE [UniRu].Settings.SiteOptions SET Value = 'Undefined'
    WHERE Name = 'Widgets.Interesting.Sports[0].SportTypeId'
-- ELSE
--     INSERT INTO [UniRu].Settings.SiteOptions (GroupId, Name, Value, IsInherited)
--     VALUES (1, 'Widgets.Interesting.Sports[0].SportTypeId', 'Undefined', 0);  
--------------------------------------------------------------------------------          
        
