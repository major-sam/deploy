<#
    CupisIntegrationService
    Скрипт для разворота CupisIntegrationService
    Разворачивается в IIS
    Порт :4453
    c:\inetpub\CupisIntegrationService\

    Конфиг: appsettings.json
#>


$ServiceName = "CupisIntegrationService"
$ServiceFolderPath = "C:\inetpub\${ServiceName}"


# Редактируем конфиг
Write-Host -ForegroundColor Green "[INFO] Print CupisIntegrationService configuration files..."
Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json"

$CupisBaseUrl = "https://demo-api.1cupis.ru/binding-api/"
$CupisBackupBaseUrl = "https://demo-api.1cupis.ru/"
$CupisCertPassword = $env:CUPIS_CERT_PASS
$FnsBaseUrl = "https://api-fns.ru/api/"
$FnsKey = $env:CUPIS_FNS_KEY

$config = Get-Content "${ServiceFolderPath}\appsettings.json" -Encoding utf8 | ConvertFrom-Json
$config.Cupis.BaseUrl = $CupisBaseUrl
$config.Cupis.BackupBaseUrl = $CupisBackupBaseUrl
$config.Cupis.CertPassword = $CupisCertPassword
$config.Bus.CupisCallbackBusConnectionString = "host=localhost"
$config.Fns.BaseUrl = $FnsBaseUrl
$config.Fns.Key = $FnsKey
$config.VirtualMachines.EnableMultiNotification = "false"
$config.DocumentImages.UploadServiceAddress = "http://localhost:8123"
$config.Authorization.Realm = "https://$env:COMPUTERNAME.bb-webapps.com:4453"

# Сохраняем конфиг
$config | ConvertTo-Json -Depth 100 | Set-Content "${ServiceFolderPath}\appsettings.json" -Encoding utf8

