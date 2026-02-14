# CambiarPerfilEnergia.ps1
# Script para cambiar plan de energía según perfil ASUS TUF Gaming

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("Videos","Contenido","JuegoNormal","JuegoPesado")]
    [string]$Perfil
)

switch ($Perfil) {
    "Videos" {
        # Máxima eficiencia energética (para ver videos o uso ligero)
        powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
        Write-Host "Perfil 'Videos' activado: Máxima eficiencia energética"
    }
    "Contenido" {
        # Performance (para crear contenido sin juegos pesados)
        powercfg /setactive 27fa6203-3987-4dcc-918d-748559d549ec
        Write-Host "Perfil 'Contenido' activado: Performance"
    }
    "JuegoNormal" {
        # Turbo (para juegos normales)
        powercfg /setactive 6fecc5ae-f350-48a5-b669-b472cb895ccf
        Write-Host "Perfil 'JuegoNormal' activado: Turbo"
    }
    "JuegoPesado" {
        # Turbo para juegos exigentes
        powercfg /setactive 6fecc5ae-f350-48a5-b669-b472cb895ccf
        Write-Host "Perfil 'JuegoPesado' activado: Máximo rendimiento / Turbo"
    }
}
