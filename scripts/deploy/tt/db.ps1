import-module '.\scripts\sideFunctions.psm1'
$pathtojson = "C:\Services\TradingTool\Tools\Baltbet.TradingTool.Database.Updater\appsettings.json"
$pathtoProxySeedjson = "C:\Services\TradingTool\Tools\Baltbet.TradingTool.Database.Updater\ProxySeed.json"
$ProxySeedVar = "C:/Services/TradingTool/Tools/Baltbet.TradingTool.Database.Updater/ProxySeed.json"
$jsonDepth = 2

Write-Host -ForegroundColor Green "[info] edit json files"
$configFile = Get-Content -Raw -path $pathtojson 
## Json comment imporvement

$json_appsetings = $configFile -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/'| ConvertFrom-Json

$json_appsetings.ProxySeed = $ProxySeedVar
ConvertTo-Json $json_appsetings -Depth $jsonDepth  | Format-Json | Set-Content $pathtojson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth $jsonDepth"



$listVar = @()
$servicesVar = @(
	"PINNACLE",
	"MARATHONBET",
	"MARATHONBETRESULT",
	"SBOBET",
	"BETSPAN",
	"ALLBESTBETS",
	"SUREBET",
	"BET365",
	"BETRADAR",
	"BETCITY",
	"ONEXBET",
	"FONBET",
	"OLIMP",
	"ZENIT",
	"PARIMATCH",
	"FLASHSCORE",
	"VBET"
	)
get-content '.\scripts\deploy\tt\proxies.txt' | % {
	$prx = @{ Uri = "$_";
	        Username = "";
			Password = "";
			Services = $servicesVar;
			}
	$listVar += $prx
	}

ConvertTo-Json $listVar -Depth 3 | Format-Json | Set-Content $pathtoProxySeedjson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtoProxySeedjson renewed with json depth 3"

& 'C:\Services\TradingTool\Tools\Baltbet.TradingTool.Database.Updater\Baltbet.TradingTool.Database.Updater.exe'|
  %{ 
	  Write-output $_
      if ($_ -like "Press enter for exit"){
         [Environment]::Exit(0)
           } 
             } 


