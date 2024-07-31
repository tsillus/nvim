-- local cmp = require("cmp")

-- cmp.mapping.preset.insert({
--    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ["<C-e>"] = cmp.mapping.abort(),
--    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--    ["<S-CR>"] = cmp.mapping.confirm({
--        behavior = cmp.ConfirmBehavior.Replace,
--        select = true,
--    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--})

return {
    autoformat = false,

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "Tetralux/odin.vim",
        },
        ft = { "odin" },
        opts = {
            servers = {
                ols = {},
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
    },
    { "L3MON4D3/LuaSnip" },

    -- colorschemes
    { "blueshirts/darcula" },

    {
        "LazyVim/LazyVim",
        opts = {},
    },
}
