@ECHO OFF
color 0E
mode con cols=70 lines=8

:START
SET CONNECT=NO
PING 1.1.1.1 -n 1 -w 1000 > NUL
IF %ERRORLEVEL% EQU 0 SET CONNECT=YES

IF %CONNECT% EQU YES (
    ECHO Estás conectado a internet
    ECHO Tu dirección IP es: 
    ipconfig | FINDSTR "Dirección IPv4"
) ELSE (
    ECHO No tienes conexión a internet en este momento
)

PING 1.1.1.1 -n 1 -w 30000 > NUL
CLS
GOTO START
