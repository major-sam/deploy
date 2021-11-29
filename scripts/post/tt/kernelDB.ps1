$scriptpath = 'C:\myfile.sql';
$passVar = ConvertTo-SecureString $ENV:TT_SERVICE_CREDS_PSW -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($ENV:TT_SERVICE_CREDS_USR , $passVar )
$scriptBlock = {invoke-sqlcmd  -InputFile  ".\scripts\post\tt\KernelLineEvents.sql" }
$job1 = Invoke-Command -credential $credentials -scriptBlock $scriptBlock -AsJob -JobName 'J1';

 Get-Job | Wait-Job;
 Get-Job -Name 'J1';

 Get-PSSession | Remove-Session;
 Get-Job | Remove-Job;
