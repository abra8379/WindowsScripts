Set objFirewall = CreateObject("HNetCfg.FwMgr")
Set objPolicy = objFirewall.LocalPolicy.CurrentProfile

Set colPorts = objPolicy.GloballyOpenPorts

Wscript.Echo "Te mostrará los puertos que tienes abiertos en el Firewall de Windows"

For Each objPort in colPorts
Wscript.Echo "Nombre del puerto: " & objPort.Name & vbCr & _
"Numero: " & objPort.Port & vbCr & _
"Protocolo: " & objPort.Protocol & vbCr & _
"Esta habilitado?: " & objPort.Enabled & vbCr & _
"" 
Next

WScript. Quit(0)