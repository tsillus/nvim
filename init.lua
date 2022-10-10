for _, source in ipairs {
    "user.autopairs",
    "user.cmp",
    "user.colorscheme",
    "user.keymap",
    "user.lualine",
    "user.nvim-tree",
    "user.options",
    "user.plugins",
    "user.project",
    "user.lsp",
    "user.toggleterm",
    "user.treesitter",
    "user.which-key",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'odin',
    callback = function()

        vim.lsp.start({
            name = "ols",
            cmd = {"ols"},
            root_dir = vim.fs.dirname(vim.fs.find({"ols.json"}, {upward = true})[1]),
        })
    end,
})
