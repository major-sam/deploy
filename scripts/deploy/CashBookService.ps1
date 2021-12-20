<#
CashBookService

Назначение
Хранение z-отчетов. Расчет оперативной кассовой книги. Формирование кассового листа (pdf)

Репозиторий
https://bitbucket.baltbet.ru:8445/projects/CASH/repos/cashbook/browse
#>


Import-module '.\scripts\sideFunctions.psm1'


$dbname = "CashBookService"
$queryTimeout = 720
$sqlfolder = "$($env:workspace)\scripts\deploy\CashBookServiceSql"

# Создаем БД CashBookService
CreateSqlDatabase($dbname)

# Выполняем скрипты
foreach ($script in (Get-Item -Path $sqlfolder\* -Include "*.sql").FullName | Sort-Object ) {    
    Write-Host -ForegroundColor Green "[INFO] Execute $script on $dbname"
    Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -Database $dbname -InputFile $script -ErrorAction continue
}

# Редактируем конфиг
$ServiceName = "CashBookService"
$ServiceFolderPath = "C:\Services\${ServiceName}"


Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.CashBookService configuration files..."
$config = Get-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8
$config = $config -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json

$config.Serilog.WriteTo[1].Args.path = "C:\logs\CashBookService\CashBookService-{Date}.log"

Set-Content -Path "$ServiceFolderPath\appsettings.json" -Encoding UTF8 -Value ($config | ConvertTo-Json -Depth 100)