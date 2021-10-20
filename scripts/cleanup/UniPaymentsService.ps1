# 4.2 Обновляем Uni.PaymentsService
$UniPaymentsService_folder = "C:\inetpub\Uni.PaymentsService"
# Очищаем содержимое Uni.PaymentsService
Write-Host -ForegroundColor Green "[INFO] Remove files in Uni.PaymentsService"
Remove-Item -Path $UniPaymentsService_folder\* -Recurse -Force
