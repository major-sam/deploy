##Credential provided by jenkins
$passVar = ConvertTo-SecureString "$($ENV:ServiceUserPassword)" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ("$ENV:ServiceUserName", $passVar )
$serviceBin = Get-Item  "C:\Kernel\Kernel.exe"
$descr = $serviceBin.Directory.Name.Split(".")[-1]
$params = @{
  Name = "Baltbet.$($serviceBin.Directory.Name)"
  BinaryPathName =  "`"$($serviceBin.fullName)`"  -displayname `"Baltbet.$($serviceBin.Directory.Name)`" -servicename `"Baltbet.$($serviceBin.Directory.Name)`""
  DisplayName = "Baltbet.$($serviceBin.Directory.Name)"
  StartupType = "Automatic"
  Description = "This is a $descr service."
  Credential = $credentials
}

New-Service @params
start-Service $params.Name