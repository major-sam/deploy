# 6. Правим конфиг Kernel

Write-Host -ForegroundColor Green "[INFO] Change C:\Kernel\settings.xml"
$ConfigPath = "C:\Kernel\settings.xml"
$old_path = 'D:\\EventCoefsCacheJob.dat'
$new_path = 'C:\Cache\EventCoefsCacheJob.dat'
((Get-Content -Encoding UTF8 -LiteralPath $ConfigPath) -replace $old_path,$new_path) | Set-Content -Encoding UTF8 -LiteralPath $ConfigPath
