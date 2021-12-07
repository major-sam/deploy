import-module '.\scripts\sideFunctions.psm1'
$dbname = 'MarketingDB'
CreateSqlDatabase ($dbname)
Invoke-Sqlcmd -Database $dbname -InputFile '.\scripts\deploy\ms\DeployDB.sql'
Invoke-Sqlcmd -Database $dbname -InputFile '.\scripts\deploy\ms\InitDb.sql'
