import-module '.\scripts\sideFunctions.psm1'
##### edit imorter json files
## mayby to env
$logPath = "C:\Logs\Payments\BaltBet.Payment.BalancingService-.txt"
$apiAddr =  (Get-NetIPAddress -AddressFamily IPv4 | ?{$_.InterfaceIndex -ne 1}).IPAddress.trim()
$apiPort = '50001'
$pathtojson = "C:\Services\Payments\PaymentBalanceReport\appsettings.json"
$jsonDepth = 4

Write-Host -ForegroundColor Green "[info] edit json files"
$configFile = Get-Content -Encoding UTF8 $pathtojson  -Raw 
## Json comment imporvement

$json_appsetings = $configFile -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/'| ConvertFrom-Json

$json_appsetings.Kestrel.Endpoints.Https.Url = "https://$($apiAddr):$($apiPort)"
$json_appsetings.Kestrel.Endpoints.Https.Certificate.Location = "LocalMachine"
$json_appsetings.BalancingServiceOptions.BaseAddress = "http://$($apiAddr):8081"
$json_appsetings.KernelOptions.KernelApiBaseAddress = "http://$($apiAddr):8081"
($json_appsetings.Serilog.WriteTo|%{
	     if($_.name -like "file"){
			         $_.Args.path = $logPath
					      }
})
ConvertTo-Json $json_appsetings -Depth $jsonDepth  | Format-Json | Set-Content $pathtojson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth $jsonDepth"
