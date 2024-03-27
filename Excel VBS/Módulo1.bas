Attribute VB_Name = "Módulo1"
Sub AbrirCSV()
    Dim ArchivoCSV As String
    Dim CarpetaDescargas As String
    Dim CarpetaDocumentos As String
    Dim LibroCSV As Workbook
    Dim ArchivoActual As String
    Dim Delimitador As String
    
    ' Ruta de la carpeta de descargas del usuario
    CarpetaDescargas = Environ("USERPROFILE") & "\Downloads\"
    
    ' Ruta de la carpeta de documentos del usuario
    CarpetaDocumentos = Environ("USERPROFILE") & "\Documents\"
    
    ' Inicializa el primer archivo CSV en la carpeta de descargas
    ArchivoActual = Dir(CarpetaDescargas & "*.csv")
    
    ' Verifica si se encontró al menos un archivo CSV en la carpeta de descargas
    If ArchivoActual <> "" Then
        ' Procesa cada archivo CSV encontrado en la carpeta de descargas
        Do While ArchivoActual <> ""
            ' Abre el archivo CSV y especifica el formato de los datos
            Set LibroCSV = Workbooks.Add
            ' Determina el delimitador basado en el contenido del archivo
            Delimitador = ","
            Open CarpetaDescargas & ArchivoActual For Input As #1
            InputLine = Input(LOF(1), #1)
            Close #1
            If InStr(InputLine, ";") > 0 Then
                Delimitador = ";"
            End If
            With LibroCSV.Sheets(1).QueryTables.Add(Connection:="TEXT;" & CarpetaDescargas & ArchivoActual, Destination:=LibroCSV.Sheets(1).Range("A1"))
                .TextFileParseType = xlDelimited
                .TextFileConsecutiveDelimiter = False
                .TextFileTabDelimiter = False
                .TextFileSemicolonDelimiter = False
                .TextFileCommaDelimiter = False
                .TextFileOtherDelimiter = Delimitador ' Especifica el delimitador detectado
                .TextFileColumnDataTypes = Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
                .Refresh
            End With
            
            ' Guarda el libro de Excel como un archivo XLSX en la carpeta de documentos
            LibroCSV.SaveAs Filename:=CarpetaDocumentos & Replace(ArchivoActual, ".csv", ".xlsx"), FileFormat:=xlOpenXMLWorkbook
            
            ' Cierra el libro CSV sin guardar cambios
            LibroCSV.Close SaveChanges:=False
            
            ' Obtiene el siguiente archivo CSV en la carpeta de descargas
            ArchivoActual = Dir
        Loop
        
        MsgBox "Se han procesado todos los archivos CSV en la carpeta de descargas.", vbInformation
    Else
        MsgBox "No se encontraron archivos CSV en la carpeta de descargas.", vbExclamation
    End If
End Sub

