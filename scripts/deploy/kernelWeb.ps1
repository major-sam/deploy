import-module '.\scripts\sideFunctions.psm1'

#get release params
$sourceparams = @{
	sourceFile = '.\Release.json'
	sourceName = 'kernelWeb'
}
$source = GetSourceObject $sourceparams

# vars
$netVersion = Get-ChildItem  -path $source.sourceBuildSource -Recurse -Force |Select-Object -First 1
$targetDir = 'C:\KernelWeb'
$transformLibPath = ".\scripts\Microsoft.Web.XmlTransform.dll"
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

robocopy "$($source.sourceBuildSource)\$netVersion\" $targetDir /e
$global:LASTEXITCODE

if ($global:LASTEXITCODE -ne 0){
	$global:LASTEXITCODE = 0
}

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
