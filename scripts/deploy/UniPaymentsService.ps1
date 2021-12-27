import-module '.\scripts\sideFunctions.psm1'

# 4.2 Обновляем Uni.PaymentsService

$targetDir = "C:\Services\UniPaymentsService"

Write-Host -ForegroundColor Green "[INFO] Change settings $targetDir\appsettings.json"
$ConfigPath = "$targetDir\appsettings.json"
$new_host = $env:COMPUTERNAME
$config = Get-Content -Raw -path $ConfigPath 
$json_appsettings = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$json_appsettings.ConnectionStrings.UniSiteSettings = "data source=localhost;initial catalog=UniRu;Integrated Security=True;MultipleActiveResultSets=True;"
$json_appsettings.Origins[0] = "https://$($new_host).bb-webapps.com:4443"
$json_appsettings.Origins[1] = "https://$($new_host).bb-webapps.com:4445"
$json_appsettings.Grpc.Services[0].Name = "Payment.Cupis.GrpcHost"
$json_appsettings.Grpc.Services[0].Host = $new_host
$json_appsettings.Grpc.Services[0].Port = 5003

ConvertTo-Json $json_appsettings -Depth 4 | Format-Json | Set-Content $ConfigPath -Encoding UTF8

