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

$ProgressPreference = 'SilentlyContinue'
$release_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE"
$release_bak_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\_Full DB Restoration\"
$MSSQLDataPath = "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
$queryTimeout = 720
$excludeSqlCmds = "1.DBRestore.sql"
$files = Get-ChildItem -path "$($release_bak_folder)\*" -Include "*.sql" -exclude $excludeSqlCmds | Sort-Object -Property Name
$dbs = @(
	@{
		DbName = "BaltBetM"
		BackupFile = "BaltBetM.bak"
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
		BackupFile = "BaltBetM.bak"
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
		BackupFile = "BaltBetWeb.bak"
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

function RestoreSqlDb($db_params) {
	foreach ($db in $db_params){
		$RelocateFile = @() 
        $dbname = $db.DbName
		$KillConnectionsSql=
			"
			USE master
			GO
			ALTER DATABASE [$dbname] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
			GO
			DROP DATABASE [$dbname]
			GO
			"
		Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $KillConnectionsSql -ErrorAction continue
		if ($db.ContainsKey('RelocateFiles')){
			foreach ($dbFile in $db.RelocateFiles) {
				$RelocateFile += New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($dbFile.SourceName, ("{0}{1}" -f $MSSQLDataPath, $dbFile.FileName))
			}
			$dbBackupFile = $release_bak_folder + $db.BackupFile
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile  $dbBackupFile -RelocateFile $RelocateFile -ReplaceDatabase
			Push-Location C:\Windows
		}else{
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile  $dbBackupFile -ReplaceDatabase
			Push-Location C:\Windows			
		}
	}
}

RestoreSqlDb($dbs)


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

