# 3 Сервис PDA

$WebPda_folder = "C:\inetpub\baltplaymobile"
$WebTouch_source_file = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\WebPda\2021-10-11.master.1024.f463408c.zip"

#Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\baltplaymobile"
#Remove-Item -Path $WebPda_folder\* -Recurse -Force -Verbose

Write-Host -ForegroundColor Green "[INFO] Expand archive WebPDA"
Expand-Archive -LiteralPath $WebTouch_source_file -DestinationPath $WebPda_folder -Verbose -Force
