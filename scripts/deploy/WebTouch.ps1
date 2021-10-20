# 2 Сервис WebTouch

$WebTouch_folder = "C:\inetpub\Mobile"
$WebTouch_source_file = "\\server\tcbuild$\Testers\_VM Update Instructions\15.10.2021 RELEASE\WebTouchDev\2021-10-15.master.1026.a07f5a68.zip"

Write-Host -ForegroundColor Green "[INFO] Expand archive WebTouch"
Expand-Archive -LiteralPath $WebTouch_source_file -DestinationPath $WebTouch_folder -Verbose -Force
