# Configuración de DNS estáticos en la interfaz Wi-Fi

$adminGroup = "Administradores"
$adapterName = "Wi-Fi"
$primaryDNS = "8.8.8.8"
$secondaryDNS = "8.8.4.4"

# Verificar si el usuario actual tiene privilegios de administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "No tienes permisos para ejecutar este script."
    exit 1
}

# Configurar DNS primario
netsh interface ipv4 set dns name=$adapterName source=static addr=$primaryDNS
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al establecer el DNS primario."
    exit 1
}

# Configurar DNS secundario
netsh interface ipv4 add dns name=$adapterName addr=$secondaryDNS index=2
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al agregar el DNS secundario."
    exit 1
}

Write-Host "DNS configurado exitosamente."
