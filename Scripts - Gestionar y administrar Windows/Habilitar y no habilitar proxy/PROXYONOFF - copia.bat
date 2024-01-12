@echo off
title Proxy on off
echo.
echo Ingrese la contrasena
set/p code=
cls
if %code%==Soporte goto secreto
goto :error

:secreto
REM Creamos un menu
echo Seleccione una opcion:
echo.
echo 1: Activar Proxy.
echo.
echo 2: Quitar Proxy.
echo.
echo 3: Activar Conexiones
echo.
echo 4: Desactivar Conexiones 
REM de acuerdo a nuestra eleccion se realiza la accion solicitada.
@set /p opcion=
echo.
REM opcion 1 comando para activar el proxy por registro
if %opcion%==1 (
cls
@echo Estado
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
REM remplazamos las X por la direccion IP de servidor proxy y las P por el puerto a utilizar en el proxy
REM NO OLVIDAR LOS DOS PUNTOS
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "192.168.1.1:3128" /f
REM si se tiene algunas IPs para exepcion cambiar las x1 y las x2 por la ip 1 e ip 2, se pueden adicional las ip que se deseen separadas por punto y coma
REM si no se van a añadir exepciones y solo  eliminar todo menos <local>
REM si no se requiere "no usar proxy para direcciones locales"  eliminar toda la linea siguiente
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 
REM  "x1.x1.x1.x1;x2.x2.x2.x2;<local>" /f
REM @echo Proxy activado y configurado
REM pause
REM iniciamos internet explorer para poder confirmar la configuracion en todo el sistema (otros browser)
REM "%programfiles%\Internet Explorer\iexplore.exe"
goto salida)
REM la opcion 2 deshabilita el proxy.
if %opcion%==2 (@echo Estado
cls
@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo.
REM @echo Proxy desactivado
REM pause
REM iniciamos internet explorer para poder confirmar la configuracion en todo el sistema (otros browser)
REM "%programfiles%\Internet Explorer\iexplore.exe"
goto salida)
if %opcion%==3 (@echo Estado
cls
@echo off
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /t REG_DWORD /d 0 /f
@echo Conexiones Activado
echo.
goto salida)
if %opcion%==4 (@echo Estado
cls
@echo off
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /t REG_DWORD /d 1 /f
@echo Conexiones Activado
echo.
goto salida)
:error
echo Clave Invalida
pause
:salida
