@echo off
cls
echo El nuevo nombre del equipo sera...
echo %1
echo Si no es correcto pulsa Ctrl+C para interrumpir la ejecución del programa
pause
reg add HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %1 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %1 /f
reg add HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /v "NV Hostname" /t REG_SZ /d %1 /f
reg add HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /v Hostname /t REG_SZ /d %1 /f
rem shutdown -r -t 30 -f -c "Se ha cambiado el nombre del equipo, el sistema se reiniciara en 30 seg"
rem pára aplicar el script ejecutarlo desde el interprete CMD, por ejemplo si el script se llama regcambia, al colocar su rem nombre en el CMD dejamos un espacio y colocamos el nombre nuevo del equipo, ejemplo:
rem invocamos al script tipeando su nombre regcambi PEDRO, presionamos "ENTER", donde PEDRO será el nuevo nombre del equipo









