import-module '.\scripts\sideFunctions.psm1'

# 4.2 Обновляем Uni.PaymentsService


$ConfigPath = "c:\Services\UniPaymentsService\appsettings.json"
Write-Host -ForegroundColor Green "[INFO] Change settings $ConfigPath"
$new_host = $env:COMPUTERNAME
$config = Get-Content -Raw -path $ConfigPath 
$json_appsetings = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$json_appsetings.ConnectionStrings.UniSiteSettings = "data source=localhost;initial catalog=UniRu;Integrated Security=SSPI;MultipleActiveResultSets=True;"
$json_appsetings.Origins =@( "https://$($env:COMPUTERNAME).bb-webapps.com:4443",
 "https://$($env:COMPUTERNAME).bb-webapps.com:4444",
 "https://$($env:COMPUTERNAME).bb-webapps.com:4445")
ConvertTo-Json $json_appsetings -Depth 4 | Format-Json | Set-Content $ConfigPath -Encoding UTF8
$json_appsettings.Grpc.Services[0].Host = $new_host
$json_appsettings.Grpc.Services[0].Port = 5003

ConvertTo-Json $json_appsettings -Depth 4 | Format-Json | Set-Content $ConfigPath -Encoding UTF8

