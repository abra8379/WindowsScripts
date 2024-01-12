ECHO Off 


:: Este archivo por lotes restablece la red
:: para la computadora local y luego reinicia
:: los Servicios de Red. También crea
:: un archivo con la nueva dirección IP.
echo Este comando va a reiniciar todos los servicios de red. Continuar? 
pause>nul
ipconfig.exe /release *
net.exe stop "dhcp client" 
net.exe stop "dns client" 
net.exe stop "network connections" 
net.exe start "dhcp client" 
net.exe start "dns client" 
net.exe start "network connections" 
ipconfig.exe /flushdns 
ipconfig.exe /renew *

IPConfig /all>C:\IP_Info.txt
Notepad.exe C:\IP_Info.txt

msg * Revisa el archivo exportado en IP_Info.txt en la raiz del disco C.
 
