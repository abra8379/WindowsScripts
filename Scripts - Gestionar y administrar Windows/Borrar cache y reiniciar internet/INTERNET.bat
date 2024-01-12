ECHO Off 
:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed. 

:: This batch file resets the network  
:: for the local computer, then restarts 
:: the Network Services.  It also creates  
:: a file with the new IP Address. 
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
exit