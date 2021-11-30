import-module '.\scripts\sideFunctions.psm1'
##### edit imorter json files
## mayby to env
$logPath = "C:\Logs\Payment\BaltBet.Payment.BalancingService-.txt"
$apiAddr =  (Get-NetIPAddress -AddressFamily IPv4 | ?{$_.InterfaceIndex -ne 1}).IPAddress.trim()
$apiPort = '50001'
$pathtojson = 'C:\Services\Payment\PaymentBalancing\BaltBet.Payment.BalancingService\appsettings.json'
$jsonDepth = 4

Write-Host -ForegroundColor Green "[info] edit json files"
$configFile = Get-Content $pathtojson  -Raw
## Json comment imporvement

$json_appsetings = $configFile -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/'| ConvertFrom-Json

$json_appsetings.Kestrel.Endpoints.Https.Url = "https://$($apiAddr):$($apiPort)"
$json_appsetings.Kernel.KernelApiBaseAddress = "http://$($apiAddr):8081"
($json_appsetings.Serilog.WriteTo|%{
	 if($_.name -like "file"){
		 $_.Args.path = $logPath
	  }
})
$json_appsetings.Swagger.Enabled = $false
ConvertTo-Json $json_appsetings -Depth $jsonDepth  | Format-Json | Set-Content $pathtojson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth $jsonDepth"
