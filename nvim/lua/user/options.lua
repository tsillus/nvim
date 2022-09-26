-- :help options

vim.opt.clipboard = "unnamed"

vim.opt.cmdheight=2

-- vim.opt.completeopt = {"menuone", "noselect" }
vim.opt.fileencoding="utf-8"

-- " HighLight all matc on previous SEARCH pattern
vim.opt.hlsearch = true

-- " Pop Up Menu HEIGHT
vim.opt.pumheight=10
vim.opt.wildmenu = true

-- filetype on
-- filetype plugin on
-- filetype indent on
-- syntax on

-- " Allow the cursor to move past the new line character for insertion
vim.opt.virtualedit = "onemore"

-- " A line is always a single line
vim.opt.wrap = false

-- " make indenting smarter again
vim.opt.smartindent = true

-- " line numbers
vim.opt.number = true

-- " relative line numbers!
vim.opt.relativenumber = true
vim.opt.numberwidth    = 3

-- " tabs as 4 space
vim.opt.shiftwidth = 4
vim.opt.tabstop    = 4
vim.opt.expandtab  = true

vim.opt.scrolloff  = 8
vim.opt.cursorline = true

vim.opt.signcolumn    = "yes"
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 8

-- Visuals
vim.opt.guifont = "Source_Code_Pro:h12"
vim.opt.termguicolors = true

-- " TODO: maybe move to different file? 
vim.opt.makeprg="odin.exe build main.odin -file -debug -o:minimal"
vim.opt.errorformat="%f(%l:%c) %m"


-- " activate 'luochen1990/rainbow'
-- let g:rainbow_active = 1
