@echo off

del %SystemRoot%\Temp\*.* /q /f /S

del C:\Users\ELENDILL\AppData\Local\Temp\*.* /q /f /S

del %TEMP%\*.* /q /f /S

del %TMP%\*.* /q /f /S

del %HOMEPATH%\CONFIG~1\Temp\*.* /q /f /S

del %HOMEPATH%\CONFIG~1\ARCHIV~1\*.* /q /f /S

@exit