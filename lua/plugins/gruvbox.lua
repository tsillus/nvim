vim.o.background = "dark"

return {

    {
        "ellisonleao/gruvbox.nvim",
        config = {

            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = true,
            invert_signs = false,
            invert_tabline = true,
            invert_intend_guides = false,
            inverse = false, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        },
        opts = function()
            local config = require("gruvbox").config
            local colors = require("gruvbox.palette").get_base_colors(vim.o.background, config.contrast)

            -- vim.g.terminal_color_0 = colors.bg0
            -- vim.g.terminal_color_7 = colors.fg4
            -- vim.g.terminal_color_15 = colors.fg1

            vim.g.terminal_color_0 = colors.fg0
            vim.g.terminal_color_7 = colors.bg4
            vim.g.terminal_color_15 = colors.bg1
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
