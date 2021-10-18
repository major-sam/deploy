# 1 Сервис UniWebApi.Auth

$UniWebApiAuth_folder = "C:\inetpub\webapiAuth"
$UniWebApiAuth_source_file = "\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\Auth\webapi.Auth_2021.10.06-2021-10-07.1730.5cd9b757.zip"

Write-Host -ForegroundColor Green "[INFO] Remove files from C:\inetpub\webapiAuth"
Remove-Item -Path $UniWebApiAuth_folder\* -Recurse -Force -Verbose

Write-Host -ForegroundColor Green "[INFO] Expand archive UniWebApiAuth"
Expand-Archive -LiteralPath $UniWebApiAuth_source_file -DestinationPath $UniWebApiAuth_folder -Verbose

Write-Host -ForegroundColor Green "[INFO] Edit web.config of UniWebApiAuth"
[xml]$ConfigContent = Get-Content -Encoding utf8 -Path C:\inetpub\webapiAuth\Web.config 
$ConnectionStringsAdd = $ConfigContent.CreateElement('add')
$ConnectionStringsAdd.SetAttribute("name","OAuth.LastLogoutUrl")
$ConnectionStringsAdd.SetAttribute("connectionString","https://${env:COMPUTERNAME}.gkbaltbet.local:449/account/logout/last")
$ConfigContent.configuration.connectionStrings.AppendChild($ConnectionStringsAdd)
$ConfigContent.Save("C:\inetpub\webapiAuth\Web.config")
