
'---------------------------------------------------------
'ElendilSoluciones
'https://elendill.wordpress.com/
'---------------------------------------------------------

'--------------------------------------
'Este guion configura tu dirección IP para que sea dinámica y, en caso de que ya lo sea, te muestra un mensaje con la 'información de tu servidor DHCP actual.
'--------------------------------------
Option Explicit 
 
Const conExitCodeNone = 0 
Const conExitCodeError = 2 
 
'> Function name:       EnableDHCP 
'> Purpose:             Enable DHCP obtained address on client 
Function EnableDHCP 
  Dim objWMIService, objNicConfig, colNicConfigs 
  Dim strComputer 
  Dim intReturn 
   
  strComputer = "." 
  Set objWMIService = GetObject("winmgmts:" _ 
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
  Set colNicConfigs = objWMIService.ExecQuery _ 
    ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True") 
 
  For Each objNicConfig In colNicConfigs 
    If Not objNicConfig.DHCPEnabled Then 
      intReturn = objNicConfig.EnableDHCP 
      If intReturn = 0 Then 
        WScript.Echo VbCrLf & "DHCP establecido, ahora tienes una direccion IP dinamica." 
      Else 
        WScript.Echo VbCrLf & "Imposible establecer DHCP." 
        WScript.Quit conExitCodeError 
      End If 
    Else 
      WScript.Echo "Tu direccion IP es dinamica" & VbCrLf & "El servidor DHCP es: " & objNicConfig.DHCPServer 
    End If 
  Next 
End Function 
 
'> Function name:       ObtainDNSAutomatically 
'> Purpose:             Set DNS servers on auto config thru registry 
Function ObtainDNSAutomatically() 
  'Default error trapping mechanism 
  On Error Resume Next 
  ' Script specific constants 
  Const conKeyPath = "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\" 
  Dim objWMIService, objNicConfig, colNicConfigs, objShell 
  Dim strComputer, strSuccess 
  Dim strAdapterIdentifier 
  Dim strKeyPath 
  Dim intReturn 
  strComputer = "." 
  Set objWMIService = GetObject("winmgmts:" _ 
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
  Set colNicConfigs = objWMIService.ExecQuery _ 
    ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True") 
  For Each objNicConfig In colNicConfigs 
    strAdapterIdentifier = objNicConfig.SettingID 
    strKeyPath = conKeyPath & strAdapterIdentifier & "\NameServer" 
    Set objShell = WScript.CreateObject("WScript.Shell") 
    objShell.RegWrite strKeyPath, "", "REG_SZ" 
  Next 
End Function 
 
'***************************** 
' Beginning of the script.
'***************************** 
' Call main procedures 
EnableDHCP 
ObtainDNSAutomatically 
msgBox "Otros scripts en https://elendill.wordpress.com/ "
Wscript.Quit