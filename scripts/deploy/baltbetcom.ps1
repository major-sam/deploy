$buildNumber = "1.0.0.1038"
$sourceDir = "\\server\tcbuild$\WebSiteDev\TC_artifacts\"
$targetDir  = 'C:\inetpub\baltbetcom'
$ProgressPreference = 'SilentlyContinue'
$webConfig = "$targetDir\Web.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
### IIS PART MOVED TO ISSconfig.ps1

### Expand files
copy-item -force -recurse -Path "$sourceDir\$buildNumber" $targetDir

###
#XML values replace
####
$webdoc = [Xml](Get-Content -Encoding UTF8 $webConfig)
$obj = $webdoc.configuration.appSettings.add | where {$_.key -like "ServerAddress" }
$obj.value = $CurrentIpAddr+":8082"
$obj = $webdoc.configuration.appSettings.add | where {$_.key -eq "SiteServerAddress" -and $_.value -like '172*'} 
$webdoc.Save($webConfig)
