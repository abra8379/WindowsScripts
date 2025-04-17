
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Screen]::AllScreens | ForEach-Object { $_ }

# Forzar reinicio del adaptador de pantalla
Start-Process "rundll32.exe" -ArgumentList "display.dll,ShowAdapterSettings" -Verb RunAs | Out-Null

# Pausa para dar tiempo al sistema
Start-Sleep -Seconds 2

# Aumentar brillo al 100% (si aplica)
try {
    (Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBrightnessMethods).WmiSetBrightness(1, 100)
} catch {
    Write-Host "No se pudo ajustar el brillo, puede que no sea compatible."
}

# Simular tecla Win + P para seleccionar modo de proyección
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^{ESC}")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("^{ESC}")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("^{ESC}")
