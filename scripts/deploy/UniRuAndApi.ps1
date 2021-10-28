﻿import-module '.\scripts\sideFunctions.psm1'

#get release params
$sf = '.\Release.json'
$unisourceparams = @{
	sourceFile = $sf
	sourceName = 'UniRu'
}
$apisourceparams = @{
	sourceFile = $sf
	sourceName = 'UniWebApiAuth'
}
$unisource = GetSourceObject $unisourceparams
$apisource = GetSourceObject $unisourceparams

###vars
$targetDir = "C:\inetpub\UniRu"
$apiTargetDir = "C:\inetpub\UniruWebApi"

$sourceFile = "$($env:workspace)\scripts\deploy\UniRu.sql"
$oldIp = '#VM_IP'
$oldHostname = '#VM_HOSTNAME'
$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$ProgressPreference = 'SilentlyContinue'
$RuntimeVersion ='v4.0'
$release_bak_folder = "\\dev-comp49\share\DBs"
$queryTimeout = 720
$webConfig = "$targetDir\Web.config"
$apiWebConfig = "$apiTargetDir\Web.config"
$dbs = @(
	@{
		DbName = "UniRu"
		BackupFile = "$release_bak_folder\UniRu.bak" 
        RelocateFiles = @(
			@{
				SourceName = "UniCps"
				FileName = "UniRu.mdf"
			}
			@{
				SourceName = "UniCps_log"
				FileName = "UniRu.ldf"
			}
		)    
	}
)

###Create dbs
Write-Host -ForegroundColor Green "[INFO] Create dbs"

RestoreSqlDb -db_params $dbs

### copy files
robocopy $unisource.sourceBuildSource $targetDir /e 
robocopy $apisource.sourceBuildSource $apiTargetDir /e 
$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}
$query = (Get-Content -Encoding UTF8 -Raw -Path $sourceFile)|Foreach-Object {
    $_ -replace $oldIp,  $IPAddress `
        -replace $oldHostname, $env:COMPUTERNAME`
    } 
Invoke-Sqlcmd -verbose -ServerInstance $env:COMPUTERNAME -Database $dbs[0].DbName -query $query -ErrorAction Stop
Set-Location C:\

###
#XML values replace UniRu
####
Write-Host -ForegroundColor Green "[INFO] Edit web.config of $webConfig"
$webdoc = [Xml](Get-Content $webConfig)
$obj = $webdoc.configuration.connectionStrings.add | where {$_.name -eq 'DataContext' }
$obj.connectionString = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$obj = $webdoc.configuration.cache.db
$obj.connection = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$webdoc.Save($webConfig)



###
#XML values replace UniruWebApi
####
Write-Host -ForegroundColor Green "[INFO] Edit web.config of $apiWebConfig"
$webdoc = [Xml](Get-Content $apiWebConfig)
$obj = $webdoc.configuration.connectionStrings.add | where {$_.name -eq 'DataContext' }
$obj.connectionString = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$obj = $webdoc.configuration.cache.db
$obj.connection = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$ConnectionStringsAdd = $webdoc.CreateElement('add')
$ConnectionStringsAdd.SetAttribute("name","OAuth.LastLogoutUrl")
$ConnectionStringsAdd.SetAttribute("connectionString","https://${env:COMPUTERNAME}.gkbaltbet.local:449/account/logout/last")
 $webdoc.configuration.connectionStrings.AppendChild($ConnectionStringsAdd)
$webdoc.Save($apiWebConfig)

Write-Host -ForegroundColor Green "[INFO] Done"
