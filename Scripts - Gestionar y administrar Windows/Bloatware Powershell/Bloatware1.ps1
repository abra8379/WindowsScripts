$AllowList = @(
    '*WindowsCalculator*',
    '*Microsoft.net*',
    '*MicrosoftEdge*',
    '*WindowsStore*',
    '*WindowsTerminal*',
    '*WindowsNotepad*',
    '*Paint*'
)

$Packages = Get-AppxPackage

ForEach($Dependency in $AllowList){
    (Get-AppxPackage  -Name "$Dependency").dependencies | ForEach-Object{
        $NewAdd = "*" + $_.Name + "*"
        if($_.name -ne $null -and $AllowList -notcontains $NewAdd){
            $AllowList += $NewAdd
       }
    }
}

ForEach($App in $Packages){
    $Matched = $false
    Foreach($Item in $AllowList){
        If($App -like $Item){
            $Matched = $true
            break
        }
    }
    
    if($matched -eq $false -and $app.NonRemovable -eq $false){
        Get-AppxPackage -AllUsers -Name $App.Name -PackageTypeFilter Bundle  | Remove-AppxPackage -AllUsers
   }
}
