#Создаем БД 
Invoke-WebRequest -UseBasicParsing -Uri "https://$env:COMPUTERNAME.bb-webapps.com:4453/management/requests" -Method Get
Start-Sleep -s 30