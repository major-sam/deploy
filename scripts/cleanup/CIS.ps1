# 4.1 Обновление CupisIntegrationService
$CupisIntegrationService_folder = "C:\inetpub\CupisIntegrationService"

# Очищаем содержимое CupisIntegrationService
Write-Host -ForegroundColor Green "[INFO] Remove files in CupisIntegrationService"
Remove-Item -Path $CupisIntegrationService_folder\* -Recurse -Force
