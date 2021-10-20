# 1 Сервис UniWebApi.Auth

$UniWebApiAuth_folder = "C:\inetpub\webapiAuth"

Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\webapiAuth"
Remove-Item -Path $UniWebApiAuth_folder\* -Recurse -Force -Verbose
