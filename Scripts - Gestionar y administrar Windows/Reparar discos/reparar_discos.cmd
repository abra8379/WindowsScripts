:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.
@echo off
Title CHKDSK
color 0E
echo Se revisar  el disco duro que usted elija en busca de errores y se corregir n. 
echo Identifique primero en el explorador la letra que tiene la unidad a revisar
pause
:rdisk
cls
set /p disco=Escriba la letra de la unidad y presione ENTER. Use Mayusculas por favor.
cls
if %disco%== C goto C
if %disco%== D goto D
if %disco%== E goto E
if %disco%== F goto F
if %disco%== G goto G
if %disco%== H goto H
if %disco%== I goto I
if %disco%== J goto J
if %disco%== K goto K
if %disco%== 0 goto Salir
if %disco%== %disco% goto ERROR
pause>nul
goto rdisk
:C
cls
@echo off
START /B CHKDSK C: /F /X /V
goto rdisk

:D
cls
@echo off
START /B CHKDSK D: /F /X /V
goto rdisk

:E
cls
@echo off
START /B CHKDSK E: /F /X /V
goto rdisk

:F
cls
@echo off
START /B CHKDSK F: /F /X /V
goto rdisk

:G
cls
@echo off
START /B CHKDSK G: /F /X /V
goto rdisk

:H
cls
@echo off
START /B CHKDSK H: /F /X /V
goto rdisk

:I
cls
@echo off
START /B CHKDSK I: /F /X /V
goto rdisk

:J
cls
@echo off
START /B CHKDSK J: /F /X /V
goto rdisk

:K
cls
@echo off
START /B CHKDSK K: /F /X /V
goto rdisk

:Salir
cls
exit

:ERROR
cls
MSG %USERNAME% La opcion que eligio no existe pruebe con otra. Gracias
GOTO rdisk
