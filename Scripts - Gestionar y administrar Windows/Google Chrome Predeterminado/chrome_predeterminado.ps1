# Ruta del ejecutable SetUserFTA
$SetUserFTA = "C:\Chrome_predeterminado\SetUserFTA.exe"
# Validación de existencia
if (-not (Test-Path $SetUserFTA)) {
    Write-Host "❌ No se encontró SetUserFTA.exe en: $SetUserFTA" -ForegroundColor Red
    exit 1
}
# Definir extensiones y protocolos a configurar (sin .htm ni .html)
$asociaciones = @(
    "http=ChromeHTML",
    "https=ChromeHTML",
    ".shtml=ChromeHTML",
    ".pdf=ChromePDF",        # Opcional, para abrir PDFs en Chrome
    ".xht=ChromeHTML",
    ".xhtml=ChromeHTML",
    ".mht=ChromeHTML",
    ".mhtml=ChromeHTML"
)
# Aplicar asociaciones
foreach ($asoc in $asociaciones) {
    Write-Host "➡ Asociando: $asoc" -ForegroundColor Cyan
    & $SetUserFTA $asoc
    Start-Sleep -Milliseconds 300
}
Write-Host "`n✅ Asociaciones aplicadas. Chrome está ahora como navegador predeterminado para el usuario actual." -ForegroundColor Green
