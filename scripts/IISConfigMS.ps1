import-module '.\scripts\sideFunctions.psm1'

write-host 'config iis for ms' 

##Credential provided by jenkins
$username ="$($ENV:ServiceUserName)" 
$pass =  "$($ENV:ServiceUserPassword)"
$RuntimeVersion ='v4.0'
$preloader = "SitePreload"
$IISPools = @( 
    @{
        SiteName = 'MarketingService'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8880:"}
                @{protocol='https';;bindingInformation="*:9880:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
    }
    @{
        SiteName = 'MarketingImages'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8883:"}
                @{protocol='https';bindingInformation="*:9883:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
    }
    @{
        SiteName = 'MarketingServiceAdmin'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8881:"}
                @{protocol='https';bindingInformation="*:9881:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
    }
    @{
        SiteName = 'MarketingServiceClient'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8882:"}
                @{protocol='https';bindingInformation="*:9882:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
    }
)  



Import-Module -Force WebAdministration
foreach($site in $IISPools ){
	RegisterIISSite($site)
}

###
# allowDoubleEscaping
###
C:\Windows\system32\inetsrv\AppCmd.exe set config $IISPools[0].SiteName -section:system.webServer/security/requestfiltering -allowDoubleEscaping:true
###
# set idleTimeOut 
###
Set-ItemProperty ("IIS:\AppPools\$($IISPools[0].SiteName)") -Name processModel.idleTimeout -value ( [TimeSpan]::FromMinutes(1))
