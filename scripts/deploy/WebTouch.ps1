import-module '.\scripts\sideFunctions.psm1'

# 2 Сервис WebTouch

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'WebTouch'
}
$source = GetSourceObject $sourceparams


$WebTouch_folder = "C:\inetpub\Mobile"

Write-Host -ForegroundColor Green "[INFO] Expand archive WebTouch"
Expand-Archive -LiteralPath $source.sourceBuildSource -DestinationPath $WebTouch_folder -Force
