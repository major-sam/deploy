import-module '.\scripts\sideFunctions.psm1'

## vars
$buildNumber = "1.0.0.76"
$sourceDir = "\\server\tcbuild$\Testers\MessageService\$buildNumber\MessageService"
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
write-host "Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse -Exclude "*.nupkg
Copy-Item -Path "$sourceDir"  -Destination $targetDir -Recurse -Exclude "*.nupkg"
