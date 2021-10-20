# 4.2 Обновляем Uni.PaymentsService
$UniPaymentsService_folder = "C:\inetpub\Uni.PaymentsService"
$UniPaymentsService_source_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\Uni.PaymentsService\1.0.0.21\*"

# Копируем сервис
Write-Host -ForegroundColor Green "[INFO] Copy Uni.PaymentsService"
Copy-Item -Path $UniPaymentsService_source_folder -Destination $UniPaymentsService_folder -Recurse

# Правим настройки в appsettings.json
$test_vms = Import-PowerShellDataFile -Path ".\scripts\ShortHostNames.psd1"

Write-Host -ForegroundColor Green "[INFO] Change settings $UniPaymentsService_folder\appsettings.json"
$ConfigPath = "$UniPaymentsService_folder\appsettings.json"
$new_host = $test_vms["$env:COMPUTERNAME"]
$old_url = 'vm5-p3'
$new_url = $new_host
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_url,$new_url) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath