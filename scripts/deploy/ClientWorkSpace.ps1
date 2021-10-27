import-module '.\scripts\sideFunctions.psm1'


$buildNumber = "1.0.0.3767"
###vars
$WebSiteName = "ClientWorkSpace"
$targetDir = "C:\inetpub\$WebSiteName"
$sourceDir = "\\server\tcbuild$\Uni\tc_builds\krm"
$ProgressPreference = 'SilentlyContinue'
$release_bak_folder= "\\dev-comp49\share\DBs"

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
RestoreSqlDb -db_params $dbs

### copy files

write-host "Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse  -verbouse"
Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse 
