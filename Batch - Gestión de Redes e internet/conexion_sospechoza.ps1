# Script: Verifica conexiones TCP activas y firma digital de los procesos
# Exporta resultados a C:\conexiones.csv

Get-NetTCPConnection -State Established | ForEach-Object {
    $processId = $_.OwningProcess
    $remote = $_.RemoteAddress
    $remotePort = $_.RemotePort
    $proc = Get-Process -Id $processId -ErrorAction SilentlyContinue

    if ($proc -and $proc.Path) {
        $sig = Get-AuthenticodeSignature -FilePath $proc.Path
        $obj = [PSCustomObject]@{
            RemoteIP      = $remote
            RemotePort    = $remotePort
            ProcessId     = $processId
            ProcessName   = $proc.ProcessName
            FilePath      = $proc.Path
            FirmaDigital  = $sig.Status
            FirmadoPor    = if ($sig.SignerCertificate) {
                                $sig.SignerCertificate.Subject
                            } else {
                                "Sin certificado"
                            }
        }
        # Mostrar en consola
        $obj

        # Exportar a CSV
        $obj | Export-Csv -Path "C:\conexiones.csv" -Append -NoTypeInformation
    }
} | Format-Table -AutoSize