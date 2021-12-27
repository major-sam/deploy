# Меняем настройки сайта

function Replace-StringInArray
{
	param (
		$ConfigPath,
		$ContainsString,
		$OldString,
		$NewString
	)

	$content = Get-Content -Encoding UTF8 -Path $ConfigPath

	foreach ($str in $content) 
	{
		if ($str.Contains($ContainsString)){ 
			$content[$content.IndexOf($str)] = $str.Replace($OldString,$NewString) 
		}
	}

	Set-Content -Path $ConfigPath -Encoding UTF8 -Value $content
}


$IPAddress = (Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

Write-Host -ForegroundColor Green "[INFO] Change ${inetpub}\${site}\Web.config ..."
$inetpub = "C:\inetpub\ClientWorkPlace"
$site = "UniRu"

# Меняем настройки для TicketService
Replace-StringInArray -ConfigPath "${inetpub}\${site}\Web.config" -ContainsString "TicketService" -OldString "localhost" -NewString $IPAddress
Replace-StringInArray -ConfigPath "${inetpub}\${site}\Web.config" -ContainsString "TicketService" -OldString "5000" -NewString "5037"


# Включаем функционал платежных систем в админке
$EnablePayments = "
UPDATE UniRu.Settings.SiteOptions
SET Value = 'true'
WHERE Name = 'Payment.IsCupisPaymentsEnabled'
"
Write-Host -ForegroundColor Green "[INFO] Enable Payments"
Invoke-Sqlcmd -verbose -ServerInstance $env:COMPUTERNAME -Database 'UniRu' -query $EnablePayments -ErrorAction continue


Start-WebAppPool "UniRu"