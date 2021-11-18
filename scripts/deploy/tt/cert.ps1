# Добавляем сертификат в корневое хранилище
Write-Host "[INFO] Add certificate 'adfs' to Root Trusted"
#Import-Certificate -FilePath ".\scripts\deploy\gkbaltbet-ca.cer" -CertStoreLocation Cert:\LocalMachine\Root
certutil.exe -addstore root ".\scripts\deploy\tt\adfs.cer"
certutil.exe -addstore -f "My" ".\scripts\deploy\tt\adfs.cer"
