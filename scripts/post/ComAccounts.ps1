# Установить для всех СОМ аккунтов свойство 116 для доступа на сайт СОМ


$file = "$($env:workspace)\scripts\post\ComAccountsSql\COMAccounts.sql"
$queryTimeout = 720

Write-Host -ForegroundColor Green "[INFO] Execute COMAccounts.sql"
Invoke-Sqlcmd -verbose -QueryTimeout $queryTimeout -ServerInstance $env:COMPUTERNAME -InputFile $file -ErrorAction continue