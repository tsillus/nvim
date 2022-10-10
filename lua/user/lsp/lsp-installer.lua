local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print "could not load nvim-lsp-installer"
    return
end

 lsp_installer.on_server_ready( function(server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        print "Lua LSP ready."
    end

    if server.name == "ols" then
        local odin_opts = require("user.lsp.ols")
        opts = vim.tbl_deep_extend("force", odin_opts, opts)
        print "OLS LSP ready."
    end

    server:setup(opts)
 end)
