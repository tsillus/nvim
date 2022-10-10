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
    use ("wbthomason/packer.nvim")
    use ("nvim-lua/popup.nvim")
    use ("nvim-lua/plenary.nvim")
    use ('kyazdani42/nvim-web-devicons') -- Recommended (for coloured icons)
    use ({"nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })


    use ('Tetralux/odin.vim')
    use ("DanielGavin/ols")

    -- color schemes
    use ('morhetz/gruvbox')
    use ('blueshirts/darcula')


    -- Document Tree
    --  use 'tomaszj/lexplore.vim'
    use ('nvim-tree/nvim-tree.lua')

    -- Language Server and auto-completion
    use ('neovim/nvim-lspconfig')
    use ('williamboman/nvim-lsp-installer')
    use ('RRethy/vim-illuminate')

    -- auto completion
    use ('hrsh7th/nvim-cmp')
    use ('hrsh7th/cmp-buffer')
    use ('hrsh7th/cmp-path')
    use ('hrsh7th/cmp-cmdline')
    use ('hrsh7th/cmp-nvim-lsp')
    use ('saadparwaiz1/cmp_luasnip')
    use ('windwp/nvim-autopairs')

    use ('folke/which-key.nvim')

    -- snippet engine
    use ("L3MON4D3/LuaSnip")
    -- use "rafamadriz/friendly-snippets"

    use ('dense-analysis/ale')

    -- Terminal
    use ('akinsho/toggleterm.nvim')


    use ({ 'akinsho/bufferline.nvim', tag= 'v2.*', })
    use ('nvim-telescope/telescope.nvim')
    use ('ahmedkhalf/project.nvim')

    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use ('p00f/nvim-ts-rainbow')

    -- git

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
