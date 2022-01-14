import-module '.\scripts\sideFunctions.psm1'

$ServicesFolder = "C:\Services"
$ServiceName = "WebParser"
$PathToTaskScripts = "$($ServicesFolder)\$($ServiceName)\TasksScripts"
$db = @(
	@{
		DbName = $ServiceName
		BackupFile = "\\server\tcbuild$\Testers\DB\Parser\Parser.bak"
		RelocateFiles = @(
			@{
				SourceName = "ParserNew"
				FileName = "$($ServiceName).mdf"
			}
			@{
				SourceName = "ParserNew_log"
				FileName = "$($ServiceName)_log.ldf"
			}
			@{
				SourceName = "ParserNew_Log2"
				FileName = "$($ServiceName)_LOg2.ldf"
			}
		)
	}
)

Write-Host -ForegroundColor Green "[INFO] Create WebParser database..."
RestoreSqlDb($db)

if (!(Get-ChildItem "$($PathToTaskScripts)\*" -include "*.sql")) {
    write-host "no task for this branch"
    break
}

Get-ChildItem "$($PathToTaskScripts)\*" -include "*.sql" | % {
    Write-Host -ForegroundColor Green "[INFO] Invoke $($_.Name) script..."
    Invoke-Sqlcmd -verbose -QueryTimeout 720 -ServerInstance $env:COMPUTERNAME -Database $ServiceName -InputFile $_.FullName -Verbose -ErrorAction continue
}

