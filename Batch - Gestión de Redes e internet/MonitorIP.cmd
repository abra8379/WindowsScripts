

:: Muestra tu direccion IP, nombre de host y servidores DNS.
:: Si estas en una red local te muestra su IP tambien.

@ECHO OFF
mode con cols=70 lines=9
ipconfig /all|FINDSTR /C:"Nombre de host"
ipconfig|FINDSTR  "Direcci�n IPv4"
ipconfig|FINDSTR /C:"M�scara de subred"
ipconfig /all|FINDSTR /C:"Servidores DNS"
netstat -r|FINDSTR /C:"Direcci�n de puerta de enlace"

PAUSE>NUL