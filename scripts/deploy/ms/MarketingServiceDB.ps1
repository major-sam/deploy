import-module '.\scripts\sideFunctions.psm1'
$dbname = 'MarketingDB'
CreateSqlDatabase ($dbname)
Invoke-Sqlcmd -Database $dbname -InputFile '.\scripts\deploy\ms\DeployDb.sql'
Invoke-Sqlcmd -Database $dbname -InputFile '.\scripts\deploy\ms\InitDb.sql'
