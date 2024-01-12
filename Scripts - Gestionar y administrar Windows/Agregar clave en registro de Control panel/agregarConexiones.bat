echo off
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /t REG_DWORD /d 0 /f
echo
exit