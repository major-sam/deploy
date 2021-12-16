<#
    BaltBet.ReportService
    Предоставляет отчётные данные для клиента АПК через WCF
    
    c:\Services\ReportService

    Дополнительно нужный правки в Web.config сайтов "UniRu","baltbetcom","baltbetru"
#>


$ServiceName = "ReportService"
$ServiceFolderPath = "C:\Services\${ServiceName}"

# Редактирование конфигов
Write-Host -ForegroundColor Green "[INFO] Edit BaltBet.ReportService configuration files..."
(Get-Content -Encoding UTF8 -Path "${ServiceFolderPath}\ReportService.exe.config") -replace "wcf.kernel.host","test.wcf.host" | Set-Content -Encoding UTF8 -Path "${ServiceFolderPath}\ReportService.exe.config" 
