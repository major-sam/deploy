



$svcs = (invoke-sqlcmd -Query "sp_linkedservers").SRV_NAME
if($svcs.contains("srvapkbb3.gkbaltbet.local")){ 
    $svcs
    Write-Host "srvapkbb3.gkbaltbet.local allready linked"
}
else{
    invoke-sqlcmd -Query "sp_addlinkedserver  [srvapkbb3.gkbaltbet.local]" | Out-Null
}


$q = invoke-sqlcmd -Query "select * from sys.server_principals where name like '$ENV:TT_SERVICE_CREDS_USR'"


if ($q){
    write-host $q.name
}
else{    $conn = New-Object Microsoft.SqlServer.Management.Common.ServerConnection -ArgumentList $env:ComputerName
    $conn.applicationName = "PowerShell SMO"
    $conn.ServerInstance = "$env:ComputerName"
    $conn.StatementTimeout = 0
    $conn.Connect()
    $smo = New-Object Microsoft.SqlServer.Management.Smo.Server -ArgumentList $conn
    $SqlUser = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Login -ArgumentList $smo,"GKBALTBET\kernelsvc"
    $SqlUser.LoginType = 'WindowsUser'
    $sqlUser.PasswordPolicyEnforced = $false
    $SqlUser.Create()
    $sqlUser.AddToRole("sysadmin")
    $sqlUser.Alter()
    write-host "done"    
}

$passVar = ConvertTo-SecureString $ENV:TT_SERVICE_CREDS_PSW -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($ENV:TT_SERVICE_CREDS_USR , $passVar )
$scriptBlock = { importsystemmodules; invoke-sqlcmd -QueryTimeout 720 -database 'BaltbetM'  -ServerInstance LOCALHOST -InputFile  ".\scripts\post\tt\KernelLineEvents.sql" }
$job = Start-Job  -ScriptBlock $scriptBlock -Credential $credentials |get-job |Wait-job
$result = Receive-Job -Job $job
$result

Remove-Job -Job $job


