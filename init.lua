for _, source in ipairs {
    "user.options",
    "user.keymap",
    "user.plugins",
    "user.colorscheme",
    "user.cmp",
    "user.lsp",
    "user.treesitter",
    "user.autopairs",
    -- "core.options",
    -- "core.bootstrap",
    -- "core.plugins",
    -- "core.autocmds",
    -- "core.mappings",
    -- "configs.which-key-register",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end
