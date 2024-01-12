@echo off

del %SystemRoot%\Temp\*.* /q /f /S

del %TEMP%\*.* /q /f /S

del %TMP%\*.* /q /f /S

del %HOMEPATH%\CONFIG~1\Temp\*.* /q /f /S


@exit