import-module '.\scripts\sideFunctions.psm1'
$dbname = 'BalancingDb'
CreateSqlDatabase ($dbname)
#Invoke-Sqlcmd -Database $dbname -InputFile '.\scripts\deploy\ms\InitDb.sql'
