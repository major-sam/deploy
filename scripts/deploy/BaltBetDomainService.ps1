<#
Хостится как приложение в IIS https:8004
Необходимо создать БД BaltBetDomain
#>
Write-Host -ForegroundColor Green "In progress..."

# Создаем БД BaltBetDomain
$queryTimeout = 720
$dbname = "BaltBetDomain"

Write-Host -ForegroundColor Green "[INFO] Create database $dbname"
Invoke-sqlcmd -ServerInstance $env:COMPUTERNAME -Query "CREATE DATABASE [$dbname]" -Verbose