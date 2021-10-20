# Перезапуск служб

$bb_services = (
    "W3SVC",
    "ActivityService",
    "BaltBet.ActionLogService",
    "MessageService",
    "BaltBet.Payment.Cupis.GrpcHost"
)

foreach ($bb_service in $bb_services) {
    Write-Host -ForegroundColor Green "[INFO] Restart $bb_service"
    Restart-Service $bb_service
}

$dt = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Write-Host -ForegroundColor Green "$dt [INFO] Deploy completed!"

