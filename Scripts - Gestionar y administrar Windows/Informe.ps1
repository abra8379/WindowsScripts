# =============================================
# INFORME TÉCNICO COMPLETO DEL SISTEMA - POWERSHELL
# =============================================

$fecha = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ruta = "$env:USERPROFILE\Desktop\Informe_Tecnico_$fecha.txt"

# Función para formatear títulos
function Escribir-Titulo($titulo) {
    "`n=== $titulo.ToUpper() ===`n" | Out-File -FilePath $ruta -Append
}

# =============================================
# CPU
Escribir-Titulo "CPU"
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed | Format-List | Out-File -Append $ruta

# =============================================
# RAM
Escribir-Titulo "MEMORIA RAM"
Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, @{Name='Capacity(GB)';Expression={[math]::round($_.Capacity / 1GB, 2)}}, Speed | Out-File -Append $ruta

# =============================================
# SSD / Disco Duro
Escribir-Titulo "DISCO DURO / SSD"
Get-PhysicalDisk | Select-Object FriendlyName, MediaType, @{Name='Size(GB)';Expression={[math]::round($_.Size / 1GB, 2)}} | Out-File -Append $ruta

# =============================================
# Placa Base
Escribir-Titulo "PLACA BASE"
Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product | Out-File -Append $ruta

# =============================================
# Sistema Operativo
Escribir-Titulo "SISTEMA OPERATIVO"
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, OSArchitecture, Version, BuildNumber | Out-File -Append $ruta

# =============================================
# GPU
Escribir-Titulo "GPU"
Get-CimInstance Win32_VideoController | Select-Object Name, @{Name='AdapterRAM(GB)';Expression={[math]::round($_.AdapterRAM / 1GB, 2)}} | Out-File -Append $ruta

# =============================================
# RED
Escribir-Titulo "INFORMACIÓN DE RED"
Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -notlike "169.*"} |
Select-Object InterfaceAlias, IPAddress | Out-File -Append $ruta

# =============================================
# Nombre de equipo y usuario
Escribir-Titulo "NOMBRE DE EQUIPO Y USUARIO"
"Equipo: $env:COMPUTERNAME" | Out-File -Append $ruta
"Usuario: $env:USERNAME" | Out-File -Append $ruta

# =============================================
# Estado de batería (si aplica)
Escribir-Titulo "BATERÍA"
Get-CimInstance Win32_Battery | Select-Object Name, EstimatedChargeRemaining, BatteryStatus | Out-File -Append $ruta

# =============================================
# Temperaturas (requiere OpenHardwareMonitor)
$ohm = "$env:ProgramFiles\OpenHardwareMonitor\OpenHardwareMonitor.exe"
if (Test-Path $ohm) {
    Escribir-Titulo "TEMPERATURA (via OpenHardwareMonitor)"
    Start-Process -FilePath $ohm -ArgumentList "/report" -Wait
    $report = "$env:ProgramFiles\OpenHardwareMonitor\OpenHardwareMonitorReport.txt"
    if (Test-Path $report) {
        Get-Content $report | Select-String "Temperature" | Out-File -Append $ruta
    } else {
        "No se pudo generar el reporte de temperatura." | Out-File -Append $ruta
    }
} else {
    "OpenHardwareMonitor no está instalado en la ruta esperada." | Out-File -Append $ruta
}

# =============================================
# Uso actual de CPU y RAM
Escribir-Titulo "USO ACTUAL CPU Y RAM"
Get-CimInstance Win32_Processor | ForEach-Object {
    "CPU Load: $($_.LoadPercentage)%" | Out-File -Append $ruta
}
Get-CimInstance Win32_OperatingSystem | ForEach-Object {
    $total = $_.TotalVisibleMemorySize
    $free = $_.FreePhysicalMemory
    $used = ($total - $free) * 100 / $total
    "RAM en uso: {0:N2}%%" -f $used | Out-File -Append $ruta
}

# =============================================
# Programas instalados
Escribir-Titulo "PROGRAMAS INSTALADOS"
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
Where-Object { $_.DisplayName } |
Select-Object DisplayName, DisplayVersion | Sort-Object DisplayName | Out-File -Append $ruta

# =============================================
# Dispositivos USB conectados
Escribir-Titulo "DISPOSITIVOS USB CONECTADOS"
Get-PnpDevice -Class USB | Select-Object FriendlyName, Manufacturer, Status | Out-File -Append $ruta

# =============================================
Write-Host "Informe técnico generado correctamente en: $ruta" -ForegroundColor Green
