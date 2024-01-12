@echo off
setlocal enabledelayedexpansion

set adminUser="support"
set adapterName="WI-FI"
set primaryDNS=8.8.8.8
set secondaryDNS=8.8.4.4

net user "%username%" | findstr /c:"%adminUser%" >nul
if %errorlevel% neq 0 (
    exit /b
)

netsh interface ipv4 set dns name=%adapterName% source=static addr=%primaryDNS%
netsh interface ipv4 add dns name=%adapterName% addr=%secondaryDNS% index=2

endlocal
