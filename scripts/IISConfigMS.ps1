import-module '.\scripts\sideFunctions.psm1'

write-host 'config iis for ms' 

$username ="GKBALTBET\TestKernel_svc"
$pass = "GldycLIFKM2018"
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
    }
)  



Import-Module -Force WebAdministration
foreach($site in $IISPools ){
	RegisterIISSite($site)
}

###
# allowDoubleEscaping
###
C:\Windows\system32\inetsrv\AppCmd.exe set config  set config $IISPools[0].SiteName -section:system.webServer/security/requestfiltering -allowDoubleEscaping:true
###
# set idleTimeOut 
###
Set-ItemProperty ("IIS:\AppPools\$($IISPools[0].SiteName)) -Name processModel.idleTimeout -value ( [TimeSpan]::FromMinutes(0))
