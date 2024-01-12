@echo off
cls

echo Recopilando información...

:: Nombre del equipo
echo Nombre del equipo: %COMPUTERNAME%

:: Nombre del usuario local (en uso)
echo Nombre del usuario local (en uso): %USERNAME%

:: Dirección IP local del equipo
for /f "delims=" %%i in ('powershell -Command "(Get-NetIPAddress | Where-Object {$_.InterfaceAlias -eq 'Ethernet' -or $_.InterfaceAlias -eq 'Wi-Fi'} | Where-Object {$_.AddressFamily -eq 'IPv4'}).IPAddress"') do set IpAddress=%%i
echo Dirección IP local del equipo: %IpAddress%

:: Dirección MAC del equipo
for /f "delims=" %%i in ('powershell -Command "(Get-NetAdapter | Where-Object {$_.Status -eq 'Up'}).MacAddress"') do set MacAddress=%%i
echo Dirección MAC del equipo: %MacAddress%

:: DNS del equipo
for /f "tokens=2 delims=:" %%a in ('nslookup google.com ^| find "Server"') do set DnsServer=%%a
echo DNS del equipo: %DnsServer%

:: Sistema operativo instalado
for /f "tokens=*" %%a in ('systeminfo ^| find "Nombre del sistema"') do set OsName=%%a
echo Sistema operativo instalado: %OsName%

:: Cantidad de memoria RAM
for /f "tokens=*" %%a in ('systeminfo ^| find "Total de memoria física"') do set RamAmount=%%a
echo Cantidad de memoria RAM: %RamAmount%

:: CPU
for /f "tokens=*" %%a in ('systeminfo ^| find "Procesador"') do set CpuInfo=%%a
echo CPU: %CpuInfo%

:: Exportar a archivo de texto (Unidad C:)
echo Información exportada exitosamente a la unidad C:. > "C:\SystemInfo.txt"
echo. >> "C:\SystemInfo.txt"

:: Redirigir la información recopilada al archivo de texto
echo Nombre del equipo: %COMPUTERNAME% >> "C:\SystemInfo.txt"
echo Nombre del usuario local (en uso): %USERNAME% >> "C:\SystemInfo.txt"
echo Dirección IP local del equipo: %IpAddress% >> "C:\SystemInfo.txt"
echo Dirección MAC del equipo: %MacAddress% >> "C:\SystemInfo.txt"
echo DNS del equipo: %DnsServer% >> "C:\SystemInfo.txt"
echo Sistema operativo instalado: %OsName% >> "C:\SystemInfo.txt"
echo Cantidad de memoria RAM: %RamAmount% >> "C:\SystemInfo.txt"
echo CPU: %CpuInfo% >> "C:\SystemInfo.txt"

echo Información exportada exitosamente a la unidad C:.

pause
