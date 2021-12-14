import-module '.\scripts\sideFunctions.psm1'

# 3 Сервис PDA

#get release params
$WebPda_folder = "C:\inetpub\baltplaymobile"

Write-Host -ForegroundColor Green "[INFO] Expand archive WebPDA"
Expand-Archive -LiteralPath "\\\\server\\tcbuild$\\WebPda\\2021-10-11.master.1024.f463408c.zip" -DestinationPath $WebPda_folder -Force
