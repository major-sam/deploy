# Сервис WebSite (baltbetru)

#get release params
$SiteFolder = "C:\inetpub\WebSite"
$SiteConfig = "$SiteFolder\Web.config"
$wildcardDomain = "bb-webapps.com"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Edit web.config of WebSite"
$webdoc = [Xml](Get-Content $SiteConfig)
$webdoc.configuration.rabbitMqConfig.isEnabled = "true"
$webdoc.configuration.rabbitMqConfig.connectionString = "host=localhost:5672"
$webdoc.configuration.cache.redis.add.name = "account"
$webdoc.configuration.cache.redis.add.connection = "localhost:6379"
$ClientId = $webdoc.configuration.appSettings.add | Where-Object key -eq "ClientId"
$ClientId.value = "7773" 
$Captcha = $webdoc.configuration.appSettings.add | Where-Object key -eq "Captcha"
$Captcha.value = "false"
$RegCaptcha = $webdoc.configuration.appSettings.add | Where-Object key -eq "IsRegistrationCaptchaEnabled"
$RegCaptcha.value = "false"
$UniPaymentUrl = $webdoc.configuration.connectionStrings.add | Where-Object name -eq "UniPaymentsServiceUrl"
$UniPaymentUrl.connectionString = "https://${env:COMPUTERNAME}.$($wildcardDomain):54381"
$webdoc.configuration.'system.serviceModel'.client.endpoint.address = "net.tcp://$($CurrentIpAddr):8150/PromoManager"
$webdoc.Save($SiteConfig)
