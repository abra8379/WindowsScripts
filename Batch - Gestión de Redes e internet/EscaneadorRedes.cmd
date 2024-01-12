@echo off
tittle ESCANEADOR DE REDES
color 0E
mode con cols=66 lines=25
:menu

echo Se haran una serie de pruebas para extraer todos
echo los datos  de tu configuracion de redes.
echo Asegurate de estar conectado. Continuar ?
pause
cls
echo Escaneador de todos los datos de tu configuración de redes. Este es el resultado de todas las pruebas realizadas para recopilar toda la información posible de tu configuracion de redes. %date%>00.txt
cls
echo.
echo                      ESCANEADOR DE REDES
echo º             INFORMACION DE LAS CONEXIONES TCP/IP            º 
echo º  El resultado se guardara en un documento llamado Test.doc  º 
echo º       El escaneo demora un poco mas de 1 minuto........     º

echo.                                                               
echo ejecutando ahora netsh interface ip show config...
netsh interface ip show config >01netsh.txt
echo ejecutando arp -a..
arp -a > 02arp.txt
echo ejecutando route -4..
route -4 print > 02route.txt
echo ejecutando netstat -a........
netstat -a > 03netstat-a.txt
echo ejecutando netstat -e..
netstat -e > 04netstat-e.txt
echo ejecutando netstat -r..
netstat -r -p TCP > 05netstat-rTCP.txt
echo ejecutando netstat -s..
netstat -s -p TCP > 06netstat-s-pTCP.txt
echo ejecutando nbtstat -c..
nbtstat -c   > 07nbtstat-c.txt
echo ejecutando nbtstat -n..
nbtstat -n > 08nbtstat-n.txt
echo ejecutando nbtstat -r..
nbtstat -r > 09nbtstat-r.txt
echo ejecutando nslookup.....
nslookup ls domain>10nslookup.txt....
echo ejecutando ipconfig -all..
ipconfig -all > 11ipconfig.txt
echo ejecutando systeminfo....
systeminfo > 12system.txt
echo Puedes encontrar muchos scripts utiles en: http://norfipc.com>13.txt
copy *.txt Test.doc
del *.txt
cls
start tree cmd
start netstat -r cmd
dir/s
msg * Hecho, lea el archivo Test.doc 
msg * mas scripts en http:norfipc.com 