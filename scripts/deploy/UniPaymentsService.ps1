import-module '.\scripts\sideFunctions.psm1'

# 4.2 Обновляем Uni.PaymentsService

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'UniPaymentsService'
}
$source = GetSourceObject $sourceparams

$targetDir = "C:\inetpub\Uni.PaymentsService"

# Копируем сервис
Write-Host -ForegroundColor Green "[INFO] Copy Uni.PaymentsService"
Copy-Item -Path "$source.sourceBuildSource\*" -Destination $targetDir -Recurse

# Правим настройки в appsettings.json
$test_vms = Import-PowerShellDataFile -Path ".\scripts\ShortHostNames.psd1"

Write-Host -ForegroundColor Green "[INFO] Change settings $targetDir\appsettings.json"
$ConfigPath = "$targetDir\appsettings.json"
$new_host = $test_vms["$env:COMPUTERNAME"]
$old_url = 'vm5-p3'
$new_url = $new_host
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_url,$new_url) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath