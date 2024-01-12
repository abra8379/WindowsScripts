# Obtener información del sistema
function Get-SystemInfo {
    $systemInfo = @()

    # Nombre del equipo
    $systemInfo += "Nombre del equipo: $($env:COMPUTERNAME)"

    # Nombre del usuario local (en uso)
    $systemInfo += "Nombre del usuario local (en uso): $($env:USERNAME)"

    # Dirección IP local del equipo (Interfaz activa)
    $ipAddress = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -ne 'Loopback Pseudo-Interface 1' -and $_.IPAddress -ne '127.0.0.1' -and $_.PrefixOrigin -eq 'Dhcp' -and $_.SuffixOrigin -eq 'Dhcp'}).IPAddress
    $systemInfo += "Dirección IP local del equipo: $ipAddress"

    # Nombre del dispositivo o adaptador de red activo
    $networkAdapter = (Get-NetAdapter | Where-Object { $_.Status -eq 'Up' })
    $systemInfo += "Nombre del dispositivo o adaptador de red activo: $($networkAdapter.Name)"

    # Dirección MAC del equipo (Interfaz activa)
    $macAddress = $networkAdapter.MacAddress
    $systemInfo += "Dirección MAC del equipo: $macAddress"

    # DNS del equipo
    $dns = (Resolve-DnsName google.com | Where-Object { $_.QueryType -eq 'A' }).QueryResults.QueryData
    $systemInfo += "DNS del equipo: $dns"

    # Sistema operativo instalado
    $systemInfo += "Sistema operativo instalado: $(Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption)"

    # Cantidad de memoria RAM
    $systemInfo += "Cantidad de memoria RAM: $(Get-CimInstance Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory)"

    # CPU
    $systemInfo += "CPU: $(Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name)"

    return $systemInfo
}

# Mostrar información del sistema
$systemInfo = Get-SystemInfo
$systemInfo | ForEach-Object { Write-Host $_ }

# Exportar a archivo de texto (Documentos del usuario local)
$systemInfo | Out-File -FilePath "$env:USERPROFILE\Documents\SystemInfo.txt"

Write-Host "Información exportada exitosamente."
