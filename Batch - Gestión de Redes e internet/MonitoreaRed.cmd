

:: Exhibe tu dirección IP, nombre del host y servidores DNS.
:: En el caso de estar en una red local, también muestra su dirección IP.
:: Exhibe la dirección IP externa.
.
@ECHO OFF
mode con cols=90 lines=9
ipconfig /all|FINDSTR /C:"Nombre de host"
ipconfig|FINDSTR  "Dirección IPv4"
ipconfig /all|FINDSTR /C:"Servidores DNS"
netsh interface ip show config|FINDSTR /C:"Puerta de enlace predeterminada"
netsh interface ip show config|FINDSTR /C:"Prefijo de subred"
wget -q -O - https://elendill.wordpress.com/

PAUSE>NUL