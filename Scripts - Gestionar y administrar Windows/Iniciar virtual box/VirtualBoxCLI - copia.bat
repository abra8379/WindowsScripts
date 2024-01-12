@ECHO off
:menu
cls

@set opcion=1
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