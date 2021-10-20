# 3 Сервис PDA

$WebPda_folder = "C:\inetpub\baltplaymobile"

Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\baltplaymobile"
Remove-Item -Path $WebPda_folder\* -Recurse -Force -Verbose