invoke-sqlcmd -UserName $env.TT_SERVICE_CREDS_USR -Password $env.TT_SERVICE_CREDS_PWD -file ".\scripts\post\tt\KernelLiveEvents.sql"
