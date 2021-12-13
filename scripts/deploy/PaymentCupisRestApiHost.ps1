# Редактируем конфиг
$ServiceName = "PaymentCupisRestApiHost"
$ServiceFolderPath = "C:\Services\${ServiceName}"

$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Edit PaymentCupisRestApiHost configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 | ConvertFrom-Json
$config.Kestrel.Endpoints.Http.Url = "http://${IPAddress}:5001"
Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)


# Регистрируем сервис
Import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Services\${ServiceName}\BaltBet.Payment.Cupis.RestApiHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME
