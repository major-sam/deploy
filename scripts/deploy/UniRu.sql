UPDATE [UniRu].Settings.SiteOptions SET Value = CASE Name
WHEN 'Global.CKFinderSettings.ImageHost' THEN 'https://#VM_HOSTNAME.bb-webapps.com:443'
WHEN 'Global.GlobalLog.BaltBetClientStatistics.StatisticsHandlerUrl' THEN 'https://#VM_HOSTNAME.bb-webapps.com:13443/st'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionCompletingPassportAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionResultsAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.UploadingDocumentAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/Upload/{0}/{1}/{2}'
WHEN 'Global.MessagesServiceSettings.URL' THEN 'https://#VM_HOSTNAME.bb-webapps.com::4442/ '
WHEN 'Global.SignalR.Remote.Endpoint' THEN 'https://#VM_HOSTNAME.bb-webapps.com:8491/'
WHEN 'Registration.InSessionDataEncrptionPassphrase' THEN 'Qwerty1z'
WHEN 'SupportContacts.SupportEmail' THEN 'report@baltbet.ru'
WHEN 'UpdateApk.AndroidUrl' THEN 'https://apkupdater.baltbet.ru:1415/com.baltbet.clientapp'
WHEN 'UpdateApk.CheckUrl' THEN 'https://apkupdater-test.bb-webapps.com:1443/api/check/'
WHEN 'Global.WcfClient.WcfServicesHostAddress' THEN '#VM_IP'
WHEN 'OAuth.LastLogoutUrl' THEN 'https://#VM_HOSTNAME.bb-webapps.com:449/account/logout/last'
WHEN 'OAuth.TokenUrl' THEN 'https://#VM_HOSTNAME.bb-webapps.com:449/oauth/token'
WHEN 'Global.RabbitMq.NotificationGateWayBus.IsEnabled' THEN 'false'
ELSE Value END

INSERT INTO UniRu.Settings.SiteOptions (GroupId, Name, Value, IsInherited)
VALUES (1,'Pages.Tickets.IsEnabled','true',0),
(1,'Asterisk.IpAddress','172.16.0.54',0),
(1,'Asterisk.Login','site',0),
(1,'Asterisk.Port','5038',0),
(1,'Asterisk.Secret','hzccIuSfo1rMgVBU',0),
(1,'Payment.IsCupisPaymentsEnabled','true',0);
GO
