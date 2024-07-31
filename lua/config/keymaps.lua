-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

map("t", "<Esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<C-w>h", { desc = "Move To Left Window" }) -- move window left
map("t", "<C-l>", "<C-w>l", { desc = "Move To Right Window" }) -- move window right
map("t", "<C-k>", "<C-w>k", { desc = "Move To Upper Window" }) -- move window up
map("t", "<C-j>", "<C-w>j", { desc = "Move To Lower Window" }) -- move window down

map("v", "p", '"_dP', {})

map("i", "<C-o>", "<Esc>o")

-- map("i", "<expr> <TAB>", "pumvisible() ? '<C-y>' : '<TAB>'")

local wk = require("which-key")
--
-- NORMAL mode
--
wk.add({
    mode = { "n" },
    { "<leader>r", group = "+Refactor" },
    { "<leader>rm", "va{", desc = "Mark Scope" },
    { "<leader>rM", "va{V", desc = "Mark Scope (full lines" },

    { "<leader>r2", group = "+2 levels" },
    { "<leader>r2m", "v2a{", desc = "Mark Scope" },
    { "<leader>r2M", "v2a{V", desc = "Mark Scope (full lines" },

    { "<leader>r3", group = "+3 levels" },
    { "<leader>r3m", "v3a{", desc = "Mark Scope" },
    { "<leader>r3M", "v3a{V", desc = "Mark Scope (full lines" },

    { "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },
})

wk.add({
    mode = { "n" },
    { "<leader>t", group = "+Terminal" },
    { "<leader>tt", "<C-w>s<C-j>:terminal<cr>", desc = "Open Terminal ↓" },
})

--
-- Database
--
wk.add({
    mode = { "n" },
    { "<leader>Du", "<Cmd>DBUIToggle<Cr>", desc = "Toggle UI" },
    { "<leader>Df", "<Cmd>DBUIFindBuffer<Cr>", desc = "Find buffer" },
    { "<leader>Dr", "<Cmd>DBUIRenameBuffer<Cr>", desc = "Rename buffer" },
    { "<leader>Dq", "<Cmd>DBUILastQueryInfo<Cr>", desc = "Last query info" },
})
