

:: Exhibe tu direcci�n IP, nombre del host y servidores DNS.
:: En el caso de estar en una red local, tambi�n muestra su direcci�n IP.
:: Exhibe la direcci�n IP externa.
.
@ECHO OFF
mode con cols=90 lines=9
ipconfig /all|FINDSTR /C:"Nombre de host"
ipconfig|FINDSTR  "Direcci�n IPv4"
ipconfig /all|FINDSTR /C:"Servidores DNS"
netsh interface ip show config|FINDSTR /C:"Puerta de enlace predeterminada"
netsh interface ip show config|FINDSTR /C:"Prefijo de subred"
wget -q -O - https://elendill.wordpress.com/

PAUSE>NUL