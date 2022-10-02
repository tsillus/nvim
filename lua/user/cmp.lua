
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print "could not load cmp"
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok  then
    print "could not load luasnip"
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- TODO: add kind_icons  (see YT Neovim - Completion Tutorial 100% Lua)
-- local kind_icons = {
--    Text = "T",
--    Method = "m",
--    Function = "f()",
--    Constructor = "new",
--    Field = "",
--    Variable = "",
--    Class = "",
--    Interface = "",
--    Module = "",
--    Property = "",
--    Unit = "",
--    Value = "",
--    Enum = "",
--    Keyword = "",
--    Snippet = "",
--    Color = "",
--    File = "",
--    Reference = "",
--    Folder = "",
--    EnumMember = "",
--    Constant = "",
--    Struct = "",
--    Event = "",
--    Operator = "",
--    TypeParameter = "",
--  }

cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1),{ "i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping( function(fallback) 
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping( function(callback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
    },
    formatting = { 
        fields = { "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = ({
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- TODO: add documentation border
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
}

