import-module '.\scripts\sideFunctions.psm1'


$serviceblock = {
  Param($service)
   IF ($service.Status -eq 'Running'){
	 Write-Host "$($service.name) is started. Stopping"
     Stop-ServiceWithTimeout("$($service.name)")
   }
   sleep 5
   cmd /c  sc delete $service.Name
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
$initScript = [scriptblock]::Create("Import-Module -Name '.\scripts\sideFunctions.psm1'")
Get-Service -Displayname "*Baltbet*" |  % {Start-Job -InitializationScript $initScript -Scriptblock $serviceblock -ArgumentList $_ }
Get-Job | Wait-Job | Receive-Job
sleep 2 
$procs = @("KernelWeb", "Kernel")
#### grep all baltbet services
Get-Process "*baltbet*"| % {$procs +=$_.ProcessName}

$procs | % {Start-Job -InitializationScript $initScript -Scriptblock $procblock -ArgumentList $_ }
Get-Job | Wait-Job | Receive-Job
Get-Service -Displayname "*Baltbet*" | ForEach-object{ cmd /c  sc delete $_.Name}
#### cleanup Kernel
Remove-Item -Path C:\Kernel, C:\KernelWeb -Force -Recurse

#### cleanup services folders
sleep 10
Remove-Item -Path C:\Services\* -Force -Recurse

#### cleanup default logs
Remove-Item -Path C:\Logs\* -Force -Recurse
