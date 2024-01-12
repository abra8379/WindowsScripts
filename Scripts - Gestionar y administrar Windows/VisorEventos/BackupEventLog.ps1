# Ruta completa del archivo de respaldo
$backupFilePath = "C:\EventLogBackup.csv"

# Nombres de los registros de eventos que deseas respaldar
$eventLogNames = @("Application", "Security", "Setup", "System", "ForwardedEvents")

# ID de eventos específicos que deseas filtrar
$eventIDsToFilter = @(6005, 6006, 4624, 4634, 4672, 4688, 4689, 4663, 560)

# Exportar eventos de múltiples registros y filtrar por ID
try {
    $allEvents = foreach ($logName in $eventLogNames) {
        Get-WinEvent -LogName $logName | Where-Object { $_.Id -in $eventIDsToFilter } | Select-Object *
    }

    $allEvents | ConvertTo-Csv -NoTypeInformation | Out-File -FilePath $backupFilePath -Force
    Write-Host "Respaldo de eventos de registros completado. El archivo se encuentra en: $backupFilePath"
}
catch {
    Write-Host "Error al realizar el respaldo de eventos de registros: $_"
}
