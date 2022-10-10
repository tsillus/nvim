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
