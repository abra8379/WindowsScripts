# WindowsScripts
Script &amp; batch - Windows 
Descargo de responsabilidad
ADVERTENCIA: ¡ NO me hago responsable de lo que pueda sucederle a su sistema! ¡Ejecute scripts bajo su propia responsabilidad! Además, otras variantes de este repositorio no son técnicamente versiones "nuevas" de este, pero son diferentes en sus respectivas formas. Hay algunos sitios que dicen que otros proyectos son versiones "nuevas" de esto, pero eso es inexacto.

Cómo ejecutar los archivos Windows10Debloater.ps1 y Windows10DebloaterGUI.ps1
Existen diferentes métodos para ejecutar el script de PowerShell. Los métodos son los siguientes:

Primer método
Descargue el archivo .zip en la página principal de GitHub y extraiga el archivo .zip a la ubicación deseada
Una vez extraído, abra PowerShell (o PowerShell ISE ) como administrador
Habilitar la ejecución de PowerShell Set-ExecutionPolicy Unrestricted -Force
Cuando se le solicite, cambie al directorio donde extrajo los archivos: por ejemplo, -cd c:\temp
A continuación, para ejecutar cualquiera de los scripts, ingrese lo siguiente: por ejemplo, -.\Windows10DebloaterGUI.ps1
Segundo método
Descargue el archivo .zip en la página principal de GitHub y extraiga el archivo .zip a la ubicación deseada
Haga clic derecho en el archivo PowerShell que desea ejecutar y haga clic en "Ejecutar con PowerShell".
Esto permitirá que el script se ejecute sin tener que realizar los pasos anteriores, pero Powershell le preguntará si está seguro de que desea ejecutar este script.
Recuerde que este script NECESITA ejecutarse como administrador para funcionar correctamente.

Cómo ejecutar el archivo Windows10SysPrepDebloater.ps1
Para el archivo WindowsSysPrepDebloater.ps1, hay un par de parámetros que puede ejecutar para especificar qué funciones se utilizan. Los parámetros son -SysPrep: -Debloaty -Privacy.

Para ejecutar esto con parámetros, haga lo siguiente:

Descargue el archivo .zip en la página principal de GitHub y extraiga el archivo .zip a la ubicación deseada
Una vez extraído, abra PowerShell (o PowerShell ISE ) como administrador
Cuando se le solicite, cambie al directorio donde extrajo los archivos: por ejemplo, -cd c:\temp
A continuación, para ejecutar cualquiera de los scripts, ingrese lo siguiente:
p.ej -.\Windows10SysPrepDebloater.ps1 -Sysprep -Debloat -Privacy
