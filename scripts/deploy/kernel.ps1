import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'Kernel'
}
$source = GetSourceObject $sourceparams
#vars

$ProgressPreference = 'SilentlyContinue'
$targetDir = 'C:\Kernel'
$netVersion = (Get-ChildItem -path $source.sourceBuildSource -Recurse -Force |Select-Object -First 1).Name
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$pathtojson = "$targetDir\appsettings.json "
$transformLibPath = ".\scripts\Microsoft.Web.XmlTransform.dll"
$release_bak_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\22.10.2021 RELEASE\_Full DB Restoration"
$jsonDepth = 4
$queryTimeout = 720
$excludeSqlCmds = "1.DBRestore.sql"
$files = Get-ChildItem -path "$($release_bak_folder)\*" -Include "*.sql" -exclude $excludeSqlCmds | Sort-Object -Property Name
$webConfig = "$targetDir\settings.xml"
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
)

$FILES= @(
      @{
        transf = "$targetDir\App.OctopusTestVM.config"
        target = "$targetDir\Kernel.exe.config"
      }
      @{
        transf = "$targetDir\settings.OctopusTestVM.xml"
        target = "$targetDir\settings.xml"
      }
      @{
        transf = "$targetDir\Config\UnityConfig.OctopusTestVM.config"
        target = "$targetDir\Config\UnityConfig.config"
      }
      @{
        transf = "$targetDir\Config\Log.OctopusTestVM.config"
        target = "$targetDir\Config\Log.config"
      } 
)

### copy files
robocopy "$($source.sourceBuildSource)\$netVersion\" $targetDir /e

$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}
### set vm related values for transformation files

##### raw replace

$transformFiles = @("$targetDir\settings.OctopusTestVM.xml")
foreach($transformFile in $transformFiles){
    (Get-Content -Encoding UTF8 $transformFile) | Foreach-Object {
        $_ -replace '#{VM[#{VMName}].ServerIp}',  $CurrentIpAddr 
        ### multiple replace example :
        ###   -replace 'SQL', 'PowerShell' 
        } | Set-Content -Encoding UTF8 $transformFile
        Write-Host -ForegroundColor Green "$transformFile renewed"
    }
##### edit json files

Write-Host -ForegroundColor Green "[info] edit json files"
$json_appsetings = Get-Content -Raw -path $pathtojson | ConvertFrom-Json 
$HttpsInlineCertStore = '
    {     }
'| ConvertFrom-Json 
$json_appsetings.Kestrel.EndPoints.HttpsInlineCertStore =  $HttpsInlineCertStore
ConvertTo-Json $json_appsetings -Depth $jsonDepth  | Format-Json | Set-Content $pathtojson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth $jsonDepth"


### apply xml transformation
Write-Host -ForegroundColor Green "[info] apply xml transformation"
foreach($item in $FILES){
 try{
    XmlDocTransform -xml $item.target -xdt  $item.transf
    Write-Host -ForegroundColor Green " $item.target renewed with transformation $item.transf"}
 catch{
 
    Write-Host -ForegroundColor Red " $item.target FAIL renew with transformation $item.transf"}
}

### edit settings.xml
Write-Host -ForegroundColor Green "[INFO] Edit web.config of $webConfig"

$webdoc = [Xml](Get-Content $webConfig)
$webdoc.Settings.EventCacheSettings.Enabled = "false"
$webdoc.Settings.CurrentEventsJob.Enabled = "false"
$webdoc.Save($webConfig)

###Create dbs
Write-Host -ForegroundColor Green "[INFO] Create dbs"

RestoreSqlDb -db_params $dbs

# Выполняем скрипты из актуализации BaltBetM
$qwr="
	ALTER DATABASE BaltBetM
	COLLATE Cyrillic_General_CI_AS
	GO
	"
Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $qwr -ErrorAction continue

$sqlFiles = Get-ChildItem -path "$($release_bak_folder)\*" -Include "*.sql" -exclude $excludeSqlCmds | Sort-Object -Property Name

foreach ($file in $sqlFiles) {
	Write-Host -ForegroundColor Gray "[INFO] EXECUTED STARETED: " $file
	Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbs[0].DbName -InputFile $file -ErrorAction continue
	Write-Host -ForegroundColor Green "[INFO] EXECUTED SUCCESSFULLY: " $file 
}
