import-module '.\scripts\sideFunctions.psm1'

# 2 Сервис WebTouch

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'Marketing_Client_Angular'
}
$source = GetSourceObject $sourceparams


$targetDir= "C:\inetpub\MarketingServiceClient"
$pathtojson = "$targetDir\config.json"
$webConfig = "$targetDir\index.html"
Write-Host -ForegroundColor Green "[INFO] Expand archive MarketingServiceAdmin"
Expand-Archive -LiteralPath $source.sourceBuildSource -DestinationPath $targetDir -Verbose -Force
Get-ChildItem -Recurse -Path "$targetDir\ClientApp" | % {Move-item -Path $_.FullName -Destination $targetDir }
###
#Json values replace
####
Write-Host -ForegroundColor Green "[info] edit json files"
$jsonAppsetings = Get-Content -Raw -path $pathtojson | ConvertFrom-Json 
$jsonAppsetings.apiUrl = "https://$($env:COMPUTERNAME).gkbaltbet.local:9880"
$content = ConvertTo-Json $jsonAppsetings -Depth  1 | Format-Json 
$content.getType()
Set-Content -path $pathtojson -Encoding UTF8 -Value $content
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth 1"
###
#XML values replace in html
####
$xmlContent = Get-Content -Encoding UTF8 $webConfig |
    % {$_ -replace "^.*base.*$", "<base href=`"https://$($env:COMPUTERNAME).gkbaltbet.local:9882/`">"} 
set-Content -Encoding UTF8 -Path $webConfig -Value $xmlContent
