@echo off
echo Abriendo PowerShell...
powershell -NoExit -Command "Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | Format-Table -AutoSize"
pause
