# LunarVim on Windows

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

In order to make all the plugins work you'll need to install a couple of external program.
It's easy to install them with `chocolatey`, so head over to (chocolatey.org)[http://www.chocolatey.org/install]
and install it. 

After installing install it, you should be able to type `choco -?`. If you can'T, close and reopen your terminal.
All commands in this readme should be executed in a PowerShell run as Administrator.


### GnuWin32.make

```
choco install make
```

### ripgrep

Telescope uses `grep` to find stuff in your project. Windows doesn't have grep, so you need to install it:

```
choco install ripgrep
```

### llvm

Treesitter requires a C compiler ((More information)[https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support]).
However, with some compilers treesitter might still run into erros. Using LLVM and `clang` worked on WIndows 10 and 11.

```
choco install llvm
```

- close nvim
- close and reopen PowerShell
- `:TSInstall c`, `:TSInstall cpp`


### Cygwin

autocomplete uses `man` to call manual pages. Windows doesn't have `man`, so you need to install it:

```
choco install Cygwin
```

### NerdFonts

Nerd Fonts are fonts that are augmented by a lot of little glyphs used t to display file types. You can (read more)[https://www.nerdfonts.com]
if you're interested in the details.

To install NerdFonts, choose a folder where to install the nerd-fonts repository:

```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
```

*Note*: This repository takes about 1GB of space. If you don't want to use that much of disk space, you can find different ways of installing the Fontson
    on their (github page)[https://github.com/ryanoasis/nerd-fonts#font-installation]. 

This will install nerd-fonts into a subfolder `./nerd-fonts`. 

Now you can use  the install script to install a specific font, e.g.:

```
./nerd-fonts/install.ps1 JetBrainsMono -WindowsCompatibleOnly
```

This will install every `JetBrainsMono` variant available. There are a lot of other Fonts.

## Install and Setup Neovim and LunarVim

### Environment Variables

Neovim uses `XDG_CONFIG_HOME` to find `nvim/` and `XDG_DATA_HOME` to find `nvim-data`. 

```
choco install neovim
```
