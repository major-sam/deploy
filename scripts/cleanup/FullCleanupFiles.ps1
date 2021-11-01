$serviceblock = {
  Param($service)
   IF ($service.Status -eq 'Running'){
	 Write-Host "$($service.name) is started. Stopping"
     Stop-Service $service.name
   }
}

$procblock  = {
  Param($proc)
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
}

Get-Service -Displayname "*Baltbet*" |  % {Start-Job -Scriptblock $serviceblock -ArgumentList $_ }
Get-Job | Wait-Job | Receive-Job
sleep 5 
$procs = @("KernelWeb", "Kernel")
#### grep all baltbet services
Get-Process "*baltbet*"| % {$procs +=$_.ProcessName}

$procs | % {Start-Job -Scriptblock $procblock -ArgumentList $_ }
Get-Job | Wait-Job | Receive-Job

#### cleanup Kernel
Get-Service -Displayname "*Baltbet*" | ForEach-object{ cmd /c  sc delete $_.Name}
Remove-Item -Path C:\Kernel, C:\KernelWeb -Force -Recurse

#### cleanup services folders
sleep 10
Remove-Item -Path C:\Services\* -Force -Recurse

#### cleanup default logs
Remove-Item -Path C:\Logs\* -Force -Recurse
