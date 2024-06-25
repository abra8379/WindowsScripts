Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Función para ejecutar la acción seleccionada
function ExecuteAction {
    $selectedAction = $comboBox.SelectedItem
    switch ($selectedAction) {
        "Abrir CMD" {
            Start-Process cmd.exe
        }
        "Abrir PowerShell" {
            Start-Process powershell.exe
        }
        "Abrir Explorador de Windows" {
            Start-Process explorer.exe
        }
        "Mostrar Archivos Ocultos" {
            ShowHiddenFiles $true
        }
        "Ocultar Archivos Ocultos" {
            ShowHiddenFiles $false
        }
        "Ver Impresoras Instaladas" {
            ShowPrinters
        }
        "Ver Usuarios del Equipo" {
            ShowUsers
        }
        "Ver Información del Sistema" {
            ShowSystemInfo
        }
        "Abrir Navegador Web por Defecto" {
            Start-DefaultBrowser
        }
        "Abrir Bloc de Notas" {
            Start-Process notepad.exe
        }
        "Abrir Calculadora" {
            Start-Process calc.exe
        }
        "Abrir Sticky Notes" {
            Start-Process "shell:AppsFolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"
        }
        "Abrir Paint" {
            Start-Process mspaint.exe
        }
        "Apagar Sistema" {
            Stop-Computer -Force
        }
        "Reiniciar Sistema" {
            Restart-Computer -Force
        }
        "Cerrar Sesión" {
            Stop-Process -Name explorer -Force
            Stop-Process -Name taskmgr -Force
        }
    }
}

# Función para mostrar u ocultar archivos ocultos en el Explorador de Windows
function ShowHiddenFiles {
    param (
        [bool]$show
    )
    if ($show) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1
    } else {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 2
    }
    Stop-Process -Name explorer -Force
    Start-Process explorer.exe
}

# Función para mostrar las impresoras instaladas
function ShowPrinters {
    Get-WmiObject -Query "SELECT * FROM Win32_Printer" | Select-Object Name, DriverName, PortName | Out-GridView -Title "Impresoras Instaladas"
}

# Función para ver los usuarios del equipo
function ShowUsers {
    Get-WmiObject -Class Win32_UserAccount | Select-Object Name, FullName | Out-GridView -Title "Usuarios del Equipo"
}

# Función para ver la información del sistema (memoria RAM y versión del sistema operativo)
function ShowSystemInfo {
    $ram = Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object @{Name="RAM (GB)";Expression={$_.Sum / 1GB -as [int]}}
    $osVersion = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption
    $ram, $osVersion | Out-GridView -Title "Información del Sistema"
}

# Función para abrir el navegador web predeterminado
function Start-DefaultBrowser {
    $shell = New-Object -ComObject "Shell.Application"
    $shell.Open("http://www.google.com")
}

# Crear formulario
$form = New-Object System.Windows.Forms.Form
$form.Text = "Panel de Control"
$form.Size = New-Object System.Drawing.Size(400, 400)

# Crear ComboBox con las opciones
$comboBox = New-Object System.Windows.Forms.ComboBox
$comboBox.Location = New-Object System.Drawing.Point(50, 50)
$comboBox.Size = New-Object System.Drawing.Size(300, 50)

# Agregar opciones al ComboBox
$options = @(
    "Abrir CMD",
    "Abrir PowerShell",
    "Abrir Explorador de Windows",
    "Mostrar Archivos Ocultos",
    "Ocultar Archivos Ocultos",
    "Ver Impresoras Instaladas",
    "Ver Usuarios del Equipo",
    "Ver Información del Sistema",
    "Abrir Navegador Web por Defecto",
    "Abrir Bloc de Notas",
    "Abrir Calculadora",
    "Abrir Sticky Notes",
    "Abrir Paint",
    "Apagar Sistema",
    "Reiniciar Sistema",
    "Cerrar Sesión"
)
$comboBox.Items.AddRange($options)
$form.Controls.Add($comboBox)

# Botón para ejecutar la acción seleccionada
$buttonExecute = New-Object System.Windows.Forms.Button
$buttonExecute.Text = "Ejecutar Acción"
$buttonExecute.Location = New-Object System.Drawing.Point(150, 120)
$buttonExecute.Add_Click({ ExecuteAction })
$form.Controls.Add($buttonExecute)

# Mostrar el formulario
$form.ShowDialog()
