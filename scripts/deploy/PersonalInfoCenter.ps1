import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'MessageService'
}
$source = GetSourceObject $sourceparams


## vars
$targetDir  = 'C:\Services\MessageService'
$release_bak_folder = '\\server\tcbuild$\Testers\DB'


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
### fix logpaths
$paths = @( 
	"C:\Services\PersonalInfoCenter\AdminMessageService\Log.config", 
	"C:\Services\PersonalInfoCenter\MessageService\Log.config", 
	"C:\Services\PersonalInfoCenter\NotificationService\Log.config"
	)
$paths | % { 
	$webdoc = [Xml](Get-Content $_)
	$webdoc.log4net.appender.file.value = "c:\logs\PersonalInfoCenter\"
	$webdoc.Save($_)
}
