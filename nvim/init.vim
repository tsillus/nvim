" Minimal viable nvim configuration for working with ODIN

" Keep this file clean. It should contain only
" 1. A list of a Plugins installed
" 2. A list of vim files includedi
"
" A reasonable way to organize your settings is by having:
" 1. settings.vim - for all basic vim settings that don't depend on any plugin
" 2. keybinds.vim - for all your custom keybinds
" 3. 1 file for every plugin you're using


call plug#begin(stdpath('data') . '/plugged')

" Syntax Highlighting
Plug 'Tetralux/odin.vim'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'blueshirts/darcula'

Plug 'akinsho/toggleterm.nvim'

" Document Tree
"  Plug 'tomaszj/lexplore.vim'
Plug 'preservim/nerdtree'

" Language Server and auto-completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dense-analysis/ale'


call plug#end()

runtime settings.vim
runtime keybinds.vim
runtime asyncomplete.vim
runtime lua/toggleterm.lua
"  runtime toggleterm.vim

runtime vim-lsp.vim