<#
    CupisIntegrationService
    Скрипт для разворота CupisIntegrationService
    Разворачивается в IIS
    Порт :4453
    c:\services\CupisIntegrationService\

    Конфиг: appsettings.json
#>


$ServiceName = "CupisIntegrationService"
$ServiceFolderPath = "C:\Services\${ServiceName}"


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
$config.Authorization.Realm = "https://vm4-p0.bb-webapps.com:4453/"

# Сохраняем конфиг
$config | ConvertTo-Json -Depth 100 | Set-Content "${ServiceFolderPath}\appsettings.json" -Encoding utf8


<#
    BaltBet.CupisIntegrationService.GrpcHost
    Скрипт для разворота BaltBet.CupisIntegrationService.GrpcHost.
    c:\Services\CupisIntegrationService.GrpcHost\

    Конфиг: appsettings.json

    ARCHI-238
    Дополнительно нужный правки в Web.config сайтов "UniRu" (сделать в post/UniRu.ps1 )
    <Grpc>
        <Services>
            <add name="CupisIntegrationService" host="localhost" port="5010" maxpoolchannelcount="10"/>
        </Services>
    </Grpc>
#>


$ServiceName = "CupisIntegrationServiceGrpcHost"
$ServiceFolderPath = "C:\Services\${ServiceName}"

$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()


# Редактируем конфиг
Write-Host -ForegroundColor Green "[INFO] Print BaltBet.CupisIntegrationService.GrpcHost configuration files..."
Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json"

$CupisBaseUrl = "https://demo-api.1cupis.ru/binding-api/"
$CupisBackupBaseUrl = "https://demo-api.1cupis.ru/"
$CupisCertPassword = $env:CUPIS_CERT_PASS
$CupisCertThumbprint = "CHANGE_THUMBPRINT"
$FnsBaseUrl = "http://localhost:8067"
$FnsKey = "ENTER_KEY_IF_YOU_NEED"

$config = Get-Content "${ServiceFolderPath}\appsettings.json" -Encoding utf8 | ConvertFrom-Json
$config.Cupis.BaseUrl = $CupisBaseUrl
$config.Cupis.BackupBaseUrl = $CupisBackupBaseUrl
$config.Cupis.CertPassword = $CupisCertPassword
$config.Cupis.CertThumbprint = $CupisCertThumbprint
$config.Fns.BaseUrl = $FnsBaseUrl
$config.Fns.Key = $FnsKey

# Сохраняем конфиг
$config | ConvertTo-Json -Depth 100 | Set-Content "${ServiceFolderPath}\appsettings.json" -Encoding utf8

# Регистрируем сервис
Import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Services\CupisIntegrationServiceGrpcHost\BaltBet.CupisIntegrationService.GrpcHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME