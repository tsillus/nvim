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
map("t", "<C-h>", "<C-w>h", { desc = "Move To Left Window" }) -- move window left
map("t", "<C-l>", "<C-w>l", { desc = "Move To Right Window" }) -- move window right
map("t", "<C-k>", "<C-w>k", { desc = "Move To Upper Window" }) -- move window up
map("t", "<C-j>", "<C-w>j", { desc = "Move To Lower Window" }) -- move window down

map("v", "p", '"_dP', {})

map("i", "<C-o>", "<Esc>o")

local wk = require("which-key")
--
-- NORMAL mode
--
wk.register({
    r = {
        name = "+Refactor",
        -- <leader>r*m : Mark a Scope
        -- <leader>r*M : Mark a Scope, extend it to full lines
        ["m"] = { "va{", "Mark Scope" },
        ["M"] = { "va{V", "Mark Scope (full lines)" },
        ["2"] = {
            name = "+2 levels",
            ["m"] = { "v2a{", "Mark Scope" },
            ["M"] = { "v2a{V", "Mark Scope (full lines)" },
        },
        ["3"] = {
            name = "+3 levels",
            ["m"] = { "v3a{", "Mark Scope" },
            ["M"] = { "v3a{V", "Mark Scope (full lines)" },
        },
    },
    ["rr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
}, { prefix = "<leader>", mode = "n" })

--
-- VISUAL mode
--
wk.register({
    s = {
        name = "+Surround With",
        ["("] = { "di()<Esc>P", "( ... )" },
        [")"] = { "di()<Esc>P", "( ... )" },
        ["["] = { "di[]<Esc>P", "[ ... ]" },
        ["]"] = { "di[]<Esc>P", "[ ... ]" },
        ["{"] = { "di{}<Esc>P", "{ ... }" },
        ["}"] = { "di{}<Esc>P", "{ ... }" },
        ["<"] = { "di<><Esc>P", "< ... >" },
        [">"] = { "di<><Esc>P", "< ... >" },
    },
}, { prefix = "<leader>", mode = "x" })

--
-- Database
--
wk.register({
    D = {
        name = "Database",
        u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
        f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
        r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
        q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
    },
}, { prefix = "<leader>", mode = "n" })
