import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'MessageService'
}
$source = GetSourceObject $sourceparams


## vars
$targetDir  = 'C:\Services'
$release_bak_folder = '\\dev-comp49\share\DBs'


$dbs = @(
	@{
		DbName = "MessageService"
		BackupFile = "$release_bak_folder\MessageService.bak" 
        RelocateFiles = @(
			@{
				SourceName = "MessageService"
				FileName = "MessageService.mdf"
			}
			@{
				SourceName = "MessageService_log"
				FileName = "MessageService_log.ldf"
			}
        )      
	}
)
###restore DB
RestoreSqlDb -db_params $dbs

### copy files

write-host "Copy-Item -Path $($source.sourceBuildSource)\$netVersion  -Destination $targetDir -Recurse "
Copy-Item -Path "$($source.sourceBuildSource)\$netVersion"  -Destination $targetDir -Recurse
