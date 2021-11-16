# cleanup inetpub and IIS
## cleanup DB
#$sqlInstanceName = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
Install-Module -Name SqlServer -AllowClobber
Import-Module -Name SqlServer -Force
$rQuery =" EXEC sp_MSforeachdb
  'IF DB_ID(''?'') > 4
  BEGIN
    EXEC (''ALTER DATABASE [?] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [?]'' )
  END'
  USE [msdb]
  GO
  DECLARE @Delete_Date [datetime]
  SET @Delete_Date = GETDATE()
  exec sp_delete_backuphistory @Delete_Date 
  GO
  "
invoke-sqlcmd -ServerInstance $env:computername -Query $rQuery
