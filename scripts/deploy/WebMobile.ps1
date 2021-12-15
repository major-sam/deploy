import-module '..\scripts\sideFunctions.psm1'

# 3 Сервис PDA

#get release params
$WebMobileFolder = "C:\inetpub\WebMobile"
$WebConfig = "$WebMobileFolder\Web.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()


$transformationsList = Get-Item -Path "$WebMobileFolder\*" -Include "Web.*.config" -Exclude "*Debug*","*Production*"
foreach ($transformation in $transformationsList) { 
    Write-Host -ForegroundColor Green "[INFO] Deploy transformation $transformation to Web.config..."
    XmlDocTransform($WebConfig, $transformation.FullName.trim()) 
}

Write-Host -ForegroundColor Green "[INFO] Edit web.config of WebMobile"
$webdoc = [Xml](Get-Content $WebConfig)
$MobileServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "MobileServerAddress"
$MobileServerAddress.value = "$($CurrentIpAddr):8082"
$SiteServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "SiteServerAddress"
$SiteServerAddress.value = "$($CurrentIpAddr):8088"
$ServerAddress = $webdoc.configuration.appSettings.add | Where-Object key -eq "ServerAddress"
$ServerAddress.value = "$($CurrentIpAddr):8082"
$webdoc.Save($WebConfig)
