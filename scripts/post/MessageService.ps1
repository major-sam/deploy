import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "c:\Services\MessageService\BaltBet.MessageService.Host.exe"
RegisterWinService($serviceBin)
start-Service $serviceBin.BaseName
