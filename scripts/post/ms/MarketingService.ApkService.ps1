
Write-Host -ForegroundColor Green "[INFO] Creating BaltBet.MarketingService ..."
$passVar = ConvertTo-SecureString "$($ENV:ServiceUserPassword)" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ("$($ENV:ServiceUserName)", $passVar )
$serviceBin = Get-Item  "c:\Services\MarketingService.ApkService\BaltBet.Marketing.ApkService.exe"
$descr = $serviceBin.Directory.Name.Split(".")[-1]
$params = @{
  Name = $serviceBin.BaseName
  BinaryPathName = "$($serviceBin.fullName)  -displayname $($serviceBin.BaseName) -servicename $($serviceBin.BaseName)"
  DisplayName = $serviceBin.BaseName
  StartupType = "Automatic"
  Description = "This is a $descr service."
  Credential = $credentials
}

New-Service @params

start-Service $params.Name
