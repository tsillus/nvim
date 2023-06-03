-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.api.nvim_exec(
    [[
set shell=pwsh.exe
set shellxquote=
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellquote   = ''
let &shellpipe    = '| Out-File -Encoding UTF8 %s'
let &shellredir   = '| Out-File -Encoding UTF8 %s'
]],
    true
)

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "odin" },
    callback = function()
        vim.b.autoformat = false
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python" },
    callback = function()
        -- TODO: run in float term (use Util)
        map("n", "<leader>tr", "<C-w>s<C-j>:terminal python %<cr>", { desc = "Run current python file" })
        map("n", "<leader>tp", "<C-w>s<C-j>:terminal python -m pytest .<cr>", { desc = "pytest" })
    end,
})
