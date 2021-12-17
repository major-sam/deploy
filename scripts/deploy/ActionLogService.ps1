
# Редактируем конфиг
$ServiceName = "ActionLogService"
$ServiceFolderPath = "C:\Services\${ServiceName}"
$DataSource = "BaltBetM"


Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.ActionLogService configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json

$config.Serilog.WriteTo[1].Args.path = "C:\logs\ActionLogService\ActionLogService-.log"
$config.Settings.Database = "data source=${DataSource};initial catalog=Cupis.GrpcHost;Integrated Security=true;MultipleActiveResultSets=True;"

Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)
