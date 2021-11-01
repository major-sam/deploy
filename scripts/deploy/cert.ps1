# Добавляем сертификат в корневое хранилище
Write-Host -ForegroundColor Green "[INFO] Add certificate 'gkbaltbet-ca' to Root Trusted"
Import-Certificate -FilePath ".\scripts\deploy\gkbaltbet-ca.cer" -CertStoreLocation Cert:\LocalMachine\Root

# Добавляем новый сертификат в Windows(Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606)
Write-Host -ForegroundColor Green "[INFO] Add new *.bb-weapps.com certificate"
$Secure_String_Pwd = ConvertTo-SecureString "BaltbetBB" -AsPlainText -Force
Import-PfxCertificate -FilePath ".\scripts\deploy\bb-webapps.pfx" -CertStoreLocation Cert:\LocalMachine\My -Password $Secure_String_Pwd


# Добавляем новый сертификат в Windows
Write-Host -ForegroundColor Green "[INFO] Add new test.wcf.host.pfx certificate"
$Secure_String_Pwd = ConvertTo-SecureString "12345" -AsPlainText -Force
Import-PfxCertificate -FilePath "\.\scripts\deploy\test.wcf.host.pfx" -CertStoreLocation Cert:\LocalMachine\My -Password $Secure_String_Pwd
