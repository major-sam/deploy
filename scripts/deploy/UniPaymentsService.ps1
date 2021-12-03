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

write-host "Copy-Item -Path $($source.sourceBuildSource)  -Destination $targetDir -Recurse "
robocopy "$($source.sourceBuildSource)"  $targetDir /e /NFL /NDL /nc /ns /np
$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}
Write-Host -ForegroundColor Green "[INFO] Change settings $targetDir\appsettings.json"
$ConfigPath = "$targetDir\appsettings.json"
$new_host = $env:COMPUTERNAME
$old_url = 'vm5-p3'
$new_url = $new_host
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_url,$new_url) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath
