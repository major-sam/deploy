import-module '.\scripts\sideFunctions.psm1'


###vars
$WebSiteName = "ClientWorkSpace"
$targetDir = "C:\inetpub\$WebSiteName"
$sourceDir = "$env:nugettemp\krm"
$ProgressPreference = 'SilentlyContinue'
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | out-null
$srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" "."
$MssqlVersion = "MSSQL" + $srv.Version.major
$release_bak_folder = "\\dev-comp49\share\DBs"
$MSSQLDataPath = "C:\Program Files\Microsoft SQL Server\$MssqlVersion.MSSQLSERVER\MSSQL\DATA"
$queryTimeout = 720


$dbs = @(
	@{
		DbName = "CWS_ScreenSaversTempDB"
		BackupFile = "$release_bak_folder\CWS_ScreenSaversTempDB.bak"
		RelocateFiles = @(
			@{
				SourceName = "CWS_ScreenSaversTempDB"
				FileName = "CWS_ScreenSaversTempDB.mdf"
			}
			@{
				SourceName = "CWS_ScreenSaversTempDB_log"
				FileName = "CWS_ScreenSaversTempDB_log.ldf"
			}
		)
	}
)
RestoreSqlDb -db_params $dbs -MSSQLDataPath  $MSSQLDataPath

### copy files

write-host "Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse -Exclude "*.nupkg" -verbouse"
Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse -Exclude "*.nupkg" 


### IIS PART MOVED TO ISSconfig.ps1
