<#
    BaltBet.TicketServiceApi
    Скрипт для разворота BaltBet.TicketServiceApi.
    c:\Services\TicketService

    Дополнительно нужный правки в Web.config сайтов "UniRu","baltbetcom","baltbetru"
#>


$ServiceName = "TicketService"
$ServiceFolderPath = "C:\Services\${ServiceName}"
$IPAddress = (Get-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4).IPAddress


# Редактирование конфигов
Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.TicketServiceApi configuration files..."
(Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json") -replace "localhost:5037","${IPAddress}:5037" | Set-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json" 

Write-Host -ForegroundColor Green "[INFO] Print BaltBet.TicketServiceApi configuration files..."
Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\appsettings.json"

# Регистрируем сервис
Import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Services\TicketService\TicketService.API.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME