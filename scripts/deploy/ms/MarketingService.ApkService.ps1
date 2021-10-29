import-module '.\scripts\sideFunctions.psm1'

write-host 'marketing Apk service deploy script'
#get release params

$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'MarketingService.ApkService'
}
$source = GetSourceObject $sourceparams
$targetDir  = 'C:\Services\MarketingService.ApkService'
$webConfig = "$targetDir\BaltBet.Marketing.ApkService.exe.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

### copy files
write-host "Copy-Item -Path $source.sourceBuildSource  -Destination $targetDir -Recurse"
Copy-Item -Path $source.sourceBuildSource  -Destination $targetDir -Recurse 

