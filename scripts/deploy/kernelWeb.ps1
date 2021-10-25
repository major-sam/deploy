import-module '.\scripts\sideFunctions.psm1'
# vars
$buildNumber = "1.0.5521.1"
$sourceDir = "\\server\tcbuild$\ServerDeploy\$buildNumber\KernelWeb"
$netVersion = Get-ChildItem  -path $sourceDir -Recurse -Force |Select-Object -First 1
$targetDir = 'C:\KernelWeb'
$transformLibPath = ".\Microsoft.Web.XmlTransform.dll"
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$transformFiles = @("$targetDir\settings.OctopusTestVM.xml","$targetDir\App.OctopusTestVM.config")

$FILES= @(
      @{
        transf = "$targetDir\App.OctopusTestVM.config"
        target = "$targetDir\KernelWeb.exe.config"
      }
      @{
        transf = "$targetDir\settings.OctopusTestVM.xml"
        target = "$targetDir\settings.xml"
      }
)
### copy files

write-host "Copy-Item -Path "$sourceDir\$netVersion"  -Destination $targetDir -Recurse -Exclude "*.nupkg" -verbouse"
Copy-Item -Path "$sourceDir\$netVersion"  -Destination $targetDir -Recurse -Exclude "*.nupkg" 


### set vm related values for transformation files

##### raw replace
foreach($transformFile in $transformFiles){
    (Get-Content -Encoding UTF8 $transformFile) | Foreach-Object {
        $_ -replace '#{VM[#{VMName}].ServerIp}',  $CurrentIpAddr `
           -replace '#{KernelWeb_apconf_AddressSlotService}', 'localhost'`
           -replace '#{KernelWeb_apconf_CertSubjectName}', 'VM1APKTEST-P0.gkbaltbet.local' 
        } | Set-Content -Encoding UTF8 $transformFile
        Write-Host -ForegroundColor Green "$transformFile renewed"
    }


##### apply xml transformation
foreach($item in $FILES){
 try{
    XmlDocTransform -xml $item.target -xdt  $item.transf
    Write-Host -ForegroundColor Green " $item.target renewed with transformation $item.transf"}
 catch{
 
    Write-Host -ForegroundColor Red " $item.target FAIL renew with transformation $item.transf"}
}
