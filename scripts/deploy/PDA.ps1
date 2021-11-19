import-module '.\scripts\sideFunctions.psm1'

# 3 Сервис PDA

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'PDA'
}
$source = GetSourceObject $sourceparams

$WebPda_folder = "C:\inetpub\baltplaymobile"

Write-Host -ForegroundColor Green "[INFO] Expand archive WebPDA"
Expand-Archive -LiteralPath $source.sourceBuildSource -DestinationPath $WebPda_folder -Force
