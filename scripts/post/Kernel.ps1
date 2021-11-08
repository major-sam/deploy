import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Kernel\Kernel.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
