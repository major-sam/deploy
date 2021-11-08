import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "c:\KernelWeb\KernelWeb.exe"
RegisterWinService($serviceBin)
start-Service $serviceBin.BaseName

