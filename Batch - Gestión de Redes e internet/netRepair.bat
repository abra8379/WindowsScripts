ECHO Off 


:: Este archivo por lotes reinicia la configuración de red
:: para la computadora local y posteriormente reinicia
:: los Servicios de Red. También genera
:: un archivo con la nueva dirección IP.
REM echo Este comando va a reiniciar todos los servicios de red. Continuar? 
REM pause>nul
ipconfig.exe /release *
net.exe stop "dhcp client" 
net.exe stop "dns client" 
net.exe stop "network connections" 
net.exe start "dhcp client" 
net.exe start "dns client" 
net.exe start "network connections" 
ipconfig.exe /flushdns 
ipconfig.exe /renew *
echo
exit
