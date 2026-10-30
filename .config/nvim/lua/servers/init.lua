
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "bashls",
        "clangd",
        "c3_lsp",
    },
})

-- Language Server Protocol (LSP)
require("servers.lua_ls")()
require("servers.pyright")()
require("servers.gopls")()
require("servers.bashls")()
require("servers.clangd")()
require("servers.c3_lsp")()

vim.lsp.enable({
    'lua_ls',
    'pyright',
    'gopls',
    'bashls',
    'clangd',
    'c3_lsp',
})
