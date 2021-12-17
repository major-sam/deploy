import-module '.\scripts\sideFunctions.psm1'

# 3 Сервис WebMobile

#get release params
$SiteFolder = "C:\inetpub\WebMobile"
$SiteConfig = "$SiteFolder\Web.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

# Change Web.config
Write-Host -ForegroundColor Green "[INFO] Edit web.config of WebMobile"
$webdoc = [Xml](Get-Content $SiteConfig)
$MobileServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "MobileServerAddress"
$MobileServerAddress.value = "$($CurrentIpAddr):8082"
$SiteServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "SiteServerAddress"
$SiteServerAddress.value = "$($CurrentIpAddr):8088"
$ServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "ServerAddress"
$ServerAddress.value = "$($CurrentIpAddr):8082"
$webdoc.Save($SiteConfig)
