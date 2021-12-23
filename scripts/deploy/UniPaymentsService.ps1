import-module '.\scripts\sideFunctions.psm1'

# 4.2 Обновляем Uni.PaymentsService

$targetDir = "C:\Services\UniPaymentsService"

Write-Host -ForegroundColor Green "[INFO] Change settings $targetDir\appsettings.json"
$ConfigPath = "$targetDir\appsettings.json"
$new_host = $env:COMPUTERNAME
$old_url = 'vm5-p3'
$new_url = $new_host
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_url,$new_url) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath
$config = Get-Content -Raw -path $ConfigPath 
$json_appsetings = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$json_appsetings.ConnectionStrings.UniSiteSettings = "data source=localhost;initial catalog=UniRu;Integrated Security=SSPI;MultipleActiveResultSets=True;"
$json_appsetting.Origins[0] = "https://$($new_host).bb-webapps.com:4443"
$json_appsetting.Origins[1] = "https://$($new_host).bb-webapps.com:4444"
$json_appsetting.Origins[2] = "https://$($new_host).bb-webapps.com:4445"
ConvertTo-Json $json_appsetings -Depth 4 | Format-Json | Set-Content $pathtojson -Encoding UTF8
