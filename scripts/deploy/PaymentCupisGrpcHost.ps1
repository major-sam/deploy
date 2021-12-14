Import-module '.\scripts\sideFunctions.psm1'

# Создаем БД Cupis.GrpcHost
$dbname = "Cupis.GrpcHost"

Write-Host -ForegroundColor Green "[INFO] Create database Cupis.GrpcHost"
Invoke-sqlcmd -ServerInstance $env:COMPUTERNAME -Query "CREATE DATABASE [$dbname]" -Verbose


# Редактируем конфиг
$ServiceName = "PaymentCupisGrpcHost"
$ServiceFolderPath = "C:\Services\${ServiceName}"
$DataSource = "localhost"
$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 | Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.Payment.Cupis.GrpcHost configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$config.DbOptions.ConnectionString = "data source=${DataSource};initial catalog=Cupis.GrpcHost;Integrated Security=true;MultipleActiveResultSets=True;"
$config.RabbitBusOptions.ConnectionString = "host=localhost"
$config.Serilog.WriteTo[1].Args.path = "C:\logs\Payment.Cupis\Payment.Cupis-.log"
$config.Kestrel.Endpoints.HttpGrpc.Url = "http://0.0.0.0:5003"
$config.Kestrel.Endpoints.HttpWeb.Url = "http://0.0.0.0:5002"
$config.AggregatorGrpcOptions.ServiceAddress = "http://${IPAddress}:32421"
$config.AggregatorGrpcOptions.NotificationUrl = "http://${IPAddress}:5001/api/v1/notifications/aggregator"
$config.AggregatorGrpcOptions.CheckWithdrawUrl = "http://${IPAddress}:5001//api/v1/payout/checkwithdraw"
Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)


# Регистрируем сервис
$serviceBin = Get-Item  "C:\Services\${ServiceName}\BaltBet.Payment.Cupis.GrpcHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME
