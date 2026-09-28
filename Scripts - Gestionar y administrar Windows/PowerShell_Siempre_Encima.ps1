Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(
        IntPtr hWnd,
        IntPtr hWndInsertAfter,
        int X,
        int Y,
        int cx,
        int cy,
        uint uFlags
    );
}
"@

$HWND_TOPMOST = [IntPtr](-1)
$SWP_NOMOVE = 0x0002
$SWP_NOSIZE = 0x0001
$SWP_SHOWWINDOW = 0x0040

$hWnd = [IntPtr]::Zero

for ($i = 0; $i -lt 20; $i++) {
    $hWnd = (Get-Process -Id $PID).MainWindowHandle

    if ($hWnd -ne [IntPtr]::Zero) {
        break
    }

    Start-Sleep -Milliseconds 250
}

if ($hWnd -eq [IntPtr]::Zero) {
    Write-Host "ERROR: No se pudo obtener el identificador de la ventana de PowerShell."
    Write-Host "Presiona Enter para cerrar."
    Read-Host
    exit
}

$result = [Win32]::SetWindowPos(
    $hWnd,
    $HWND_TOPMOST,
    0,
    0,
    0,
    0,
    $SWP_NOMOVE -bor $SWP_NOSIZE -bor $SWP_SHOWWINDOW
)

if ($result) {
    Write-Host ""
    Write-Host "PowerShell configurado como SIEMPRE VISIBLE."
    Write-Host ""
}
else {
    Write-Host ""
    Write-Host "ERROR: Windows no pudo configurar la ventana como TOPMOST."
    Write-Host ""
}

Write-Host "La ventana permanecerá abierta."