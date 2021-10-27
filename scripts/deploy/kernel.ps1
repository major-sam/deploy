import-module '.\scripts\sideFunctions.psm1'

#vars
$targetDir = 'C:\Kernel'
$buildNumber = "1.0.5521.1"
$sourceDir = "\\server\tcbuild$\ServerDeploy\$buildNumber\Kernel"
$netVersion = Get-ChildItem  -path $sourceDir -Recurse -Force |Select-Object -First 1
$CurrentIpAddr =(Get-NetIPAddress -AddressFamily ipv4 |  Where-Object -FilterScript { $_.interfaceindex -ne 1}).IPAddress.trim()
$pathtojson = "$targetDir\appsettings.json "
$transformLibPath = ".\Microsoft.Web.XmlTransform.dll"
$jsonDepth = 4



$FILES= @(
      @{
        transf = "$targetDir\App.OctopusTestVM.config"
        target = "$targetDir\Kernel.exe.config"
      }
      @{
        transf = "$targetDir\settings.OctopusTestVM.xml"
        target = "$targetDir\settings.xml"
      }
      @{
        transf = "$targetDir\Config\UnityConfig.OctopusTestVM.config"
        target = "$targetDir\Config\UnityConfig.config"
      }
      @{
        transf = "$targetDir\Config\Log.OctopusTestVM.config"
        target = "$targetDir\Config\Log.config"
      } 
)
### copy files
write-host "Copy-Item -Path $sourceDir\$netVersion  -Destination $targetDir -Recurse -Exclude *.nupkg "
Copy-Item -Path  "$sourceDir\$netVersion"  -Destination $targetDir -Recurse -Exclude "*.nupkg" 


### set vm related values for transformation files

##### raw replace

$transformFiles = @("$targetDir\settings.OctopusTestVM.xml")
foreach($transformFile in $transformFiles){
    (Get-Content -Encoding UTF8 $transformFile) | Foreach-Object {
        $_ -replace '#{VM[#{VMName}].ServerIp}',  $CurrentIpAddr 
        # multiple replace`
        #   -replace 'SQL', 'PowerShell' 
        } | Set-Content -Encoding UTF8 $transformFile
        Write-Host -ForegroundColor Green "$transformFile renewed"
    }
##### xpath replace
Write-Host -ForegroundColor Gray 'no files for xpath request'

##### edit json files

$json_appsetings = Get-Content -Raw -path $pathtojson | ConvertFrom-Json 
$HttpsInlineCertStore = '
    {     }
'| ConvertFrom-Json 
$json_appsetings.Kestrel.EndPoints.HttpsInlineCertStore =  $HttpsInlineCertStore
ConvertTo-Json $json_appsetings -Depth $jsonDepth  | Format-Json | Set-Content $pathtojson -Encoding UTF8
Write-Host -ForegroundColor Green "$pathtojson renewed with json depth $jsonDepth"


### apply xml transformation

foreach($item in $FILES){
 try{
    XmlDocTransform -xml $item.target -xdt  $item.transf
    Write-Host -ForegroundColor Green " $item.target renewed with transformation $item.transf"}
 catch{
 
    Write-Host -ForegroundColor Red " $item.target FAIL renew with transformation $item.transf"}
}

### edit settings.xml
$webConfig = "$targetDir\settings.xml"
Write-Host -ForegroundColor Green "[INFO] Edit web.config of $webConfig"
$webdoc = [Xml](Get-Content $webConfig)
$webdoc.Settings.EventCacheSettings.Enabled = "false"
$webdoc.Settings.CurrentEventsJob.Enabled = "false"
$webdoc.Save($webConfig)