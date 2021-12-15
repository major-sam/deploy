<#
Хостится как приложение в IIS https:8004
Необходимо создать БД BaltBetDomain
#>


Write-Host -ForegroundColor Green "In progress..."

# Редактируем конфиг
$ServiceName = "BaltBetDomainService"
$ServiceFolderPath = "C:\inetpub\${ServiceName}"
$CSDomainDb = "server=localhost;Integrated Security=SSPI;MultipleActiveResultSets=true;Initial Catalog=BaltBetDomain"
$CSKernelDb = "server=localhost;Integrated Security=SSPI;MultipleActiveResultSets=true;Initial Catalog=BaltBetM"

Write-Host -ForegroundColor Green "[INFO] Edit BaltBetDomainService configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json
$config.ConnectionStrings.DomainDb = $CSDomainDb
$config.ConnectionStrings.KernelDb = $CSKernelDb
Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)

# Создаем БД BaltBetDomain
$queryTimeout = 720
$dbname = "BaltBetDomain"

Write-Host -ForegroundColor Green "[INFO] Create database $dbname"
Invoke-sqlcmd -ServerInstance $env:COMPUTERNAME -Query "CREATE DATABASE [$dbname]" -Verbose