@echo off
setlocal EnableDelayedExpansion

set "exiftool_path=C:\Users\nombre_usuario\carpeta\EXIFTOOL.EXE"
set "carpeta_imagenes=C:\Users\nombre_usuario\carpeta"

for %%i in ("%carpeta_imagenes%\*.jpg") do (
    echo Eliminando metadatos de: %%~nxi
    "%exiftool_path%" -all= "%%i"
)

echo Proceso completado.
pause
