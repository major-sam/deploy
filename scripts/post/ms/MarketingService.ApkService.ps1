import-module '.\scripts\sideFunctions.psm1'

$serviceBin = Get-Item  "c:\Services\MarketingService.ApkService\BaltBet.Marketing.ApkService.exe"
$sname = RegisterWinService($serviceBin)
start-Service $sname
 return 0
