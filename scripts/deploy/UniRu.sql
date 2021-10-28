﻿UPDATE [UniRu].Settings.SiteOptions SET Value = CASE Name
WHEN 'Global.CKFinderSettings.ImageHost' THEN 'https://#VM_HOSTNAME.gkbaltbet.local:443'
WHEN 'Global.GlobalLog.BaltBetClientStatistics.StatisticsHandlerUrl' THEN 'https://#VM_HOSTNAME.gkbaltbet.local:13443/st'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionCompletingPassportAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.RecognitionResultsAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/completingPassportData/{0}'
WHEN 'PlayerIdentificationSettings.DocumentUploadSettings.UploadingDocumentAddress' THEN 'http://localhost:8123/api/AccountFiles/Cps/Upload/{0}/{1}/{2}'
WHEN 'Registration.InSessionDataEncrptionPassphrase' THEN 'Qwerty1z'
WHEN 'SupportContacts.SupportEmail' THEN 'report@baltbet.ru'
WHEN 'UpdateApk.AndroidUrl' THEN 'https://apkupdater.baltbet.ru:1415/com.baltbet.clientapp'
WHEN 'UpdateApk.CheckUrl' THEN 'https://apkupdater-test.bb-webapps.com:1443/api/check/'
WHEN 'Global.WcfClient.WcfServicesHostAddress' THEN '#VM_IP'
WHEN 'OAuth.LastLogoutUrl' THEN 'https://#VM_HOSTNAME.gkbaltbet.local:449/account/logout/last'
WHEN 'OAuth.TokenUrl' THEN 'https://#VM_HOSTNAME.gkbaltbet.local:449/oauth/token'
ELSE Value END
