import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "C:\Kernel\Kernel.exe"
RegisterWinService($serviceBin)
start-Service $serviceBin.BaseName
