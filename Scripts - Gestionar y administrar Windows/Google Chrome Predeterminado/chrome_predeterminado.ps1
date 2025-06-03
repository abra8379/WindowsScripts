# Ruta del ejecutable SetUserFTA
$SetUserFTA = "C:\Chrome_predeterminado\SetUserFTA.exe"

if (-not (Test-Path $SetUserFTA)) {
    Write-Host "❌ No se encontró SetUserFTA.exe en: $SetUserFTA" -ForegroundColor Red
    Write-Host "Presiona una tecla para salir..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit 1
}

$asociacionesPath = "C:\Chrome_predeterminado\asociaciones.txt"

if (-not (Test-Path $asociacionesPath)) {
    Write-Host "❌ No se encontró asociaciones.txt en: $asociacionesPath" -ForegroundColor Red
    Write-Host "Presiona una tecla para salir..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit 1
}

$asociaciones = Get-Content -Path $asociacionesPath

foreach ($asoc in $asociaciones) {
    # Separar por '='
    $partes = $asoc -split '='
    if ($partes.Length -ne 2) {
        Write-Host "❌ Línea inválida en asociaciones.txt: $asoc" -ForegroundColor Red
        continue
    }
    $ext = $partes[0].Trim()
    $progID = $partes[1].Trim()

    Write-Host "➡ Asociando: $ext => $progID" -ForegroundColor Cyan
    try {
        # Ejecutar SetUserFTA con dos parámetros separados
        & $SetUserFTA $ext $progID
        if ($LASTEXITCODE -ne 0) {
            Write-Host "⚠️ Error al aplicar asociación: $ext => $progID" -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "❌ Excepción al ejecutar SetUserFTA con: $ext => $progID" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
    Start-Sleep -Milliseconds 300
}

Write-Host "`n✅ Asociaciones aplicadas. Chrome está ahora como navegador predeterminado para el usuario actual." -ForegroundColor Green
Write-Host "Presiona una tecla para salir..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

