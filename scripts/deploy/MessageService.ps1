import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'MessageService'
}
$source = GetSourceObject $sourceparams


## vars
$targetDir  = 'C:\Services\MessageService'
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

write-host "Copy-Item -Path $($source.sourceBuildSource)  -Destination $targetDir -Recurse "
robocopy "$($source.sourceBuildSource)"  $targetDir /e /NFL /NDL /nc /ns /np
$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}
