# 2 Сервис WebTouch
$WebTouch_folder = "C:\inetpub\Mobile"

Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\Mobile"
Remove-Item -Path $WebTouch_folder\* -Recurse -Force -Verbose
