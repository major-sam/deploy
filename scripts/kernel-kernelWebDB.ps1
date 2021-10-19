#vars
$ProgressPreference = 'SilentlyContinue'
### !!! TRAILING SLASHES !!!
$release_bak_folder = "\\server\tcbuild$\Testers\DB\"
$release_script_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\27.08.2021 RELEASE\_Full DB Restoration\"
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | out-null
$srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" "."
$MssqlVersion = "MSSQL" + $srv.Version.major
$MSSQLDataPath = "C:\Program Files\Microsoft SQL Server\$MssqlVersion.MSSQLSERVER\MSSQL\DATA\"
$queryTimeout = 720
$excludeSqlCmds = "1.DBRestore.sql"
$files = Get-ChildItem -path "$($release_script_folder)\*" -Include "*.sql" -exclude $excludeSqlCmds | Sort-Object -Property Name
$dbname = 'BaltBetM'
$dbs = @(
	@{
		DbName = "BaltBetM"
		BackupFile = "BaltBetM.original.bak"
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
)
$qwr=
			"
			ALTER DATABASE BaltBetM
			COLLATE Cyrillic_General_CI_AS
			GO
			"

### side functions
function RestoreSqlDb($db_params) {
	foreach ($db in $db_params){
		$RelocateFile = @() 
        $dbname = $db.DbName
		$KillConnectionsSql=
			"
			USE master
            IF EXISTS(select * from sys.databases where name='"+$dbname+"')
            BEGIN
			    ALTER DATABASE [$dbname] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
			    DROP DATABASE [$dbname]
			END;
			"
		Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $KillConnectionsSql -ErrorAction continue
		$dbBackupFile = $release_bak_folder + $db.BackupFile
		if ($db.ContainsKey('RelocateFiles')){
			foreach ($dbFile in $db.RelocateFiles) {
				$RelocateFile += New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($dbFile.SourceName, ("{0}{1}" -f $MSSQLDataPath, $dbFile.FileName))
			}
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile  $dbBackupFile -RelocateFile $RelocateFile -ReplaceDatabase
			Push-Location C:\Windows
		}else{
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile  $dbBackupFile -ReplaceDatabase
			Push-Location C:\Windows			
		}
	}
}

### invoke db
RestoreSqlDb($dbs)
Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $qwr -ErrorAction continue

#применяем скрипты к базе $dbname
foreach ($file in $files) {
	Write-Host -ForegroundColor Gray "EXECUTED STARETED: " $file
try{
	Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbname -InputFile $file -ErrorAction continue
	Write-Host -ForegroundColor Green "EXECUTED SUCCESSFULLY: " $file 
}
catch{
    Write-Host -ForegroundColor Red "EXECUTION FAILED: " $file 
}
}
