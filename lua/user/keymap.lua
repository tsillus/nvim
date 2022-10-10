local noremap = {noremap = true, silent = true}
local map = {noremap = false, silent = true}

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", noremap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- INSERT mode

keymap("i", "<C-c>", "<Esc>", noremap)
keymap("i", "<C-o>", "<Esc>o", noremap)


-- " --------------------------------------
-- " VISUAL mode
-- " don't leave visual mode when (un)indenting
keymap("v", "<", "<gv", noremap)
keymap("v", ">", ">gv", noremap)

-- " move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", noremap)
keymap("v", "<A-k>", ":m .-2<CR>==", noremap)

-- " Keep the pasted text in the register
keymap("v", "p", '"_dP', noremap)


-- " --------------------------------------
-- " VISUAL BLOCK mode

-- " Move text up and down
keymap("x", "J",     ":move '>+1<CR>gv-gv", noremap)
keymap("x", "K",     ":move '<-2<CR>gv-gv", noremap)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", noremap)
keymap("x", "<A-k>", ":move '>-2<CR>gv-gv", noremap)

-- " --------------------------------------
-- " NORMAL mode
-- " Easy hjkl window navigation
keymap("n", "<C-h>", "<C-w>h", noremap)
keymap("n", "<C-j>", "<C-w>j", noremap)
keymap("n", "<C-k>", "<C-w>k", noremap)
keymap("n", "<C-l>", "<C-w>l", noremap)

-- " format code
keymap("n", "<A-c>", "<md>vim.lsp.buf.format()<cr>", noremap)

-- " Switch Buffer with window keys
keymap("n", "<C-Up>",               ":resize -2<CR>", noremap)
keymap("n", "<C-Down>",             ":resize +2<CR>", noremap)
keymap("n", "<C-Left>",   ":vertical :resize -2<CR>", noremap)
keymap("n", "<C-Right>",  ":vertical :resize +2<CR>", noremap)

-- " navigate between buffers
keymap("n", "<S-l>",  ":bnext<CR>", noremap)
keymap("n", "<S-h>",  ":bprevious<CR>", noremap)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", noremap)
keymap("n", "<leader>b", ":bdelete<cr>", noremap) -- close current buffer


-- " using Telescope

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", noremap)
keymap("n", "<leader>ft", "<cmd>Telescope grep_string<cr>", noremap)
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", noremap)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", noremap)


-- Git

keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", noremap)

-- " --------------------------------------   
-- " TERMINAL mode
keymap("t", "<Esc>",  "<C-\\><C-n>", noremap)
keymap("t", "jk",  "<C-\\><C-n>", noremap)
keymap("t", "kj",  "<C-\\><C-n>", noremap)


-- " ODIN keybinds

-- map <F2> byw/@1<CR>:noh<CR>
-- map <S-F2> byw/@0<CR>:noh<CR>
-- map <C-F2> byw/@0<CR>:noh<CR>
