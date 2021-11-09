import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "c:\Services\MessageService\BaltBet.MessageService.Host.exe"
RegisterWinService($serviceBin)
Get-Service | where {$_.Name -like "*$($serviceBin.BaseName)*"}| start-Service 
