
import-module '.\scripts\sideFunctions.psm1'

$ServiceFolderPath = "C:\Services\Payments\PaymentCupisService\BaltBet.PaymentCupis.Grpc.Host"
$serviceBin = Get-Item  "${ServiceFolderPath}\BaltBet.Payment.Cupis.GrpcHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME

$ServiceFolderPath = "C:\Services\Payments\PaymentCupisService\PaymentCupis.RestApi.Host"
$serviceBin = Get-Item  "${ServiceFolderPath}\BaltBet.Payment.Cupis.RestApiHost.exe"
$serviceBin = Get-Item  "${ServiceFolderPath}\BaltBet.Payment.Cupis.GrpcHost.exe"
$sname = RegisterWinService($serviceBin)
Start-Service $sname
Set-Recovery -ServiceDisplayName $sname -Server $env:COMPUTERNAME

