import-module '.\scripts\sideFunctions.psm1'

##Credential provided by jenkins
$username = "$($ENV:SERVICE_CREDS_USR)" 
$pass =  "$($ENV:SERVICE_CREDS_PSW)"
$preloader = "SitePreload"
$wildcardDomain = "bb-webapps.com"
$IISPools = @( 
    @{
        SiteName = 'baltbetcom'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:84:"}
                @{protocol='https';bindingInformation="*:4444:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub\WebsiteCom'
		siteSubDir = $false
    }
    @{
        SiteName = 'KRM'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8080:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub'
		siteSubDir = $true
    }
    @{
        SiteName = 'UniRu'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:4443:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub\ClientWorkPlace'
		siteSubDir = $true
    }
    @{
        SiteName = 'UniruWebApi'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:4449:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub\ClientWorkPlace'
		siteSubDir = $true
    }
    @{
        SiteName = 'AdminMessageService'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:44307:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'C:\Services\PersonalInfoCenter'
		siteSubDir = $true
    }
    @{
        SiteName = 'WebApiAuth'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:449:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub'
		siteSubDir = $true
    }
    @{
        SiteName = 'BaltBet.CupisIntegrationService.Host'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:4453:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\services\CupisIntegrationService'
		siteSubDir = $true
    }
    @{
        SiteName = 'BaltBetDomainService'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='https';bindingInformation="*:8004:$($env:COMPUTERNAME).$($wildcardDomain)"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = 'c:\inetpub'
		siteSubDir = $true
    }
)  



foreach($site in $IISPools ){
   RegisterIISSite($site)
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
