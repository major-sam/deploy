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


$ServiceName = "CupisIntegrationService.GrpcHost"
$ServiceFolderPath = "C:\Services\${ServiceName}"

$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()


# Редактирование конфигов
Write-Host -ForegroundColor Green "[INFO] Print BaltBet.CupisIntegrationService.GrpcHost configuration files..."
Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json"

# Регистрируем сервис
Import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Services\CupisIntegrationService.GrpcHost\BaltBet.CupisIntegrationService.GrpcHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME