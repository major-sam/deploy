import-module '.\scripts\sideFunctions.psm1'

write-host 'marketing Apk service deploy script'
#get release params

$targetDir  = 'C:\Services\Marketing\BaltBet.Marketing.ApkService'
$webConfig = "$targetDir\BaltBet.Marketing.ApkService.exe.config"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()

$conf = [Xml](Get-Content $webConfig)
$conf.configuration."system.serviceModel".services.service |% {$_.endpoint |% {$_.address = $_.address.replace("localhost",$CurrentIpAddr)}}

$conf.configuration.connectionStrings.add |Where-Object  name -eq "BaltBetM"| %{
	$_.connectionString = 'server=localhost;Integrated Security=SSPI;MultipleActiveResultSets=true;Initial Catalog=BaltBetM'}
$conf.Save($webConfig)
