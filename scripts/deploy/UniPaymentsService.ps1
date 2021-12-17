import-module '.\scripts\sideFunctions.psm1'

# 4.2 Обновляем Uni.PaymentsService

$targetDir = "C:\Services\Uni.PaymentsService"

Write-Host -ForegroundColor Green "[INFO] Change settings $targetDir\appsettings.json"
$ConfigPath = "$targetDir\appsettings.json"
$new_host = $env:COMPUTERNAME
$old_url = 'vm5-p3'
$new_url = $new_host
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_url,$new_url) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath
