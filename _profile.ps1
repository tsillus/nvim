[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$global:projects = @{
        "cfg" = "D:\nvim\lazyvim\nvim"
        "ini" = "D:\projects\odin\ini"
        "da" = "D:\projects\odin\data_adapter\data_adapter"
        "odin" = "D:\odin\lang\Odin"
    }



function project([string]$name) {
    $projects = $global:projects
    $maxKeyLength = ($projects.Keys | Measure-Object -Maximum -Property Length).Maximum
    if ($projects.ContainsKey($name)) {
        Set-Location $projects[$name]
    } else {
        Write-Host "Project does not exist. Available projects:" -ForegroundColor Yellow
        $global:projects.GetEnumerator() | ForEach-Object {
            $name = $_.Name
            $dir = $_.Value
            Write-Host ("`t{0,-$maxKeyLength} :`t {1}" -f $name, $dir)
            
        }
        Write-Host "'nvim `$PROFILE'" -NoNewline -ForegroundColor Yellow
        Write-Host " to update projects."
    }
}
