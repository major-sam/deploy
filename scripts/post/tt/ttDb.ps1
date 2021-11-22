
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$q="
UPDATE [TradingTool].[trading].[settings]
set [Value] = 'http://$($CurrentIpAddr):8444'
Where [key] = 'IMPORT_SERVICE_URL'"
Invoke-Sqlcmd -Database 'TradingTool' -query $q
