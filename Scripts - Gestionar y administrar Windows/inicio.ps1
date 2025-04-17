# ✅ CAMBIA SOLO ESTA LÍNEA
$appPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# 🔧 Nombre del acceso directo (puede ser el nombre de la app)
$shortcutName = "Chrome TikTok.lnk"

# 📂 Ruta del inicio automático del usuario actual
$startupPath = [Environment]::GetFolderPath("Startup")
$shortcutPath = Join-Path -Path $startupPath -ChildPath $shortcutName

# 📎 Crear el acceso directo
$wshShell = New-Object -ComObject WScript.Shell
$shortcut = $wshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $appPath
$shortcut.WorkingDirectory = Split-Path $appPath
$shortcut.Save()

Write-Host "✅ Acceso directo creado: $shortcutPath" -ForegroundColor Green
