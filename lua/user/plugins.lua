local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim ..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "Could not load packer!"
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded"}
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"


    use 'Tetralux/odin.vim'

    -- color schemes
    use 'morhetz/gruvbox'
    use 'blueshirts/darcula'

    use 'akinsho/toggleterm.nvim'

    -- Document Tree
    --  use 'tomaszj/lexplore.vim'
    use 'preservim/nerdtree'

    -- Language Server and auto-completion
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'RRethy/vim-illuminate'

    -- auto completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'windwp/nvim-autopairs'

    -- snippet engine
    use "L3MON4D3/LuaSnip"
    -- use "rafamadriz/friendly-snippets"

    use 'dense-analysis/ale'

    use 'kyazdani42/nvim-web-devicons' -- Recommended (for coloured icons)
    -- use 'ryanoasis/vim-devicons' Icons without colours
    use { 'akinsho/bufferline.nvim', tag= 'v2.*', }
    use 'nvim-telescope/telescope.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use 'p00f/nvim-ts-rainbow'
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
