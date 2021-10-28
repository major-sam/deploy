import-module '.\scripts\sideFunctions.psm1'

#get release params

$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'baltbetcom'
}
$source = GetSourceObject $sourceparams

$targetDir  = 'C:\inetpub\baltbetcom'
$ProgressPreference = 'SilentlyContinue'
$webConfig = "$targetDir\Web.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

### copy files
write-host "Copy-Item -Path `"$($source.sourceBuildSource)`"  -Destination $targetDir -Recurse"
Copy-Item -Path $source.sourceBuildSource  -Destination $targetDir -Recurse 

###
#XML values replace
####
$webdoc = [Xml](Get-Content -Encoding UTF8 $webConfig)
$obj = $webdoc.configuration.appSettings.add | where {$_.key -like "ServerAddress" }
$obj.value = $CurrentIpAddr+":8082"
$obj = $webdoc.configuration.appSettings.add | where {$_.key -eq "SiteServerAddress" -and $_.value -like '172*'} 
$webdoc.Save($webConfig)
