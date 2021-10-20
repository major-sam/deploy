# Добавляем сертификат в корневое хранилище
Write-Host -ForegroundColor Green "[INFO] Add certificate 'gkbaltbet-ca' to Root Trusted"
Import-Certificate -FilePath ".\scripts\deploy\gkbaltbet-ca.cer" -CertStoreLocation Cert:\LocalMachine\Root