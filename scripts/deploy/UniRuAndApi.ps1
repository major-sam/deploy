import-module '.\scripts\sideFunctions.psm1'
###vars
$buildNumber = "1.0.0.4163"
$targetDir = "C:\inetpub\UniRu"
$apiTargetDir = "C:\inetpub\UniruWebApi"

$sourceDir = "\\server\tcbuild$\Uni\tc_builds"

## TODO!!!
$sourceFile = Get-item -Path ".\scripts\deploy\UniRu.sql"
$file = ".\UniRu.sql"
$oldIp = '172.16.1.217'
$oldHostname = 'VM1APKTEST-P1'
$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$ProgressPreference = 'SilentlyContinue'
$RuntimeVersion ='v4.0'
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | out-null
$srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" "."
$MssqlVersion = "MSSQL" + $srv.Version.major
$release_bak_folder = "\\dev-comp49\share\DBs"
$queryTimeout = 720
$webConfig = "$targetDir\Web.config"
$apiWebConfig = "$apiTargetDir\Web.config"
## move to db part
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


$MSSQLDataPath = "C:\Program Files\Microsoft SQL Server\$MssqlVersion.MSSQLSERVER\MSSQL\DATA"
RestoreSqlDb -db_params $dbs -MSSQLDataPath  $MSSQLDataPath

robocopy "$sourceDir\$buildNumber\uniru" $targetDir /e 
robocopy "$sourceDir\$buildNumber\uniruwebapi" $apiTargetDir /e 
$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}
(Get-Content -Encoding UTF8 -LiteralPath $sourceFile.Fullname)|Foreach-Object {
    $_ -replace $oldIp,  $IPAddress `
        -replace $oldHostname, $env:COMPUTERNAME`
    } | Set-Content -Encoding UTF8 $file

$sFile = Get-item -Path "\\dev-comp49\share\UniRu.sql"
Invoke-Sqlcmd -verbose -ServerInstance $env:COMPUTERNAME -Database $dbs[0].DbName -InputFile $sFile.Fullname -ErrorAction Stop
Set-Location C:\
### IIS PART MOVED TO ISSconfig.ps1


###
#XML values replace
####
Write-Host -ForegroundColor Green "[INFO] Edit web.config of $webConfig"
$webdoc = [Xml](Get-Content $webConfig)
$obj = $webdoc.configuration.connectionStrings.add | where {$_.name -eq 'DataContext' }
$obj.connectionString = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$obj = $webdoc.configuration.cache.db
$obj.connection = "data source=localhost;initial catalog=UniRu;Integrated Security=true;MultipleActiveResultSets=True;"
$webdoc.Save($webConfig)



###
#XML values replace
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
