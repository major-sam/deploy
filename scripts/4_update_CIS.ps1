# 4.1 Обновление CupisIntegrationService
$test_vms = Import-PowerShellDataFile -Path "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\deploy\ShortHostNames.psd1"

$new_host = $test_vms["$env:COMPUTERNAME"]


$CupisIntegrationService_folder = "C:\inetpub\CupisIntegrationService"
$CupisIntegrationService_source_folder = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\CupisIntegrationService\1.0.0.133\*"

# Очищаем содержимое CupisIntegrationService
Write-Host -ForegroundColor Green "[INFO] Remove files in CupisIntegrationService"
Remove-Item -Path $CupisIntegrationService_folder\* -Recurse -Force

Write-Host -ForegroundColor Green "[INFO] Copy CupisIntegrationService"
Copy-Item -Path $CupisIntegrationService_source_folder -Destination $CupisIntegrationService_folder -Recurse
Start-Sleep -s 10
# Выполняем запрос
Invoke-WebRequest -UseBasicParsing -Uri "https://$new_host.bb-webapps.com:4453/management/requests" -Method Get
Start-Sleep -s 30
Write-Host -ForegroundColor Green "[INFO] Execute webrequest"
$r = Invoke-WebRequest -UseBasicParsing -Uri "https://$new_host.bb-webapps.com:4453/management/requests" -Method Get
if ($r.StatusCode -eq "200") {
    Write-Host -ForegroundColor Green "[INFO] CupisIntegrationService is working"
} else {
    Write-Host -ForegroundColor Red "[WARN] CupisIntegrationService is not working"
}
