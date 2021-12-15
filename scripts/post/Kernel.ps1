import-module '.\scripts\sideFunctions.psm1'

$serviceBin = Get-Item  "C:\Kernel\Kernel.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME
$serviceBin = Get-Item  "C:\KernelWeb\KernelWeb.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME
 return 0
New-SmbShare -Name 'BaltbetLogs' -path C:\Logs
if (test-path "c:\kernel\TasksDB"){
	write-host "Exec tasks"
	get-ChildItem "c:\kernel\taskdb\" -include "*.sql" | % {
		Invoke-Sqlcmd -verbose -QueryTimeout 720 -ServerInstance $env:COMPUTERNAME -Database 'BaltBetM' -InputFile $_ -Verbose -ErrorAction continue
		}
}else{
	write-host "no task for this branch"
}
