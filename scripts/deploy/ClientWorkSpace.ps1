import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'ClientWorkSpace'
}
$source = GetSourceObject $sourceparams


###vars
$targetDir = "C:\inetpub\ClientWorkSpace"
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

write-host "Copy-Item -Path `"$($source.sourceBuildSource)`"  -Destination $targetDir -Recurse"
Copy-Item -Path $source.sourceBuildSource  -Destination $targetDir -Recurse 
