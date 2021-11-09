import-module '.\scripts\sideFunctions.psm1'

Write-Host -ForegroundColor Green "[INFO] Creating BaltBet.MarketingService ..."
$serviceBin = Get-Item  "c:\Services\MarketingService.ApkService\BaltBet.Marketing.ApkService.exe"
RegisterWinService($serviceBin)
Get-Service | where {$_.Name -like "*$($serviceBin.BaseName)*"}| start-Service 
