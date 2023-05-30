[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
Set-Alias lvim C:\Users\torst\.local\bin\lvim.ps1
Set-Alias scrivener "C:\Program Files\Scrivener3.exe"


# shorthands for a couple of folders I want to navigate to quickly.
$global:projects = @{
        "cfg"   = "D:\nvim\lazyvim\nvim"
    }


# collecting some favorite colors to use over time.
# 38 means Foreground, 48 means Background
# the following 2 means 24 bit RGB color comes next
$global:colors = @{
        "reset" = "`e[m"
        "fgRed" = "`e[38;2;255;0;0m"
        "bgRed" = "`e[48;2;255;0;0m"
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


function prompt {
    $username = $env:USERNAME
    $location = $(Get-Location)
    $path = $location.Path
    $drive = $location.Drive.Name + ":\"
    $folders = $path.Split("\")
    if ($folders.Count -gt 4) {
        $path = "." * ($folders.Count - 4) + "\" + [string]::Join("\", $folders[-3..-1])
    }
    else {
        $path = [string]::Join("\", $folders[1..$folders.Count])
    }
    $gitBranch = ""
    if ((Get-Command git -ErrorAction SilentlyContinue) -and (git rev-parse --git-dir 2> $null)) {
        try {
            $gitBranch = " [" + $(git symbolic-ref --short HEAD) + "]"
        } catch {}
    }

    Write-Host "$username" -NoNewline -ForegroundColor Magenta
    Write-Host " @ " -NoNewline
    Write-Host "$drive$path" -NoNewline -ForegroundColor Yellow
    Write-Host "${gitBranch}" -NoNewline -ForegroundColor Cyan
    Write-Host ":" -NoNewline
    return " "
}


# colors: 
# Black Gray White
# DarkRed Red DarkYellow Yellow
# DarkBlue Blue DarkCyan Cyan
# DarkGreen Green
# DarkMagenta Magenta
#
function colors {
    $c = $global:colors
    Write-Host " " -NoNewline -BackgroundColor Black
    Write-Host " " -NoNewline -BackgroundColor Gray
    Write-Host " "            -BackgroundColor White

    Write-Host " " -NoNewline -BackgroundColor DarkRed
    Write-Host " " -NoNewline -BackgroundColor Red
    Write-Host " " -NoNewline -BackgroundColor DarkYellow
    Write-Host " "            -BackgroundColor Yellow

    Write-Host " " -NoNewline -BackgroundColor DarkBlue
    Write-Host " " -NoNewline -BackgroundColor Blue
    Write-Host " " -NoNewline -BackgroundColor DarkCyan
    Write-Host " "            -BackgroundColor Cyan

    Write-Host " " -NoNewline -BackgroundColor DarkGreen
    Write-Host " " -NoNewline -BackgroundColor Green
    Write-Host " " -NoNewline -BackgroundColor DarkMagenta
    Write-Host " "            -BackgroundColor Magenta

    Write-Host "$($c.fgRed)Red Foreground$($c.reset)$($c.bgRed)Red Background"


}

