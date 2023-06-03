[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Write-Output "`e[38;2;113;168;33minfra`e[38;2;17;136;204mnaut`e[m"

$colors = @{
        "python"    = "#006400"
        "golang"    = "#00ADD8"
        "odin"      = "#3882d2"
        "infrablue" = "#1188cc"
        "special"   = "#cc0079"
    }

# collecting some favorite colors to use over time.
# 38 means Foreground, 48 means Background
# the following 2 means 24 bit RGB color comes next
$global:text_colors = @{
        "reset" = "`e[m"
        "bgWhite"      = "`e[48;2;255;255;255m"
        "fgRed"        = "`e[38;2;255;0;0m"
        "bgRed"        = "`e[48;2;255;0;0m"
        "fgInfraBlue"  = "`e[38;2;17;136;204m"
        "bgInfraBlue"  = "`e[48;2;17;136;204m"
        "fgInfraGreen" = "`e[38;2;113;168;33m"
        "bgInfraGreen" = "`e[48;2;113;168;33m"
        
}

# TODO: a project will need these future values:
#       title, color, cwd, command(?)
#
$global:projects = [ordered]@{
    "cfg"           = @("nvim config",          $colors["special"],      "D:\nvim\lazyvim\nvim")
}


<# 
.DESCRIPTION
switches into a project folder defined in $global:projects. 
Provides all possible keys when a non-existant project is requested.

.PARAMETER name
any key in $global:projects

.PARAMETER open
open the project in Neovim as well?

.PARAMETER tabnew
open project in a new tab?
#>
function project([string]$name, [switch]$open, [switch]$tabnew) {
    $projects = $global:projects;
    if ($projects.Contains($name)) {

        $title      = $projects[$name][0];
        $color      = $projects[$name][1];
        $directory  = $projects[$name][2];
        if ($tabnew) {
            $command    = "";

            if ($open) {
                $command = "-c nvim .";
            }

            $command = "wt new-tab -d '$directory' --title '$title' --tabColor '$color' $command"
            Write-Host $command
            Invoke-expression $command
        } else {

            Set-Location $directory;
            if ($open -eq $true) {
                Invoke-Expression "nvim ."
            }
        }

    } else {
        # Wrong input. Give some helpful information.
        $maxKeyLength = ($projects.Keys | Measure-Object -Maximum -Property Length).Maximum
        Write-Host "Project does not exist. Available projects:" -ForegroundColor Yellow
        $global:projects.GetEnumerator() | ForEach-Object {
            $name = $_.Name
            $proj = $_.Value
            Write-Host ("`t{0,-$maxKeyLength} :`t {1,-20}`t {2}" -f $name, $proj[0], $proj[2])
            
        }
        Write-Host "'nvim `$PROFILE'" -NoNewline -ForegroundColor Yellow
        Write-Host " to update projects."
    }
}

<#
.SYNOPSIS
Defines the PowerShell prompt:

    <user> @ <path> [<git-branch>]

If <path> cotains more than folders, the least significant folders are abbreviated with a ".". 
#>
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

<#
.SYNOPSIS
Prints the full current working directory and copies it into Clipboard
#>
function cwd {
        $currentDirectory = (pwd).Path 
        $currentDirectory | Set-Clipboard
        Write-Host "Path copied to clipboard: " -NoNewline
        Write-Host $currentDirectory -ForegroundColor Yellow
    }

<#
.SYNOPSIS
activates a virtual environment when in the root folder of a python project.
lists all possible virtual environments when the given one doesn't exist.

.PARAMETER version
python version as anumber. E.g. "311" for a python 3.11 environment in ./.venv311  
#>
function venv([string]$version) {
    if ($version -eq $null) {
        $version = ""
    }
    $folder = ".venv$version"
    if(Test-Path -Path $folder) {
        & "$folder\Scripts\activate"
    } else {
            Write-Host "./$folder not found" -ForegroundColor Red
            Invoke-Expression "ls -Filter .venv*"
        }
}


<#
.SYNOPSIS
Initializes a fresh Windows PC to work with a consistent Neovim setup

.PARAMETER step
    1 - Installs Chocolatey, Windows Terminal, PowerShell 7.x, and Git via wingit 
    2 - Installs lazygit, make, ripgrep, fd, llvm, Cygwin via Chocolatey
    3 - Starts neovim for the first time.
    [default] Print this help
#>
function init([int]$step) {
    if ($step -eq 1) {

        # Install Chocolatey
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


        # Install Windows Terminal and PowerShell
        winget install Microsoft.WindowsTerminal
        winget install Microsoft.PowerShell
        winget install Git

        Write-Host "Step 1 finished. Reopen the Window and continue with step 2"
        return
    }
    if ($step -eq 2) {

        choco install lazygit -y
        choco install make -y
        choco install ripgrep -y
        choco install fd -y
        choco install llvm -y
        choco install Cygwin -y

        # TODO: change both to D:\nvim ?
        setx XDG_CONFIG_HOME $env:LOCALAPPDATA
        setx XDG_DATA_HOME $env:APPDATA

        cd $env:XDG_CONFIG_HOME
        mkdir ./nvim
        cd ./nvim
        git clone https://github.com/tsillus/nvim.git .

        choco install neovim

        Write-Host "Visit https://www.nerdfonts.com/font-downloads, download and install thefont you want to use in Terminal."
        Write-Host "Step 2 Finished. Reopen the window and continue with step 3"
        return
    }

    if($step -eq 3) {
            Invoke-Expression "nvim ."
            return
        }

    Invoke-Expression "Get-Help init -Detailed"
}

