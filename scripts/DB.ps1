<#
Скрипт для равертывания нового релиза 08-10-2021
powershell.exe -file "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\08.10.2021 RELEASE.ps1"


Удаленный запуск:
у себя в Powershell
Invoke-Command -FilePath '\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\08.10.2021 RELEASE.ps1' -ComputerName <ИМЯ_ПК>

Пример:
Invoke-Command -FilePath '\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\08.10.2021 RELEASE.ps1' -ComputerName  VM-HM1-WS6 


Проверка: +79112492620 Qwerty1z
#>
import-module '.\scripts\sideFunctions.psm1'


$release_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\22.10.2021 RELEASE"
$release_bak_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\22.10.2021 RELEASE\_Full DB Restoration"

$ProgressPreference = 'SilentlyContinue'

$queryTimeout = 720
$excludeSqlCmds = "1.DBRestore.sql"
$files = Get-ChildItem -path "$($release_bak_folder)\*" -Include "*.sql" -exclude $excludeSqlCmds | Sort-Object -Property Name
$dbs = @(
	@{
		DbName = "BaltBetM"
		BackupFile = "$release_bak_folder\BaltBetM.bak"
		RelocateFiles = @(
			@{
				SourceName = "BaltBetM"
				FileName = "BaltBetM.mdf"
			}
			@{
				SourceName = "CoefFileGroup"
				FileName = "CoefFileGroup.mdf"
			}
			@{
				SourceName = "BaltBet"
				FileName = "BaltBet.ldf"
			}
		)
	}
	@{
		DbName = "BaltBetMMirror"
		BackupFile = "$release_bak_folder\BaltBetM.bak"
		RelocateFiles = @(
			@{
				SourceName = "BaltBetM"
				FileName = "BaltBetMMirror.mdf"
			}
			@{
				SourceName = "CoefFileGroup"
				FileName = "CoefFileGroupMirror.mdf"
			}
			@{
				SourceName = "BaltBet"
				FileName = "BaltBetMirror.ldf"
			}
		)
	}
	@{
		DbName = "BaltBetWeb"
		BackupFile = "$release_bak_folder\BaltBetWeb.bak"
		RelocateFiles = @(
			@{
				SourceName = "BaltBetWeb"
				FileName = "BaltBetWeb.mdf"
			}
			@{
				SourceName = "Files"
				FileName = "Files"
			}
			@{
				SourceName = "BaltBetWeb_log"
				FileName = "BaltBetWeb.ldf"
			}
		)
	}
		<#@{
		DbName = "ParserNew"
		BackupFile = "parser.bak"
		RelocateFiles = @(
			@{
				SourceName = "ParserNew"
				FileName = "ParserNew.mdf"
			}
			@{
				SourceName = "ParserNew_log"
				FileName = "ParserNew_log.ldf"
			}
		)
	} #>
)
#todo refactoring
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | out-null
$srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" "."
$MssqlVersion = "MSSQL" + $srv.Version.major
$MSSQLDataPath = "C:\Program Files\Microsoft SQL Server\$MssqlVersion.MSSQLSERVER\MSSQL\DATA"
RestoreSqlDb -db_params $dbs -MSSQLDataPath  $MSSQLDataPath


# Выполняем скрипты из актуализации BaltBetM
$qwr=
			"
			ALTER DATABASE BaltBetM
			COLLATE Cyrillic_General_CI_AS
			GO
			"
Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $qwr -ErrorAction continue


#применяем скрипты к базе $dbname
$dbname = 'BaltBetM'
foreach ($file in $files) {
	Write-Host -ForegroundColor Gray "[INFO] EXECUTED STARETED: " $file
	Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbname -InputFile $file -ErrorAction continue
	Write-Host -ForegroundColor Green "[INFO] EXECUTED SUCCESSFULLY: " $file 
}

