@echo off
cls
echo El nuevo nombre del equipo sera...
echo %1
echo Si no es correcto pulsa Ctrl+C para interrumpir la ejecución del programa
pause
reg add HKLMSYSTEMCurrentControlSetControlComputerNameActiveComputerName/v ComputerName /t REG_SZ /d %1 /f
reg add HKLMSYSTEMCurrentControlSetControlComputerNameComputerName/v ComputerName /t REG_SZ /d %1 /f
reg add HKLMSYSTEMCurrentControlSetservicesTcpipParameters /v "NV Hostname" /t REG_SZ /d %1 /f
reg add HKLMSYSTEMCurrentControlSetservicesTcpipParameters /v Hostname /t REG_SZ /d %1 /f
shutdown -r -t 30 -f -c "Se ha cambiado el nombre del equipo, el sistema se reiniciara en 30 seg

REM Para correr el script acceda por el cmd a la carpeta del mismo y ejecutar con el nuevo nombre del equipo asi: start nombrescript nuevo_nombre_equipo

