Import-module '.\scripts\sideFunctions.psm1'

# Создаем БД Cupis.GrpcHost
$dbname = "Cupis.GrpcHost"
$queryTimeout = 720

CreateSqlDatabase $dbname
# Выполняем скрипты миграции
#foreach ($script in (Get-Item -Path $sqlfolder\* -Include "*.sql").FullName | Sort-Object ) {    
#    Write-Host -ForegroundColor Green "[INFO] Execute $script on $dbname"
#    Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbname -InputFile $script -ErrorAction continue
#}

Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbname -InputFile  'c:\services\payments\CupisGrpcDb\init.sql' -ErrorAction continue

# Редактируем конфиг
$ServiceName = "BaltBet.PaymentCupis.Grpc.Host"
$ServiceFolderPath = "C:\Services\Payments\PaymentCupisService\${ServiceName}"
$DataSource = "localhost"
$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 | Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.Payment.Cupis.GrpcHost configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$config.DbOptions.ConnectionString = "data source=${DataSource};initial catalog=${dbname};Integrated Security=true;MultipleActiveResultSets=True;"
$config.RabbitBusOptions.ConnectionString = "host=localhost"
$config.Serilog.WriteTo[1].Args.path = "C:\logs\Payments\Payment.Cupis\Payment.Cupis-.log"
$config.Kestrel.Endpoints.HttpGrpc.Url = "http://0.0.0.0:5003"
$config.Kestrel.Endpoints.HttpWeb.Url = "http://0.0.0.0:5002"
$config.AggregatorGrpcOptions.ServiceAddress = "http://${IPAddress}:32421"
$config.AggregatorGrpcOptions.NotificationUrl = "http://${IPAddress}:5001/api/v1/notifications/aggregator"
$config.AggregatorGrpcOptions.CheckWithdrawUrl = "http://${IPAddress}:5001//api/v1/payout/checkwithdraw"
Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)

$ServiceName = "PaymentCupis.RestApi.Host"
$ServiceFolderPath = "C:\Services\Payments\PaymentCupisService\${ServiceName}"

$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1 }).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Edit PaymentCupisRestApiHost configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$config.Serilog.WriteTo[1].Args.path = "C:\logs\RestLog\Payment.Cupis-.log"
$config.Kestrel.Endpoints.Http.Url = "http://${IPAddress}:5001"
Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)


# Регистрируем сервис
$serviceBin = Get-Item  "${ServiceFolderPath}\BaltBet.Payment.Cupis.RestApiHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME
