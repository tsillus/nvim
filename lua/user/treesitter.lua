
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require 'nvim-treesitter.install'.compilers = { "clang" }

configs.setup {
    ensure_installed = {"python", "lua"},
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { 
        enable = true, 
        disable = { "yaml" },
    },
    rainbow = {
        enable = true,
        -- disbake = { "jsx", "cpp" },
        extended_mode = true,
        max_file_lines = nil,
        -- colors = {}
        -- termcolors = {}
    }
}
