
colorscheme gruvbox

set clipboard=unnamed
set cmdheight=2

"  set completeopt = ['menuone', 'noselect' ]
set fileencoding='utf-8'

" HighLight all matc on previous SEARCH pattern
set hlsearch

" Pop Up Menu HEIGHT
set pumheight=10
set wildmenu

filetype on
filetype plugin on
filetype indent on
syntax on

" Allow the cursor to move past the new line character for insertion
set virtualedit=onemore

" A line is always a single line
set nowrap

" make indenting smarter again
set smartindent

" line numbers
set number

" relative line numbers!
set relativenumber
set numberwidth=3

" tabs as 4 space
set shiftwidth=4
set tabstop=4
set expandtab

set scrolloff=8
set cursorline

set signcolumn=yes
set scrolloff=8
set sidescrolloff=8

" doesn't seem to work??
set guifont=Source_Code_Pro:h12, 

" TODO: maybe move to different file? 
set makeprg=odin.exe\ build\ main.odin\ -file\ -debug\ -o:minimal
set errorformat=%f(%l:%c)\ %m