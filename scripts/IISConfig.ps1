$username ="GKBALTBET\TestKernel_svc"
$pass = "GldycLIFKM2018"
$RuntimeVersion ='v4.0'
$preloader = "SitePreload"
$IISPools = @( 
    @{
        SiteName = 'baltbetcom'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:84:"}
                @{protocol='https';;bindingInformation="*:4444:"}
            )
    }
    @{
        SiteName = 'ClientWorkSpace'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8080:"}
            )
    }
    @{
        SiteName = 'UniRu'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:4443:"}
            )
    }
    @{
        SiteName = 'UniruWebApi'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:4449:"}
            )
    }
)  



Import-Module -Force WebAdministration
foreach($site in $IISPools ){
    $name =  $site.SiteName
    $targetDir = "c:\inetpub\$name"
    if (Test-Path IIS:\AppPools\$name){
        Write-Host "SITE EXIST!!!"
        }
    else{
        New-Item –Path IIS:\AppPools\$name -force
        Set-ItemProperty –Path IIS:\AppPools\$name -Name managedRuntimeVersion -Value 'v4.0'
        Set-ItemProperty –Path IIS:\AppPools\$name -Name startMode -Value 'AlwaysRunning'
        if ($site.DomainAuth){
           Set-ItemProperty IIS:\AppPools\$name -name processModel -value $site.DomainAuth
        }
        Start-WebAppPool -Name $name
        New-Website -Name "$name" -ApplicationPool "$name" -PhysicalPath $targetDir -Force
        $IISSite = "IIS:\Sites\$name"
        Set-ItemProperty $IISSite -name  Bindings -value $site.Bindings
        $webServerCert = get-item Cert:\LocalMachine\My\660a619045cf9a3117671c9a6804e17cbf9587fe
        $bind = Get-WebBinding -Name $name -Protocol https
            if($bind){
            	$bind.AddSslCertificate($webServerCert.GetCertHashString(), "my")		
            }
        Start-WebSite -Name "$name"
    }
}	

###
# ADD PRELOAD TO UNIRU
###
if ( (C:\Windows\system32\inetsrv\appcmd.exe  list config   -section:system.applicationHost/serviceAutoStartProviders /text:* | Select-String 'name:'| foreach { $_.line } | foreach { $_.ToString() }) -match ".*$preloader.*"){
	write-host(" preloader is allready set")
}else{	
	C:\Windows\system32\inetsrv\AppCmd.exe set config -section:system.applicationHost/serviceAutoStartProviders /+"[name='$preloader',type='Web.ClientWorkspace.SitePreloadClient, Web.ClientWorkspace']" /commit:apphost
}


$WebSiteName = "UniRu"
Set-WebConfigurationProperty -Filter "system.applicationHost/sites/site[@name='$WebSiteName']/applicationDefaults" -Name serviceAutoStartEnabled -Value True
Set-WebConfigurationProperty -Filter "system.applicationHost/sites/site[@name='$WebSiteName']/applicationDefaults" -Name serviceAutoStartProvider -Value $preloader
	
