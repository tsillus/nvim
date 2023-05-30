-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>t", "<C-w>s<C-j>:terminal<cr>", { desc = "Open Terminal" })
map("t", "<Esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<C-w>h", {}) -- move window left
map("t", "<C-l>", "<C-w>l", {}) -- move window right
map("t", "<C-k>", "<C-w>k", {}) -- move window up
map("t", "<C-j>", "<C-w>j", {}) -- move window down

map("n", "<leader>rv", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename Variable" })

map("v", "p", '"_dP', {})

map("n", "<leader>rw", "va{", { desc = "Mark Scope" })
map("n", "<leader>r2w", "v2a{", { desc = "Mark Scope" })
map("n", "<leader>rW", "va{V", { desc = "Mark Scope (full lines)" })
map("n", "<leader>r2W", "v2a{V", { desc = "Mark Scope (full lines)" })

map("i", "<C-o>", "<Esc>o")
