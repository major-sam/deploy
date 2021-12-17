$webdoc = [Xml](Get-Content $webConfig)
$webdoc.configuration.log4net.appender.file.value = "c:\logs\Payments\Payment-handlers\"
$webdoc.Save($webConfig)
