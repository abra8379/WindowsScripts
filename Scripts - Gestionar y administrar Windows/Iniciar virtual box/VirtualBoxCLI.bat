@ECHO off
:menu
cls
echo Seleccione una opcion:
echo.
echo 1: Iniciar maquina virtual.
echo.
echo 2: Reiniciar maquina virtual.
echo.
echo 3: Apagar maquina virtual
echo.
echo 4: Detener maquina virtual safe
echo.
echo 5: Crear maquina virtual
echo.
echo 6: Salir

@set /p opcion=
echo.

if %opcion%==1 (
@echo Estado
cls
@echo off
"C:\Program Files\Oracle\VirtualBox\vboxmanage" startvm "test" timeout 5
echo.
goto salida)


if %opcion%==2 (
@echo Estado
cls
@echo off
"C:\Program Files\Oracle\VirtualBox\vboxmanage" controlvm "test" resume
echo.
goto salida)


if %opcion%==3 (
@echo Estado
cls
@echo off
"C:\Program Files\Oracle\VirtualBox\vboxmanage" controlvm "test" poweroff
echo.
goto salida)


if %opcion%==4 (
@echo Estado
cls
@echo off
"C:\Program Files\Oracle\VirtualBox\vboxmanage" controlvm "test" savestate
echo.
goto salida)


if %opcion%==5 (
@echo Estado
cls
@echo off
"C:\Program Files\Oracle\VirtualBox\vboxmanage" controlvm -name "test" -register
echo.
goto salida)

if %opcion%==6 (
@echo Estado
cls
@echo off
echo.
goto salida)

echo.
goto salida)
:salida

exit