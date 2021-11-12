import-module '.\scripts\sideFunctions.psm1'

write-host 'config iis for TT' 

##Credential provided by jenkins
$username = "$($ENV:SERVICE_CREDS_USR)" 
$pass =  "$($ENV:SERVICE_CREDS_PSW)"
$RuntimeVersion ='v4.0'
$preloader = "SitePreload"
$IISPools = @( 
    @{
        SiteName = 'TradingTool.Api'
        DomainAuth =  @{
            userName="$username";password="$pass";identitytype=3
            }
        Bindings= @(
                @{protocol='http';bindingInformation="*:8880:"}
                @{protocol='https';;bindingInformation="*:9880:"}
            )
		CertPath = 'Cert:\LocalMachine\My\38be86bcf49337804643a671c4c56bc4224c6606'
		rootDir = ''
    }
)  



Import-Module -Force WebAdministration
foreach($site in $IISPools ){
	echo $site
	#RegisterIISSite($site)
}
