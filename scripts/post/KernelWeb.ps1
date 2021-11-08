import-module '.\scripts\sideFunctions.psm1'

$serviceBin = Get-Item  "C:\KernelWeb\KernelWeb.exe"
RegisterWinService($serviceBin)
Start-Service "Baltbet.$($serviceBin.BaseName)"
