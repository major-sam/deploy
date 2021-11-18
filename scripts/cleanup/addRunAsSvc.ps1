$usernames = @("GKBALTBET\TestKernel_svc")

foreach($username in $usernames){
	$tempPath = [System.IO.Path]::GetTempPath()
	$import = Join-Path -Path $tempPath -ChildPath "import.inf"
	if(Test-Path $import) { Remove-Item -Path $import -Force }
	$export = Join-Path -Path $tempPath -ChildPath "export.inf"
	if(Test-Path $export) { Remove-Item -Path $export -Force }
	$secedt = Join-Path -Path $tempPath -ChildPath "secedt.sdb"
	if(Test-Path $secedt) { Remove-Item -Path $secedt -Force }
	try {
		$sid = ((New-Object System.Security.Principal.NTAccount($username)).Translate([System.Security.Principal.SecurityIdentifier])).Value
		secedit /export /cfg $export
		$sids = (Select-String $export -Pattern "SeServiceLogonRight").Line
		foreach ($line in @("[Unicode]", "Unicode=yes", "[System Access]", "[Event Audit]", "[Registry Values]", "[Version]", "signature=`"`$CHICAGO$`"", "Revision=1", "[Profile Description]", "Description=GrantLogOnAsAService security template", "[Privilege Rights]", "$sids,*$sid")){
		  Add-Content $import $line
		}
		secedit /import /db $secedt /cfg $import
		secedit /configure /db $secedt
		Remove-Item -Path $import -Force
		Remove-Item -Path $export -Force
		Remove-Item -Path $secedt -Force
	} catch {
		$error[0]
	}
}