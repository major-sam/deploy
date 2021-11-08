import-module '.\scripts\sideFunctions.psm1'

Write-Host -ForegroundColor Green "[INFO] Creating BaltBet.MarketingService ..."
$serviceBin = Get-Item  "c:\Services\MarketingService.ApkService\BaltBet.Marketing.ApkService.exe"
RegisterWinService($serviceBin)
start-Service $serviceBin.BaseName
