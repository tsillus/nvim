# Neovim Basic-IDE on Windows

## Before we start

### Proper Terminal support 

Windows has a `WindowsTerminal` that allows for multiple Terminal tabs in a single window. 
Also, `PowerShell` had a couple of updates and a re-release separate from the verison installed by default.

Note: you don't actually need any of these. The default PowerShell is enough.

```
winget install Microsoft.WindowsTerminal
winget install Microsoft.PowerShell
```

### git

You probably already have it. But in case you don't: git is a version control system you will need to install plugins for neovim.

```
choco install git
```

### lazygit

A separate command line tool to deal with git. Better than most nvim git plugins.

```
choco install lazygit
```


## Installing Dependencies

In order to make all the plugins work you'll need to install a couple of external programs.
It's easy to install them with `chocolatey`, so head over to (chocolatey.org)[http://www.chocolatey.org/install]
and install it. 

After installing install it, you should be able to type `choco -?`. If you can't, close and reopen your PowerShell.
All commands in this readme should be executed in a PowerShell that runs with Administrator rights.


### GnuWin32.make

```
choco install make
```

### ripgrep

Telescope uses `grep` to find stuff in your project. Windows doesn't have grep, so you need to install it:

```
choco install ripgrep
```

### fd

Telescope uses `fd` to find entries in your file-system. Windows doesn't have it by default, so you need to install it:

```
choco install fd
```

### llvm

Treesitter requires a C compiler ((More information)[https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support]).
However, with some compilers treesitter might still run into erros. Using LLVM and `clang` worked on WIndows 10 and 11.

```
choco install llvm
```

### Cygwin

autocomplete uses `man` to call manual pages. Windows doesn't have `man`, so you need to install it:

```
choco install Cygwin
```

### NerdFonts

Nerd Fonts are fonts that are augmented by a lot of little glyphs used to display file types. You can (read more)[https://www.nerdfonts.com]
if you're interested in the details.

To install NerdFonts, choose a folder where to install the nerd-fonts repository:

```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
```

*Note*: This repository takes about 1GB of space. If you don't want to use that much of disk space, you can find different ways of installing the Fonts on
    on their (github page)[https://github.com/ryanoasis/nerd-fonts#font-installation]. 

This will download nerd-fonts into a subfolder `./nerd-fonts`. 

Now you can use the install script to install a specific font, e.g.:

```
./nerd-fonts/install.ps1 JetBrainsMono -WindowsCompatibleOnly
```

This will install every `JetBrainsMono` variant available. Once that is done, open the settings for your PowerShell and change the font used to the NerdFont
you installed.

## Install and Setup Neovim and LunarVim

### Environment Variables

Neovim uses `XDG_CONFIG_HOME` to find `nvim/` and `XDG_DATA_HOME` to find `nvim-data`. 

```
setx XDG_CONFIG_HOME $env:LOCALAPPDATA
setx XDG_DATA_HOME $env:APPDATA
```

Now, close the powershell and open a new one.

### Finally, Install Neovim

```
choco install neovim
```

Start neovim using the `nvim` command. You may have to close and reopen PowerShell. Close neovim (`:q`)

### Download the config 
 
```
cd $env:XDG_CONFIG_HOME
cd ./nvim
git clone https://github.com/tsillus/nvim.git .
nvim .
```

Now neovim should start installing Packer (a package manager for neovim). After that it should also start installing all the plugins.
If it doesn't, just close neovim (`:q`) and reopen it again. 

## Additional Setup within Neovim

Open Neovim. Treesitter needs `c` and `cpp` installed: `:TSInstall c` and `TSInstall cpp`. Close Neovim.



