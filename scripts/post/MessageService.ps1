import-module '.\scripts\sideFunctions.psm1'
$serviceBin = Get-Item  "c:\Services\MessageService\BaltBet.MessageService.Host.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
 return 0
