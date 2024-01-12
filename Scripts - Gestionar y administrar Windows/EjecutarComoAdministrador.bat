@echo off
setlocal enabledelayedexpansion

set "adminUser=NOMBRE_ADMINISTRADOR"
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "C:\Program Files (x86)\PROGRAMA\APLICACION.exe""

net user "%username%" | findstr /c:"%adminUser%" >nul
if %errorlevel% neq 1 (
    exit /b
)