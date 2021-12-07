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
$jsonDepth = 4
$queryTimeout = 720
$webConfig = "$targetDir\settings.xml"
$UnityConfig = "$targetDir\Config\UnityConfig.config"
$LogConfig = "$targetDir\Config\Log.Config"
$KernelConfig ="$targetDir\Kernel.exe.config"
$dbs = @(
	@{
		DbName = "BaltBetM"
		BackupFile = "\\server\tcbuild$\Testers\DB\BaltBetM.original.bak"
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
		BackupFile = "\\server\tcbuild$\Testers\DB\BaltBetM.original.bak"
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
		BackupFile = "\\server\tcbuild$\Testers\DB\BaltBetWeb.bak"
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
#if ($DEPLOY_BY_MAVEN ){
#	Write-host "####################"
#	Write-host "robocopy replaced by maven"
#	Write-host "####################"
#}
#else{
#### copy files
#	robocopy "$($source.sourceBuildSource)\$netVersion\" $targetDir /e /NFL /NDL /nc /ns /np
#
#	$global:LASTEXITCODE
#
#	if ($global:LASTEXITCODE -ne 0){
#		$global:LASTEXITCODE = 0
#	}
#}
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
$cachePath = 'c:\kCache'
if (!(test-path $cachePath)){
	md $cachePath

	}
$webdoc = [Xml](Get-Content $webConfig)
$webdoc.Settings.EventCacheSettings.Enabled = "false"
$webdoc.Settings.EventCacheSettings.CoefsCache.FileName = "$cachePath\EventCoefsCache.dat"
$webdoc.Settings.EventCacheSettings.CoefSumCache.FileName =  "$cachePath\EventCoefsSumCache.dat"

$webdoc.Settings.CurrentEventsJob.Enabled = "false"
$webdoc.Settings.CurrentEventsJob.FileCache.FileName = "$cachePath\EventCoefsCacheJob.dat"
$webdoc.Save($webConfig)
### edit Log.config
Write-Host "[INFO] Edit web.config of $LogConfig"

$webdoc = [Xml](Get-Content $LogConfig)
$webdoc.log4net.appender|%{$_.file.value = $_.file.value.replace("Log\", "c:\logs\kernel\")}

$webdoc.Save($LogConfig)

### edit Unity.config.xml
Write-Host "[INFO] Edit web.config of $UnityConfig"

$webdoc = [Xml](Get-Content $UnityConfig)
($webdoc.unity.container|%{$_.register}|?{$_.type -like "Kernel.IStopKernelValidator, Kernel"}).constructor.param.value = "config\StartStop.txt"
$webdoc.Save($UnityConfig)

### edit kernel.exe.config
$conf = [Xml](Get-Content $KernelConfig)
$conf.configuration."system.serviceModel".services.service |% {$_.endpoint |% {$_.address = $_.address.replace("localhost",$CurrentIpAddr)}}
$conf.Save($KernelConfig)
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

$sqlFiles = Get-ChildItem -path "$($env:workspace)\scripts\deploy\KernelSql\*" -Include "*.sql" | Sort-Object -Property Name

$release_bak_folder = 
foreach ($file in $sqlFiles) {
	Write-Host -ForegroundColor Gray "[INFO] EXECUTED STARETED: " $file
	Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbs[0].DbName -InputFile $file -ErrorAction continue
	Write-Host -ForegroundColor Green "[INFO] EXECUTED SUCCESSFULLY: " $file 
}
####KERNELWEB
# vars
$targetDir = 'C:\KernelWeb'
$transformLibPath = ".\scripts\Microsoft.Web.XmlTransform.dll"
$transformFiles = @("$targetDir\settings.OctopusTestVM.xml","$targetDir\App.OctopusTestVM.config")

$FILES= @(
      @{
        transf = "$targetDir\App.OctopusTestVM.config"
        target = "$targetDir\KernelWeb.exe.config"
      }
      @{
        transf = "$targetDir\settings.OctopusTestVM.xml"
        target = "$targetDir\settings.xml"
      }
)
##### raw replace
foreach($transformFile in $transformFiles){
    (Get-Content -Encoding UTF8 $transformFile) | Foreach-Object {
        $_ -replace '#{VM[#{VMName}].ServerIp}',  $CurrentIpAddr `
           -replace '#{KernelWeb_apconf_AddressSlotService}', 'localhost'`
           -replace '#{KernelWeb_apconf_CertSubjectName}', 'VM1APKTEST-P0.gkbaltbet.local' 
        } | Set-Content -Encoding UTF8 $transformFile
        Write-Host -ForegroundColor Green "$transformFile renewed"
    }


##### apply xml transformation
foreach($item in $FILES){
 try{
    XmlDocTransform -xml $item.target -xdt  $item.transf
    Write-Host -ForegroundColor Green " $item.target renewed with transformation $item.transf"}
 catch{
 
    Write-Host -ForegroundColor Red " $item.target FAIL renew with transformation $item.transf"}
}
$LogConfig  = "C:\KernelWeb\KernelWeb.exe.config"
Write-Host "[INFO] Edit web.config of $LogConfig"

$webdoc = [Xml](Get-Content $LogConfig)
$webdoc.configuration.log4net.appender|%{$_.file.value = "c:\logs\kernelWeb\"}

$webdoc.Save($LogConfig)
