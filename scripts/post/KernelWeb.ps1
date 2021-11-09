import-module '.\scripts\sideFunctions.psm1'

$serviceBin = Get-Item  "C:\KernelWeb\KernelWeb.exe"
RegisterWinService($serviceBin)
Get-Service | where {$_.Name -like "*$($serviceBin.BaseName)*"}| start-Service 
