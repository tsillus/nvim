
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Install Windows Terminal and PowerShell
winget install Microsoft.WindowsTerminal
winget install Microsoft.PowerShell


choco install git

choco install lazygit


choco install make

choco install ripgrep
choco install fd
choco install llvm
choco install Cygwin

Write-Host "Visit https://www.nerdfonts.com/font-downloads, download and install thefont you want to use in Terminal."

# TODO: change both to D:\nvim ?
setx XDG_CONFIG_HOME $env:LOCALAPPDATA
setx XDG_DATA_HOME $env:APPDATA


choco install neovim

cd $env:XDG_CONFIG_HOME
cd ./nvim
git clone https://github.com/tsillus/nvim.git .
nvim .
