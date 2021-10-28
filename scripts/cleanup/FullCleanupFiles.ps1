$scriptblock = {
  Param($service)
   IF ($service.Status -eq 'Running'){
	 Write-Host "$($service.name) is started. Stopping"
     Stop-Service $service.name
   }
}

Get-Service -Displayname "*Baltbet*" |  % {Start-Job -Scriptblock $scriptblock -ArgumentList $_ }
Get-Job | Wait-Job | Receive-Job


$procs = @("Kernel", "KernelWeb")
foreach($proc in $procs){
	$pr = Get-Process $proc -ErrorAction SilentlyContinue
	if ($pr) {
	  # try gracefully first
	  $pr.CloseMainWindow()
	  # kill after five seconds
	  Sleep 5
	  if (!$pr.HasExited) {
		$pr | Stop-Process -Force
	  }
	}
	Remove-Variable pr
}

sleep 10
#### cleanup Kernel
Get-Service -Displayname "*Baltbet*" | ForEach-object{ cmd /c  sc delete $_.Name}
Remove-Item -Path C:\Kernel, C:\KernelWeb -Force -Recurse

#### cleanup services folders
sleep 10
Remove-Item -Path C:\Services\* -Force -Recurse
