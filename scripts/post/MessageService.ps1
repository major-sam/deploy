##Credential provided by jenkins: "$($ENV:ServiceUserName)" "$($ENV:ServiceUserPassword)"
$passVar = ConvertTo-SecureString "$($ENV:ServiceUserPassword)" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ("$($ENV:ServiceUserName)", $passVar )
$serviceBin = Get-Item  "c:\Services\MessageService\BaltBet.MessageService.Host.exe"
$descr = $serviceBin.Directory.Name.Split(".")[-1]
$params = @{
  Name = "Baltbet.$($serviceBin.Directory.Name)"
  BinaryPathName = $serviceBin.fullName
  DisplayName = "Baltbet.$($serviceBin.Directory.Name)"
  StartupType = "Automatic"
  Description = "This is a $descr service."
  Credential = $credentials
}

New-Service @params
start-Service $params.Name
