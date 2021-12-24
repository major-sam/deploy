import-module '.\scripts\sideFunctions.psm1'

#get release params
###vars
$targetDir = "C:\inetpub\ClientWorkPlace\UniRu"
$apiTargetDir = "C:\inetpub\ClientWorkPlace\UniruWebApi"

$sourceFile = "$($env:workspace)\scripts\deploy\UniRu.sql"
$oldIp = '#VM_IP'
$oldHostname = '#VM_HOSTNAME'
$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$ProgressPreference = 'SilentlyContinue'
$release_bak_folder = "\\server\tcbuild$\Testers\DB"
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

$query = (Get-Content -Encoding UTF8 -Raw -Path $sourceFile)|Foreach-Object {
    $_ -replace $oldIp,  $IPAddress `
        -replace $oldHostname, $env:COMPUTERNAME`
    } 
Invoke-Sqlcmd -verbose -ServerInstance $env:COMPUTERNAME -Database $dbs[0].DbName -query $query -ErrorAction Stop
Set-Location C:\

$dbname = "UniRu"

# Включаем настройки в админке (если есть кириллические символы, кодировка файла должна быть UTF-8 BOM)
$query_insert_settings = "
INSERT INTO UniRu.Settings.SiteOptions (GroupId, Name, Value, IsInherited)
VALUES
    (1,N'PlayerIdentificationSettings.ECupisAddressЕСИА','https://wallet.1cupis.ru/auth',0)    
GO
"
Write-Host -ForegroundColor Green "[INFO] Insert settings to UniRu"
Invoke-Sqlcmd -verbose -ServerInstance $env:COMPUTERNAME -Database $dbname -query $query_insert_settings -ErrorAction continue
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
