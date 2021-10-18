# 2 Сервис WebTouch

$WebTouch_folder = "C:\inetpub\Mobile"
$WebTouch_source_file = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\WebTouchDev\2021-10-11.master.1034.65a0b7b8.zip"

#Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\Mobile"
#Remove-Item -Path $WebTouch_folder\* -Recurse -Force -Verbose

Write-Host -ForegroundColor Green "[INFO] Expand archive WebTouch"
Expand-Archive -LiteralPath $WebTouch_source_file -DestinationPath $WebTouch_folder -Verbose -Force
