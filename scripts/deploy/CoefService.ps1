# Редактируем конфиг
$ServiceName = "CoefService"
$ServiceFolderPath = "C:\Services\${ServiceName}"
$DataBase = "BaltBetMMirror"


Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.CoefService configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json

$config.Settings.DataBase = "data source=localhost;initial catalog=${DataBase};Integrated Security=true;MultipleActiveResultSets=True;"
$config.Serilog.WriteTo[1].Args.pathFormat = "C:\logs\CoefService\CoefService-{Date}.log"

Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)
