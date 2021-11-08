function Format-Json {
    <#
    .SYNOPSIS
        Prettifies JSON output.
    .DESCRIPTION
        Reformats a JSON string so the output looks better than what ConvertTo-Json outputs.
    .PARAMETER Json
        Required: [string] The JSON text to prettify.
    .PARAMETER Minify
        Optional: Returns the json string compressed.
    .PARAMETER Indentation
        Optional: The number of spaces (1..1024) to use for indentation. Defaults to 4.
    .PARAMETER AsArray
        Optional: If set, the output will be in the form of a string array, otherwise a single string is output.
    .EXAMPLE
        $json | ConvertTo-Json  | Format-Json -Indentation 2
    #>
    [CmdletBinding(DefaultParameterSetName = 'Prettify')]
    Param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string]$Json,

        [Parameter(ParameterSetName = 'Minify')]
        [switch]$Minify,

        [Parameter(ParameterSetName = 'Prettify')]
        [ValidateRange(1, 1024)]
        [int]$Indentation = 4,

        [Parameter(ParameterSetName = 'Prettify')]
        [switch]$AsArray
    )

    if ($PSCmdlet.ParameterSetName -eq 'Minify') {
        return ($Json | ConvertFrom-Json) | ConvertTo-Json -Depth 100 -Compress
    }

    # If the input JSON text has been created with ConvertTo-Json -Compress
    # then we first need to reconvert it without compression
    if ($Json -notmatch '\r?\n') {
        $Json = ($Json | ConvertFrom-Json) | ConvertTo-Json -Depth 100
    }

    $indent = 0
    $regexUnlessQuoted = '(?=([^"]*"[^"]*")*[^"]*$)'

    $result = $Json -split '\r?\n' |
        ForEach-Object {
            # If the line contains a ] or } character, 
            # we need to decrement the indentation level unless it is inside quotes.
            if ($_ -match "[}\]]$regexUnlessQuoted") {
                $indent = [Math]::Max($indent - $Indentation, 0)
            }

            # Replace all colon-space combinations by ": " unless it is inside quotes.
            $line = (' ' * $indent) + ($_.TrimStart() -replace ":\s+$regexUnlessQuoted", ': ')

            # If the line contains a [ or { character, 
            # we need to increment the indentation level unless it is inside quotes.
            if ($_ -match "[\{\[]$regexUnlessQuoted") {
                $indent += $Indentation
            }

            $line
        }

    if ($AsArray) { return $result }
    return $result -Join [Environment]::NewLine
}

function XmlDocTransform($xml, $xdt){
    
    if (!$xml -or !(Test-Path -path $xml -PathType Leaf)) {
        throw "File not found. $xml";
    }
    if (!$xdt -or !(Test-Path -path $xdt -PathType Leaf)) {
        throw "File not found. $xdt";
    }

    #$scriptPath = (Get-Variable MyInvocation -Scope 1).Value.InvocationName | split-path -parent
    Add-Type -LiteralPath $transformLibPath

    $xmldoc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument;
    $xmldoc.PreserveWhitespace = $true
    $xmldoc.Load($xml);

    $transf = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt);
    if ($transf.Apply($xmldoc) -eq $false)
    {
        throw "Transformation failed."
    }
    $xmldoc.Save($xml);
}

function RestoreSqlDb($db_params) {	
	#load assemblies
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
	#Need SmoExtended for backup
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
	[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | out-null
	$MSSQLDataPath =  (Invoke-Sqlcmd -query "select SERVERPROPERTY('InstanceDefaultDataPath') as 'd'").d
	write-host "mssql data:" $MSSQLDataPath
	foreach ($db in $db_params){
		$RelocateFile = @() 
        $dbname = $db.DbName
		if ($db.ContainsKey('RelocateFiles')){
			foreach ($dbFile in $db.RelocateFiles) {
				$RelocateFile += New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($dbFile.SourceName, ("{0}\{1}" -f $MSSQLDataPath, $dbFile.FileName))
			}
            write-host -ForegroundColor DarkGreen $db.BackupFile
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile $db.BackupFile -RelocateFile $RelocateFile -ReplaceDatabase
			Push-Location C:\Windows
		}else{
			Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $db.DbName -BackupFile $db.BackupFile -ReplaceDatabase
			Push-Location C:\Windows			
		}
	}
}

function GetSourceObject($itm) {    
	$json = Get-Content -Raw -path $itm.sourceFile | ConvertFrom-Json
	$obj = $json |?{ $_.name -eq $itm.sourceName}
	return $obj
}

function CreateSqlDatabase($dbname){
	[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
	$server = new-object ("Microsoft.SqlServer.Management.Smo.Server") .

    $dbExists = $FALSE
	foreach ($db in $server.databases) {
		if ($db.name -eq "Db") {
		  Write-Host "Db already exists."
		  $dbExists = $TRUE
		}
	}
	if ($dbExists -eq $FALSE) {
	  $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $server, $dbname
	  $db.Create()
	}
}

function RegisterIISSite($site){
    Import-Module -Force WebAdministration
    $name =  $site.SiteName
    $targetDir = "c:\inetpub\$name"
    if (Test-Path IIS:\AppPools\$name){
        Write-Host "SITE EXIST!!!"
    }
    else{
        New-Item -Path IIS:\AppPools\$name -force
        Set-ItemProperty -Path IIS:\AppPools\$name -Name managedRuntimeVersion -Value 'v4.0'
        Set-ItemProperty -Path IIS:\AppPools\$name -Name startMode -Value 'AlwaysRunning'
        if ($site.DomainAuth){
           Set-ItemProperty  IIS:\AppPools\$name -name processModel -value $site.DomainAuth
        }
        Start-WebAppPool -Name $name
        New-Website -Name "$name" -ApplicationPool "$name" -PhysicalPath $targetDir -Force
        $IISSite = "IIS:\Sites\$name"
        Set-ItemProperty $IISSite -name  Bindings -value $site.Bindings
        $bind = Get-WebBinding -Name $name -Protocol https
        if($bind){
			$webServerCert = get-item $site.CertPath
			$bind.AddSslCertificate($webServerCert.GetCertHashString(), "my")		
        }
        Start-WebSite -Name "$name"
    }
}

function RegisterWinService($serviceBin){
	##Credential provided by jenkins: "$($ENV:ServiceUserName)" "$($ENV:ServiceUserPassword)"
	$passVar = ConvertTo-SecureString "$($ENV:ServiceUserPassword)" -AsPlainText -Force
	$credentials = New-Object System.Management.Automation.PSCredential ("$($ENV:ServiceUserName)", $passVar )
	if ($($serviceBin.BaseName).StartsWith("Baltbet.")){
		$sname = "$($serviceBin.BaseName)"
	}
	else{
		$sname = "Baltbet.$($serviceBin.BaseName)"
	}
	$params = @{
	  Name = $sname
	  BinaryPathName = "$($serviceBin.fullName) -displayname `"$sname`" -servicename `"$sname`""
	  DisplayName = $sname
	  StartupType = "Automatic"
	  Description = "This is a $sname service."
	  Credential = $credentials
	}
	New-Service @params
	return $sname
}

function Stop-ServiceWithTimeout ($name) {
    $timespan = New-Object -TypeName System.Timespan -ArgumentList 0,0,10
    $svc = Get-Service -Name $name
    if ($svc -eq $null) { return $false }
    if ($svc.Status -eq [ServiceProcess.ServiceControllerStatus]::Stopped) { return $true }
    $svc.Stop()
    try {
        $svc.WaitForStatus([ServiceProcess.ServiceControllerStatus]::Stopped, $timespan)
    }
    catch [ServiceProcess.TimeoutException] {
        Write-Verbose "Timeout stopping service $($svc.Name)"
		Stop-Process -Name $name -Force
    }
}