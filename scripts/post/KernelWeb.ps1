import-module '.\scripts\sideFunctions.psm1'

$serviceBin = Get-Item  "C:\KernelWeb\KernelWeb.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
 return 0
