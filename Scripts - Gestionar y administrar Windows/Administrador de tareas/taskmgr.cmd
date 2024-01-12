@echo off

echo set WshShell = WScript.CreateObject("WScript.Shell") >%temp%\tskm.vbs
echo WshShell.SendKeys "^+{ESC}" >>%temp%\tskm.vbs
start %temp%\tskm.vbs